//
//  BeerViewModel.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import Foundation

class BeerViewModel {
    
    var beer: BeerModel
    
    init(beer: BeerModel) {
        self.beer = beer
    }
    
    var name: String {
        return self.beer.name
    }
    
    var alcoholContent: String {
        return String("Conteúdo alcoólico: \(self.beer.abv)%")
    }

}
