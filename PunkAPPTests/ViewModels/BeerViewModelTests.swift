//
//  BeerViewModelTests.swift
//  PunkAPPTests
//
//  Created by Daniel Teodoro on 17/01/21.
//

import XCTest
@testable import PunkAPP

class BeerViewModelTests: XCTestCase {

    let vm: BeerViewModel = BeerViewModel(beer: BeerModel(id: 1, name: "IPA Beer", imageUrl: "image.com/image", tagline: "tag", description: "It's good beer", abv: 3.0, ibu: 3.0))
    
    func testName() {
        XCTAssertEqual(vm.name, "IPA Beer")
    }
    
    func testbeerImageURL() {
        XCTAssertEqual(vm.beerImageURL, URL(string: "image.com/image"))
    }
    
    func testTagline() {
        XCTAssertEqual(vm.tagline, "tag")
    }
    
    func testDescription() {
        XCTAssertEqual(vm.description, "It's good beer")
    }
    
    func testAlcoholContent() {
        XCTAssertEqual(vm.alcoholContent, "ABV: 3.0%")
    }
    
    func testBitterness() {
        XCTAssertEqual(vm.bitterness, "IBU: 3.0")
    }

}
