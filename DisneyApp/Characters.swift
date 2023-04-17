//
//  Characters.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//

import Foundation

struct Characters: Codable {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let name: String
    let imageURL: String
}
