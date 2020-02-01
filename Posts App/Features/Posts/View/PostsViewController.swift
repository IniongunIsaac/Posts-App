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
    
    var hashTag: String? {
        didSet {
            if let hashTag = hashTag {
                postsViewModel?.getPostsByHashTag(hashTag: hashTag)
            }
        }
    }
    
    override func getViewModel() -> BaseViewModel {
        return postsViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    fileprivate func configureNavigationBar() {
        navigationItem.title = "Posts"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.3.fill"), style: .plain, target: self, action: #selector(usersButtonTapped(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(newPostButtonTapped(_:)))
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func usersButtonTapped( _ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "usersVC") as! UsersViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func newPostButtonTapped( _ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "NewPost", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "newPostVC") as! NewPostViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
                
                guard let self = self else { return }
                
                let storyboard = UIStoryboard(name: "PostDetails", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "postDetailsVC") as! PostDetailsViewController
                vc.postId = "\(element.id)"
                self.navigationController?.pushViewController(vc, animated: true)
                
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
