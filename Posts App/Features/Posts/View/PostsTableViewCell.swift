//
//  PostsTableViewCell.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: ImageViewWithBorderAttributes!
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var hashTagsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
