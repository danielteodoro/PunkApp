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
    
    var tagline: String {
        return self.beer.tagline
    }
    
    var description: String {
        return self.beer.description
    }
    
    var bitterness: String {
        if let bitterness: Float = self.beer.ibu {
            return String("Amargura: \(bitterness)")
        } else {
            return("Amargura não especificada")
        }
    }
    
    var alcoholContent: String {
        return String("C.A.: \(self.beer.abv)%")
    }
    
    var beerImageURL: URL? {
        return URL(string: beer.imageUrl)
    }

}
