//
//  ViewController.swift
//  LayoutProjesi
//
//  Created by Erdem Özkök on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var benimDegisken = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var benimDegisken = 5
        print(benimDegisken)
        print(self.benimDegisken)
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        // Label
        let myLabel = UILabel()
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - 30, width: width * 0.8, height: 60)
        view.addSubview(myLabel)
        
        // Button
        
        let myButton = UIButton()
        myButton.setTitle("Benim Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width * 0.5 - 100, y: height * 0.65 - 50, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.benimFonksiyonum), for: UIControl.Event.touchUpInside)
        
    }
    
    @IBAction func benimFonksiyonum() {
        print("kullanıcı button'a tıkladı")
    }


}

