//
//  DetailsViewController.swift
//  SuperHeroBook
//
//  Created by Erdem Özkök on 20.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedSuperHeroName = ""
    var selectedSuperHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = selectedSuperHeroName
        imageView.image = UIImage(named: selectedSuperHeroImageName)
        
    }
    
}
