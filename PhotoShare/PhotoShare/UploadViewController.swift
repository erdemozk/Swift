//
//  UploadViewController.swift
//  PhotoShare
//
//  Created by Erdem Özkök on 23.01.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadButton.isEnabled = false
        
        let keyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(keyboardGestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
        
    }
    
    @objc func pickImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        uploadButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let mediaFolder = storageRef.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageRef = mediaFolder.child("\(uuid ).jpg")
            imageRef.putData(data, metadata: nil) { storageMetaData, error in
                if error != nil {
                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Something went wrong :(")
                } else{
                    imageRef.downloadURL { url, error in
                        if error == nil, let imageURL = url?.absoluteString {
                            let fireStoreDB = Firestore.firestore()
                            let fireStorePost = [
                                "imageURL": imageURL,
                                "comment": self.commentTextField.text!,
                                "email": Auth.auth().currentUser!.email,
                                "date": FieldValue.serverTimestamp()
                            ] as [String : Any]
                            
                            fireStoreDB.collection("Post").addDocument(data: fireStorePost) { error in
                                if error != nil {
                                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Something went wrong :(")
                                } else{
                                    self.commentTextField.text = ""
                                    self.imageView.image = UIImage(named: "pickImage")
                                    self.tabBarController?.selectedIndex = 0
                                }
                            }
                        } else {
                            self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Something went wrong :(")
                        }
                    }
                }
            }
        }
    }
    

    func errorMessage(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
