//
//  PopularityBadge.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 16/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct PopularityBadge : View {
    let score: Int
    
    var scoreColor: Color {
        get {
            if score < 40 {
                return .red
            } else if score < 60 {
                return .orange
            } else if score < 80 {
                return .yellow
            }
            return .green
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 40)
                .overlay((Circle().stroke(scoreColor, lineWidth: 2)))
            Text("\(score)%").font(Font.system(size: 10)).fontWeight(.light)
            }.frame(width: 40, height: 40)
    }
}

#if DEBUG
struct PopularityBadge_Previews : PreviewProvider {
    static var previews: some View {
        PopularityBadge(score: 80)
    }
}
#endif
