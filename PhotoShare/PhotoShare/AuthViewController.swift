//
//  ViewController.swift
//  PhotoShare
//
//  Created by Erdem Özkök on 22.01.2022.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButton(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataResult, error in
                if error != nil{
                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Something went wrong :(")
                } else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else{
            errorMessage(titleInput: "Error!", messageInput: "Email or Password Can't Be Empty!")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataResult, error in
                if error != nil{
                    
                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Something went wrong :(")
                    
                } else{
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
            
        } else{
            
            errorMessage(titleInput: "Error!", messageInput: "Invalid Email or Password!")
            
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

