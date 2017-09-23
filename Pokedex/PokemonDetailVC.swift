//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Fei Liang on 9/21/17.
//  Copyright © 2017 Fei Liang. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!

    @IBOutlet weak var typeLbl: UILabel!

    @IBOutlet weak var defenseLbl: UILabel!

    @IBOutlet weak var heightLbl: UILabel!

    @IBOutlet weak var pokedexLbl: UILabel!

    @IBOutlet weak var weightLbl: UILabel!

    @IBOutlet weak var attackLbl: UILabel!

    @IBOutlet weak var currentEvoImg: UIImageView!

    @IBOutlet weak var nextEvoImg: UIImageView!

    @IBOutlet weak var evoLbl: UILabel!




    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        nameLbl.text = pokemon.name.capitalized

        let pokeImage = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = pokeImage
        currentEvoImg.image = pokeImage

        pokedexLbl.text = "\(pokemon.pokedexId)"


        pokemon.downloadPokemonDetail {
            // be called after download completed

            print("arrive here")
            self.updateUI()
        }

    }

    func updateUI(){

        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description

        if pokemon.nextEvolutionId == ""{

            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true

        } else {

            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)

            let evoTitle = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = evoTitle

        }

    }


    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }





}
