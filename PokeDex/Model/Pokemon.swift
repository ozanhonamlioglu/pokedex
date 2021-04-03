//
//  Pokemon.swift
//  PokeDex
//
//  Created by ozan honamlioglu on 2.04.2021.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "poison"),
    .init(id: 0, name: "Ivysaur", imageUrl: "1", type: "poison"),
    .init(id: 0, name: "Venusaur", imageUrl: "1", type: "poison"),
    .init(id: 0, name: "Charmander", imageUrl: "1", type: "poison"),
    .init(id: 0, name: "Charmeleon", imageUrl: "1", type: "poison"),
    .init(id: 0, name: "Charizard", imageUrl: "1", type: "poison"),
]
