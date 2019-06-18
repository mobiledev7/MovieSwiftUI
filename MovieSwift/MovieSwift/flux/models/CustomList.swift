//
//  CustomList.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 18/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomList: Codable, Identifiable {
    let id = UUID()
    var name: String
    var cover: Int
    var movies: [Int]
}
