//
//  DetailsViewController.swift
//  CityGuideApp
//
//  Created by Erdem Özkök on 20.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    var selectedCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedCity?.image
        cityLabel.text = selectedCity?.name
        regionLabel.text = selectedCity?.region
    }
    


}
