//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var change = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changeImage(){
        
        if change == false{
            imageView.image = UIImage(named: "ankara")
            label.text = "Ankara"
            change = true
        } else{
            imageView.image = UIImage(named: "istanbul")
            label.text = "İstanbul"
            change = false
        }
        
    }


}

