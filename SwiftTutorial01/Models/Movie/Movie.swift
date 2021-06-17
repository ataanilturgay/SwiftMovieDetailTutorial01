//
//  Movie.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let name: String
    let description: String
    let imdbScore: String
    let genre: String
    let year: String
    let director: String
    let imageUrl: String
    let isFavorited: Bool
}
