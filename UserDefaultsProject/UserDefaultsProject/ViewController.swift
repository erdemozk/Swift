//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var notTextField: UITextField!
    @IBOutlet weak var zamanTextField: UITextField!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var zamanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "NOTTEXT")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "ZAMANTEXT")
        
        
        // as -> casting Any değerindeki veriyi string olarak kaydetmeye çalışmak
        if let gelenNot = kaydedilenNot as? String {
            notLabel.text = "Yapılacak İş: \(gelenNot)"
        }
        
        if let gelenZaman = kaydedilenZaman as? String {
            zamanLabel.text = "Yapılacak Zaman: \(gelenZaman)"
        }
    }
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        UserDefaults.standard.set(notTextField.text!, forKey: "NOTTEXT")
        UserDefaults.standard.set(zamanTextField.text!, forKey: "ZAMANTEXT")
        
        notLabel.text = "Yapılacak İş: \(notTextField.text!)"
        zamanLabel.text = "Yapılacak Zaman: \(zamanTextField.text!)"
        
        notTextField.text = ""
        zamanTextField.text = ""
        
    }
    
    @IBAction func silTiklandi(_ sender: Any) {
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "NOTTEXT")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "ZAMANTEXT")
        
        if (kaydedilenNot as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "NOTTEXT")
            notLabel.text = "Yapılacak İş:"
        }
        
        if (kaydedilenZaman as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "ZAMANTEXT")
            zamanLabel.text = "Yapılacak Zaman:"
        }
        
        
    }
    

}

