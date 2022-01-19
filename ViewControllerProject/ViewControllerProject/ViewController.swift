//
//  ViewController.swift
//  ViewControllerProject
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birinciLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var alinanSifre = ""
    
    @IBAction func kontrolEtTiklandi(_ sender: Any) {
        
        alinanSifre = textField.text!
        
        if alinanSifre == "erdem" {
            
            birinciLabel.text = "Şifreniz Doğru"
            performSegue(withIdentifier: "toSecondVC", sender: nil)
            
        } else {
            
            birinciLabel.text = "Şifreniz Yanlış"
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        birinciLabel.text = "Birinci View Controller"
        textField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let destinationVC = segue.destination as! IkinciViewController
            destinationVC.verilenSifre = alinanSifre
        }
    }
    
}

