//
//  TableViewController.swift
//  MapsApplication
//
//  Created by Erdem Özkök on 22.01.2022.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedName = ""
    var selectedId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        // Do any additional setup after loading the view.
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name("newPlaceCreated"), object: nil)
        
    }
    
    @objc func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRequest)
            
            if result.count > 0 {
                
                nameArray.removeAll(keepingCapacity: false)
                idArray.removeAll(keepingCapacity: false)
                
                for r in result as! [NSManagedObject] {
                    
                    if let name = r.value(forKey: "name") as? String{
                        nameArray.append(name)
                    }
                    
                    if let id = r.value(forKey: "id") as? UUID {
                        idArray.append(id)
                        
                        
                    }
                }
                
                tableView.reloadData()
                
            }
            
        } catch {
            print("ERROR")
        }
    }
    
    @objc func addButton(){
        selectedName = ""
        
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedName = nameArray[indexPath.row]
        selectedId = idArray[indexPath.row]
        
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapsVC"{
            let destinationVC = segue.destination as! MapsViewController
            
            destinationVC.sentName = selectedName
            destinationVC.sentId = selectedId
        }
    }
}
