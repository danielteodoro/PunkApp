//
//  BeerListViewModel.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import Foundation

protocol BeerListViewModelDelegate {
    func didLoadBeers()
    func errorOnLoadingBeers(error: Error)
}

class BeerListViewModel {
    
    var service: WebServicing
    
    var delegate: BeerListViewModelDelegate?
    
    var beerListVM = [BeerViewModel]()
    
    init(service: WebServicing = PunkService()) {
        self.service = service
        loadBeerList()
    }
    
    func loadBeerList() {
        service.fetchBeerList() { [weak self] result in
            switch result {
            case .success(let beerList):
                self?.beerListVM = beerList.map(BeerViewModel.init)
                self?.delegate?.didLoadBeers()
            case .failure(let error):
                self?.delegate?.errorOnLoadingBeers(error: error)
            }
        }
    }
}
