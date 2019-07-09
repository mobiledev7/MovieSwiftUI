//
//  CustomListDetail.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 19/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct CustomListDetail : View {
    @EnvironmentObject var store: Store<AppState>
    
    let listId: Int
    
    @State private var isEditing = false
    
    var list: CustomList {
        return store.state.moviesState.customLists[listId]!
    }
    
    var body: some View {
        MoviesList(movies: list.movies.sortedMoviesIds(by: .byReleaseDate, state: store.state),
                   displaySearch: false,
                   headerView: AnyView(CustomListHeaderRow(listId: listId)))
            .navigationBarItems(trailing: (
                PresentationLink(destination: CustomListForm(editingListId: listId,
                                                             shouldDismiss: nil).environmentObject(store),
                                 label: {
                    Text("Edit").color(.steam_gold)
                })
            ))
            .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct CustomListDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomListDetail(listId: sampleStore.state.moviesState.customLists.first!.key)
                .environmentObject(sampleStore)
        }
    }
}
#endif
