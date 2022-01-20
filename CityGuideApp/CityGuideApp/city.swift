//
//  city.swift
//  CityGuideApp
//
//  Created by Erdem Özkök on 20.01.2022.
//

import Foundation
import UIKit

class City{
    
    var name: String
    var image: UIImage
    var region: String
    
    init(name: String, image: String, region: String) {
        
        self.name = name
        self.image = UIImage(named: image)!
        self.region = region
        
    }
    
}
