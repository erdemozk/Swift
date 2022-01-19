//
//  ViewController.swift
//  Sayaclar
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var kalanZaman = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kalanZaman = 15
        label.text = "Time: \(kalanZaman)"
        
        
    }

    @IBAction func startTime(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFonc), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFonc (){
        label.text = "Time: \(kalanZaman)"
        
        kalanZaman -= 1
        
        if kalanZaman == 0 {
            label.text = "Time is over"
            timer.invalidate()
            kalanZaman = 15
        }
    }
    

}

