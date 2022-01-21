//
//  ViewController.swift
//  ShoppingList
//
//  Created by Erdem Özkök on 21.01.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var selectedProductName = ""
    var selectedProductUUID: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name(rawValue: "newDataSaved"), object: nil)
    }
    
    @objc func loadData() {
        
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shopping")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRequest)
            
            if result.count > 0 {
                for r in result as! [NSManagedObject] {
                    
                    if let id = r.value(forKey: "id") as? UUID {
                        idArray.append(id)
                    }
                    if let name = r.value(forKey: "name") as? String {
                        nameArray.append(name)
                    }
                    
                }
                tableView.reloadData()
            }
            
        } catch {
            print("ERROR CONTEXT FETCH")
        }
    }

    @objc func addButton() {
        selectedProductName = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destination = segue.destination as! DetailsViewController
            destination.selectedProductUUID = selectedProductUUID
            destination.selectedProductName = selectedProductName
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProductName = nameArray[indexPath.row]
        selectedProductUUID = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shopping")
            let uuidString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let result = try context.fetch(fetchRequest)
                if result.count > 0{
                    
                    for r in result as! [NSManagedObject]{
                        
                        if let id = r.value(forKey: "id") as? UUID {
                            if id == idArray[indexPath.row]{
                                
                                context.delete(r)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                
                                self.tableView.reloadData()
                                do {
                                    try context.save()
                                } catch {
                                    
                                }
                                
                                break
                            }
                        }
                    }
                    
                }
                
            } catch {
                
            }
        }
        
    }
}

