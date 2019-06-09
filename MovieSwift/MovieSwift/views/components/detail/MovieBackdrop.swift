//
//  MovieBackdrop.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 09/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct MovieBackdrop: View {
    @EnvironmentObject var state: AppState
    let movieId: Int
    var movie: Movie! {
        return state.moviesState.movies[movieId]
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            MovieDetailImage(imageLoader: ImageLoader(poster: movie.backdrop_path,
                                                      size: .original))
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.25)
                .blur(radius: 5)
                .frame(height: 80)
            HStack {
                VStack(alignment: .leading) {
                    Text(movie.original_title)
                        .fontWeight(.bold)
                        .font(.title)
                        .color(.white)
                        .lineLimit(nil)
                    HStack {
                        Text(movie.release_date.prefix(4))
                            .font(.subheadline)
                            .color(.white)
                        if movie.runtime != nil {
                            Text("• \(movie.runtime!) minutes")
                                .font(.subheadline)
                                .color(.white)
                        }
                        if movie.status != nil {
                            Text("• \(movie.status!)")
                                .font(.subheadline)
                                .color(.white)
                        }
                    }
                }
                }
                .padding(.leading)
                .padding(.bottom)
            
            }.listRowInsets(EdgeInsets())
    }
}


struct MovieDetailImage : View {
    @State var imageLoader: ImageLoader
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(500/300, contentMode: .fit)
            } else {
                Rectangle()
                    .aspectRatio(500/300, contentMode: .fit)
                    .foregroundColor(.gray)
            }
            }.onAppear {
                self.imageLoader.loadImage()
        }
    }
}


#if DEBUG
struct MovieBackdrop_Previews : PreviewProvider {
    static var previews: some View {
        MovieBackdrop(movieId: sampleMovie.id).environmentObject(sampleStore)
    }
}
#endif
