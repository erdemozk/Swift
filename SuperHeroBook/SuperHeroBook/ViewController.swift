//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Erdem Özkök on 19.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = ["Iron Man","Hawkeye","Captain America","Captain Marvel","Thor","Hulk","Doctor Strange","Spider-Man"]
    var superHeroImageNames = ["ironman","hawkeye","captainamerica","captainmarvel","thor","hulk","doctorstrange","spiderman"]
    
    var selectedName = ""
    var selectedImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // numberOfRowsInSection -> kaç tane satır
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    // cellForRow atIndexPath -> hücrenin içerisinde neler gösterilecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
        
    }
    
    // TableView Item Swipe Left To Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // TableView Item Selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedName = superHeroNames[indexPath.row]
        selectedImageName = superHeroImageNames[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    // Send the Information about Hero to Details Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailsViewController
            
            destinationVC.selectedSuperHeroName = selectedName
            destinationVC.selectedSuperHeroImageName = selectedImageName
        }
    }
    
    
}

