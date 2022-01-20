//
//  ViewController.swift
//  CityGuideApp
//
//  Created by Erdem Özkök on 20.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCity : City?
    var cityArray = [City]()
    
    let istanbul = City(name: "İstanbul", image: "istanbul", region: "Marmara Region")
    let ankara = City(name: "Ankara", image: "ankara", region: "Central Anatolia Region")
    let izmir = City(name: "İzmir", image: "izmir", region: "Aegean Region")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        cityArray = [istanbul, ankara, izmir]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = cityArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCity = cityArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destination = segue.destination as! DetailsViewController
            
            destination.selectedCity = selectedCity
        }
    }
    
}

