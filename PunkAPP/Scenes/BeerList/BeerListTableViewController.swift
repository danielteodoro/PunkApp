//
//  BeerListTableViewController.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import UIKit

class BeerListTableViewController: UITableViewController {
    
    let vm = BeerListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        vm.delegate = self
        registerCells()
    }
    
    func registerCells() {
        let beerCellNib = UINib(nibName: String(describing: BeerListTableViewCell.self), bundle: nil)
        self.tableView.register(beerCellNib, forCellReuseIdentifier: String(describing: BeerListTableViewCell.self))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.beerListVM.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BeerListTableViewCell.self), for: indexPath) as! BeerListTableViewCell

        cell.presentData(beerVM: vm.beerListVM[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openBeerDetails(for: vm.beerListVM[indexPath.row])
    }
    
    func openBeerDetails(for beerVM: BeerViewModel) {
        let beerDetailsViewController = BeerDetailsViewController.instantiate(with: beerVM)
        self.navigationController?.show(beerDetailsViewController, sender: nil)
    }
}

extension BeerListTableViewController: BeerListViewModelDelegate {
    func didLoadBeers() {
        self.tableView.reloadData()
    }
    
    func errorOnLoadingBeers(error: Error) {
        print(error)
    }
}
