//
//  SettingsViewController.swift
//  PhotoShare
//
//  Created by Erdem Özkök on 23.01.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toAuthVC", sender: nil)
        } catch {
            print("ERROR")
        }
        
        
    }
    
   

}
