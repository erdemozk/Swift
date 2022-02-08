//
//  FeedCell.swift
//  PhotoShare
//
//  Created by Erdem Özkök on 23.01.2022.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var postEmailLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postCommentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
