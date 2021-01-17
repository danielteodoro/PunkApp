//
//  BeerListTableViewCell.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerAbvLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.beerImageView.image = nil
        self.beerNameLabel.text = ""
        self.beerAbvLabel.text = ""
    }
    
    func presentData(beerVM: BeerViewModel) {
        self.beerNameLabel.text = beerVM.name
        self.beerAbvLabel.text = beerVM.alcoholContent
        
        if let urlPhoto = beerVM.beerImageURL {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: urlPhoto)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.beerImageView.image = image
                    }
                } catch _ {
                    print("error downloading image")
                }
            }
        }
    }
}
