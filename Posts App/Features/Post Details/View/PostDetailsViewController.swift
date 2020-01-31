//
//  PostDetailsViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import UIKit
import Kingfisher

class PostDetailsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var hashTagsStackView: UIStackView!
    @IBOutlet weak var userImageView: ImageViewWithBorderAttributes!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var postDetailsViewModel: IPostDetailsViewModel?
    
    var postId: String? {
        didSet {
            guard let postId = postId else { return }
            postDetailsViewModel?.getPostById(id: postId)
        }
    }
    
    override func getViewModel() -> BaseViewModel {
        return postDetailsViewModel as! BaseViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    fileprivate func configureNavigationBar() {
        navigationItem.title = "Post Details"
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func setChildClassObservers() {
        bindPostDetails()
    }
    
    fileprivate func bindPostDetails() {
        postDetailsViewModel?.post.bind { [weak self] post in
            
            guard let self = self else { return }
            
            self.titleLabel.text = post.title
            self.descriptionTextView.text = post.description
            self.setImage(imageUrl: post.image.replacingOccurrences(of: " ", with: "%20"), imageView: self.postImageView)
            self.usernameLabel.text = post.User.username
            self.userEmailLabel.text = post.User.email
            
            for hashTag in post.hashtags.split(separator: ",") {
                self.hashTagsStackView.addArrangedSubview(self.getHashTagButton(hashTag: "#\(hashTag)"))
            }
            
        }.disposed(by: disposeBag)
    }
    
    fileprivate func setImage(imageUrl: String, imageView: UIImageView) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: URL(string: imageUrl)
        )
    }
    
    fileprivate func getHashTagButton(hashTag: String) -> UIButton {
        
        let button = UIButton()
        button.setTitle(hashTag, for: .normal)
        button.backgroundColor = .white
        button.borderColor = appColor
        button.borderWidth = 1.0
        button.cornerRadius = 5.0
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        button.setTitleColor(appColor, for: .normal)
        button.addTarget(self, action: #selector(self.hashTagButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    @objc func hashTagButtonTapped(sender : UIButton) {
        let storyboard = UIStoryboard(name: "Posts", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "postsVC") as! PostsViewController
        vc.hashTag = sender.title(for: .normal)?.replacingOccurrences(of: "#", with: "")
        navigationController?.setViewControllers([vc], animated: false)
    }

}
