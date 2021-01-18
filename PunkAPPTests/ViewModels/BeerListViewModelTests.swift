//
//  BeerListViewModelTests.swift
//  PunkAPPTests
//
//  Created by Daniel Teodoro on 17/01/21.
//

import XCTest
@testable import PunkAPP

enum ServiceError: Error {
    case generic
}

class PunkServiceMock: PunkServicing {
    
    var result: Result<[BeerModel], Error> = .failure(ServiceError.generic)
    
    func fetchBeerList(completion: @escaping (Result<[BeerModel], Error>) -> Void) {
        completion(result)
    }
}

class BeerListViewModelDelegateMock: BeerListViewModelDelegate {
    
    var errorOnLoadingBeersCount = 0
    var didLoadBeersCount = 0
    
    func didLoadBeers() {
        didLoadBeersCount += 1
    }
    
    func errorOnLoadingBeers(error: Error) {
        errorOnLoadingBeersCount = 1
    }
    
}

class BeerListViewModelTests: XCTestCase {

    private let serviceMock = PunkServiceMock()
    private let delegate = BeerListViewModelDelegateMock()
    lazy var vm: BeerListViewModel = {
        let vm = BeerListViewModel(service: serviceMock)
        vm.delegate = delegate
        return vm
    }()
    
    func testErrorResponse() {
        vm.loadBeerList()
        XCTAssertEqual(delegate.errorOnLoadingBeersCount, 1)
    }
    
    func testSuccess() {
        serviceMock.result = .success([BeerModel(id: 1, name: "IPA Beer", imageUrl: "image.com/image", tagline: "tag", description: "It's good beer", abv: 3.0, ibu: 3.0)])
        
        vm.loadBeerList()
        
        XCTAssertEqual(delegate.didLoadBeersCount, 1)
    }
    
    
}
