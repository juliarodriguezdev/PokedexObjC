//
//  PokemonViewController.swift
//  PokedexObjC
//
//  Created by Julia Rodriguez on 7/2/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    // landing pad
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self

    }
    func updateViews() {
        
        // unwrap pokemon landing pad
        guard let pokemon = pokemon else { return }
        
        nameLabel.text = pokemon.pokemonName
        pokemonIDLabel.text = "ID: \(pokemon.identifier)"
        pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
    
    }

}

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DVMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    
}
