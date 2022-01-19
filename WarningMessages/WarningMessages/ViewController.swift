//
//  ViewController.swift
//  WarningMessages
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: Any) {
        
        if emailTextField.text == "" {
            alertPopUp(titleText: "Error", messageText: "Email is not empty!")
            
        } else if passwordTextField.text == "" {
            alertPopUp(titleText: "Error", messageText: "Password is not empty!")
            
        } else if confirmPasswordTextField.text == "" {
            alertPopUp(titleText: "Error", messageText: "Confirm Password is not empty!")
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            alertPopUp(titleText: "Error", messageText: "Passwords not match!")
            
        } else {
            alertPopUp(titleText: "Succes", messageText: "Registeration is succesful!")
            
        }
    }
    
    func alertPopUp(titleText: String, messageText: String) -> Void {
        
        let warningMessage = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertController.Style.alert)
        
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            // OK Button'una tıklanınca olacaklar
            print("OK Button Clicked!")
        }
        
        warningMessage.addAction(okayButton)
        
        self.present(warningMessage, animated: true, completion: nil)
        
    }
    
    

}

