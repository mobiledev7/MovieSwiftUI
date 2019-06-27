//
//  Tabbar.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 07/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

// MARK:- Shared View
struct HomeView: View {
    #if targetEnvironment(UIKitForMac)
    var body: some View {
        SplitView()
    }
    #else
    var body: some View {
        TabbarView()
    }
    #endif
}

// MARK: - iOS implementation
struct TabbarView: View {
    @State var selectedTab = Tab.movies
    
    enum Tab: Int {
        case movies, discover, myLists
    }
    
    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(image)
            Text(text)
        }
    }
    
    var body: some View {
        TabbedView(selection: $selectedTab) {
            MoviesHome().tabItemLabel(tabbarItem(text: "Movies", image: "icon-movies")).tag(Tab.movies)
            DiscoverView().tabItemLabel(tabbarItem(text: "Discover", image: "icon-discover")).tag(Tab.discover)
            MyLists().tabItemLabel(tabbarItem(text: "My lists", image: "icon-my-lists")).tag(Tab.myLists)
            }
            .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - MacOS implementation
struct SplitView: View {
    @State var selectedMenu: OutlineMenu = .popular
    
    var contentView: some View {
        return Group {
            if selectedMenu == .popular {
                NavigationView{ PopularList() }
            } else if selectedMenu == .topRated {
                NavigationView{ TopRatedList() }
            } else if selectedMenu == .upcoming {
                NavigationView{ UpcomingList() }
            } else if selectedMenu == .nowPlaying {
                NavigationView{ NowPlayingList() }
            } else if selectedMenu == .discover {
                DiscoverView()
            } else if selectedMenu == .wishlist || selectedMenu == .seenlist || selectedMenu  == .myLists {
                MyLists()
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            List(OutlineMenu.allCases) { menu in
                OutlineRow(item: menu, selectedMenu: self.$selectedMenu)
                }
                .frame(width: 250)
            Spacer().frame(width: 1).foregroundColor(.secondary)
            contentView
        }
    }
}

#if DEBUG
struct Tabbar_Previews : PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(sampleStore)
    }
}
#endif
