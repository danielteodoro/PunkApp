//
//  BeerModel.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import Foundation

class BeerModel: Codable {
    
    var id: Int
    var name: String
    var imageUrl: String
    var tagline: String
    var description: String
    var abv: Float
    var ibu: Float?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl =  "image_url"
        case tagline = "tagline"
        case description = "description"
        case abv = "abv"
        case ibu = "ibu"
    }
    
}
