//
//  PokemonController.swift
//  Pokedex
//
//  Created by handje on 4/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in
            DispatchQueue.main.async {
                guard let pokemon = pokemon else { return }
                self.nameLabel.text = pokemon.name.capitalized
                self.idLabel.text = "ID: \(pokemon.id)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))" 
            }
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
}
