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
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.beerListVM.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = vm.beerListVM[indexPath.row].name

        return cell
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
