//
//  ViewController.swift
//  DortIslemUygulamasi
//
//  Created by Erdem Özkök on 9.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ilkText: UITextField!
    @IBOutlet weak var ikinciText: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func toplamaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!), let ikinciSayi = Int(ikinciText.text!){
            
            sonuc = ilkSayi + ikinciSayi
            sonucLabel.text = String(sonuc)
        } else {
            sonucLabel.text = "Lütfen sayıları giriniz"
        }
        
    }
    
    @IBAction func cikarmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!), let ikinciSayi = Int(ikinciText.text!){
            
            sonuc = ilkSayi - ikinciSayi
            sonucLabel.text = String(sonuc)
        } else {
            sonucLabel.text = "Lütfen sayıları giriniz"
        }
        
    }
    
    @IBAction func carpmaTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!), let ikinciSayi = Int(ikinciText.text!){
            
            sonuc = ilkSayi * ikinciSayi
            sonucLabel.text = String(sonuc)
        } else {
            sonucLabel.text = "Lütfen sayıları giriniz"
        }
        
    }
    
    @IBAction func bolmeTiklandi(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!), let ikinciSayi = Int(ikinciText.text!){
            
            sonuc = ilkSayi / ikinciSayi
            sonucLabel.text = String(sonuc)
        } else {
            sonucLabel.text = "Lütfen sayıları giriniz"
        }
        
    }
    
}

