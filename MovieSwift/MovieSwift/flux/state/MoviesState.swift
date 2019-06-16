//
//  MoviesState.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 06/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

struct MoviesState: FluxState, Codable {
    var movies: [Int: Movie] = [:]
    var recommanded: [Int: [Int]] = [:]
    var similar: [Int: [Int ]] = [:]
    var popular: [Int] = []
    var topRated: [Int] = []
    var upcoming: [Int] = []
    var search: [String: [Int]] = [:]
    
    var wishlist: Set<Int> = Set()
    var seenlist: Set<Int> = Set()
    
    var genres: [Int: [Int]] = [:]
    var reviews: [Int: [Review]] = [:]
    
    enum CodingKeys: String, CodingKey {
        case movies, wishlist, seenlist
    }
}
