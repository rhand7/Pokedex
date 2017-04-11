//
//  PokemonController.swift
//  Pokedex
//
//  Created by handje on 4/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }
        
        let searchURL = url.appendingPathComponent(searchTerm.lowercased()) 
        
        NetworkController.performRequest(for: searchURL, httpMethod: .get) { (data, error) in
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {
                    NSLog("No data returned from network request")
                    completion(nil)
                    return
            }
            
                guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data,
                                                                        options: .allowFragments)) as? [String: Any] else {
                    completion(nil)
                    return
            }
            
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon) 
        }
    }
}
