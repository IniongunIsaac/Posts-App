//
//  PostsViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import UIKit
import Kingfisher

class PostsViewController: BaseViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var postsViewModel: IPostsViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return postsViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Posts"
    }
    
    override func setChildClassObservers() {
        bindPosts()
    }
    
    func bindPosts() {
        postsViewModel?.posts.bind(to: postsTableView.rx.items) { [weak self] (tableView, index, element) in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "postsTableViewCell") as! PostsTableViewCell
            cell.usernameLable.text = element.User.username
            cell.descriptionTextView.text = element.description
            cell.hashTagsLabel.text = self?.getHashTags(hashTags: element.hashtags)
            self?.setImage(imageUrl: element.image.replacingOccurrences(of: " ", with: "%20"), imageView: cell.postImageView)
            
            cell.addTapGesture { [weak self] in
                //when a particular cell is clicked
            }
            
            return cell
            
        }.disposed(by: disposeBag)
        
    }
    
    fileprivate func setImage(imageUrl: String, imageView: UIImageView) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: URL(string: imageUrl)
        )
    }
    
    fileprivate func getHashTags(hashTags: String) -> String {
        var str = ""
        
        for value in hashTags.split(separator: ",") {
            str = "\(str) #\(value) "
        }
        
        return str
    }

}
