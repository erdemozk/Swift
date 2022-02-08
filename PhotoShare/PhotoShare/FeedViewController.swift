//
//  FeedViewController.swift
//  PhotoShare
//
//  Created by Erdem Özkök on 23.01.2022.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirebase()
    }
    
    func getDataFromFirebase() {
        
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("Post").order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
            if error != nil {
                
                print(error?.localizedDescription ?? "Something went wrong :(")
                
            } else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.postArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        //For get document ID, use below line code
                        //let documentID = document.documentID
                        
                        if let imageURL = document.get("imageURL") as? String,
                           let comment = document.get("comment") as? String,
                           let email = document.get("email") as? String{
                           
                            let post = Post(email: email, comment: comment, imageURL: imageURL)
                            self.postArray.append(post)
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.postEmailLabel.text = postArray[indexPath.row].email
        cell.postCommentLabel.text = postArray[indexPath.row].comment
        cell.postImageView.sd_setImage(with: URL(string: self.postArray[indexPath.row].imageURL))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }

}
