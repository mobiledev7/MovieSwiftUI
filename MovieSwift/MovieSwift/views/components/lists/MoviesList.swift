//
//  MoviesList.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 09/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct MoviesList : View {
    @EnvironmentObject var state: AppState
    @State var searchtext: String = ""
    
    let movies: [Int]
    
    var isSearching: Bool {
        return !searchtext.isEmpty
    }
    
    var searchedMovies: [Int] {
        return state.moviesState.search[searchtext] ?? []
    }
    
    var body: some View {
        VStack {
            List {
                TextField($searchtext,
                          placeholder: Text("Search any movies")) {
                            store.dispatch(action: MoviesActions.FetchSearch(query: self.searchtext))
                    }
                    .textFieldStyle(.roundedBorder)
                    .listRowInsets(EdgeInsets())
                    .padding()
                ForEach(isSearching ? searchedMovies : movies) {id in
                    NavigationButton(destination: MovieDetail(movieId: id)) {
                        MovieRow(movieId: id)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MoviesList_Previews : PreviewProvider {
    static var previews: some View {
        MoviesList(movies: [sampleMovie.id]).environmentObject(sampleStore)
    }
}
#endif
