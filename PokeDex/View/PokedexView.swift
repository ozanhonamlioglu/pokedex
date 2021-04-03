//
//  PokedexView.swift
//  PokeDex
//
//  Created by ozan honamlioglu on 2.04.2021.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        let keys = viewModel.pokemon.map{$0.key}
        let values = viewModel.pokemon.map {$0.value}
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
//                    ForEach(viewModel.pokemon, id: \.self) { id in
//                        PokemonCell(pokemon: viewModel.pokemon[id])
//                    }
                    
                    ForEach(keys.indices) {index in
                        PokemonCell(pokemon: values[index])
                    }
                    
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokedexView()
        }
    }
}
