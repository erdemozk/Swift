//
//  DetailsViewController.swift
//  ShoppingList
//
//  Created by Erdem Özkök on 21.01.2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedProductName = ""
    var selectedProductUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedProductName != "" {
            
            saveButton.isHidden = true
            // Core Data Show The Selected Profuct Details
            if let uuidStr = selectedProductUUID?.uuidString {
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let contex = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shopping")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidStr)
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let result = try contex.fetch(fetchRequest)
                    
                    if result.count > 0 {
                        for r in result as! [NSManagedObject] {
                            if let name = r.value(forKey: "name") as? String {
                                nameTextField.text = name
                            }
                            
                            if let price = r.value(forKey: "price") as? Int {
                                priceTextField.text = String(price)
                            }
                            
                            if let size = r.value(forKey: "size") as? String {
                                sizeTextField.text = size
                            }
                            
                            if let imageData = r.value(forKey: "image") as? Data {
                                let image = UIImage(data: imageData)
                                imageView.image = image
                            }
                        }
                    }
                } catch {
                    print("ERROR FETCH")
                }
                
            }
            
        } else{
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameTextField.text = ""
            priceTextField.text = ""
            sizeTextField.text = ""
        }

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
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
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context)
        
        shopping.setValue(UUID(), forKey: "id")
        shopping.setValue(nameTextField.text!, forKey: "name")
        shopping.setValue(sizeTextField.text!, forKey: "size")
        
        if let price = Int(priceTextField.text!) {
            shopping.setValue(price, forKey: "price")
        }
        
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        shopping.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
            print("It's saved")
        } catch {
            print("ERROR CONTEXT SAVE")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newDataSaved"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
