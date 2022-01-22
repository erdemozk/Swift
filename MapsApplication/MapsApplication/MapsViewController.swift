//
//  ViewController.swift
//  MapsApplication
//
//  Created by Erdem Özkök on 22.01.2022.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var locationManager = CLLocationManager()
    var selectedLatitude = Double()
    var selectedLongitude = Double()
    
    var sentName = ""
    var sentId : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude : Double?
    var annotationLongitude : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(selectLocation(gestureRecognizer:)))
        
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if sentName != "" {
            saveButton.isHidden = true
            if let uuidStr = sentId?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
                fetchRequest.returnsObjectsAsFaults = false
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidStr)
                
                do {
                    let result = try context.fetch(fetchRequest)
                    
                    if result.count > 0 {
                        for r in result as! [NSManagedObject] {
                            
                            if let name = r.value(forKey: "name") as? String,
                                let note = r.value(forKey: "note") as? String,
                                let latitude = r.value(forKey: "latitude") as? Double,
                                let longitude = r.value(forKey: "longitude") as? Double{
                                annotationTitle = name
                                annotationSubtitle = note
                                annotationLatitude = latitude
                                annotationLongitude = longitude
                                
                                let annotation = MKPointAnnotation()
                                annotation.title = annotationTitle
                                annotation.subtitle = annotationSubtitle
                                
                                let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude!, longitude: annotationLongitude!)
                                annotation.coordinate = coordinate
                                
                                mapView.addAnnotation(annotation)
                                nameTextField.text = annotationTitle
                                noteTextField.text = annotationSubtitle
                            
                                locationManager.stopUpdatingLocation()
                                
                                let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                let region = MKCoordinateRegion(center: coordinate, span: span)
                                
                                mapView.setRegion(region, animated: true)
                            }
                            
                            
                        }
                    }
                    
                } catch {
                    print("ERROR")
                }
            }
            
        } else{
            saveButton.isHidden = false
        }
    }
    
    @objc func selectLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
        
            let touchedPoint = gestureRecognizer.location(in: mapView)
            let touchedCoordinate = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            selectedLatitude = touchedCoordinate.latitude
            selectedLongitude = touchedCoordinate.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = nameTextField.text
            annotation.subtitle = noteTextField.text
            mapView.addAnnotation(annotation)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations[0].coordinate.latitude)
        //print(locations[0].coordinate.longitude)
        if sentName == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: location, span: span)
            
            mapView.setRegion(region, animated: true)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        let annotationID = "customAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationID)
        
        if pinView == nil {
            
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationID)
            pinView?.canShowCallout = true
            pinView?.tintColor = .systemBlue
            
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        } else{
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if sentName != "" {
            
            let requestLocation = CLLocation(latitude: annotationLatitude!, longitude: annotationLongitude!)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placeMarkArray, error in
                
                if let placeMarks = placeMarkArray {
                    if placeMarks.count > 0{
                        
                        let newPlaceMark = MKPlacemark(placemark: placeMarks[0])
                        let item = MKMapItem(placemark: newPlaceMark)
                        
                        item.name = self.annotationTitle
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        
                        item.openInMaps(launchOptions: launchOptions)
                        
                    }
                }
            }
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context)
        
        newPlace.setValue(nameTextField.text, forKey: "name")
        newPlace.setValue(noteTextField.text, forKey: "note")
        newPlace.setValue(selectedLatitude, forKey: "latitude")
        newPlace.setValue(selectedLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("SAVED")
        } catch {
            print("ERROR")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlaceCreated"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
}

