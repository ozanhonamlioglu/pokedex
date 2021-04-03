//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by ozan honamlioglu on 3.04.2021.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [String: Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPekemon()
    }
    
    func fetchPekemon() {
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            do {
                let pokemon = try JSONDecoder().decode([String: Pokemon].self, from: data)
                print("FUCK", pokemon)
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                }
                
            } catch {
                print("FUCK", error)
            }
            // guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }

        }.resume()
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
