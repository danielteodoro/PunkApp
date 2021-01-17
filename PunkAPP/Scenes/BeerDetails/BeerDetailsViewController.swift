//
//  BeerDetailsViewController.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    var vm: BeerViewModel?

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerBitternessLabel: UILabel!
    @IBOutlet weak var beerAlcoholContentLabel: UILabel!
    
    internal static func instantiate(with beerVM: BeerViewModel) -> BeerDetailsViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BeerDetailsViewController") as! BeerDetailsViewController
        vc.vm = beerVM
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }
    
    func setContent() {
        self.beerNameLabel.text = vm?.name
        self.beerTaglineLabel.text = vm?.tagline
        self.beerDescriptionLabel.text = vm?.description
        self.beerBitternessLabel.text = vm?.bitterness
        self.beerAlcoholContentLabel.text = vm?.alcoholContent
        
        if let urlPhoto = vm?.beerImageURL {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
