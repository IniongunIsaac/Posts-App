//
//  NewPostViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 01/02/2020.
//

import UIKit
import Photos

class NewPostViewController: BaseViewController {
    
    @IBOutlet weak var titleTextfield: TextFieldWithBorderAttributes!
    @IBOutlet weak var descriptionTextView: TextViewWithBorderAttributes!
    @IBOutlet weak var hashTagsTextfield: TextFieldWithBorderAttributes!
    @IBOutlet weak var postImageView: UIImageView!
    
    var addPostViewModel: IAddPostViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return addPostViewModel as! BaseViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Post"
    }

    @IBAction func choosePostImageButtonTapped(_ sender: UIButton) {
        showPostImageActionSheet()
    }
    
    @IBAction func createPostButtonTapped(_ sender: Any) {
        
        if titleTextfield.text!.isEmpty {
            showAlert(message: "Post title is required", type: .error)
        } else if descriptionTextView.text.isEmpty {
            showAlert(message: "Post description is required", type: .error)
        } else if hashTagsTextfield.text!.isEmpty {
            showAlert(message: "Post hashtag(s) is/are required", type: .error)
        } else if postImageView.image == nil {
            showAlert(message: "Post image is required", type: .error)
        } else {
            let requestBody = [
                AddPostRequestKeyConstants.TITLE_KEY: Data(titleTextfield.text!.utf8),
                AddPostRequestKeyConstants.DESCRIPTION_KEY: Data(descriptionTextView.text!.utf8),
                AddPostRequestKeyConstants.HASHTAG_KEY: Data(hashTagsTextfield.text!.utf8),
                AddPostRequestKeyConstants.IMAGE_KEY: postImageView.image!.pngData()!
            ]
            
            addPostViewModel?.addPost(requestBody: requestBody)
        }
        
    }
    
}

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        postImageView.image = selectedImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func showPostImageActionSheet() {
        let alertController = UIAlertController(title: "Select Source", message: "Select the source to select a post image", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.postImageFromCamera()
        }
        let library = UIAlertAction(title: "Library", style: .default) { (action) in
            self.postImageFromibrary()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(camera)
        }
        
        alertController.addAction(library)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func postImageFromCamera() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.camera
        image.allowsEditing = false
        self.present(image, animated: true, completion: nil)
    }
    
    fileprivate func postImageFromibrary() {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.proceedWithPhotoLibrary()
                } else {}
            })
        } else {
            proceedWithPhotoLibrary()
        }
    }
    
    fileprivate func proceedWithPhotoLibrary() {
        DispatchQueue.main.async {
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
            self.present(image, animated: true, completion: nil)
        }
    }
    
}
