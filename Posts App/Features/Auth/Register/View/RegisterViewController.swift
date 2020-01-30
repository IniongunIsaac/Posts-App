//
//  RegisterViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextfield: TextFieldWithBorderAttributes!
    @IBOutlet weak var emailTextfield: TextFieldWithBorderAttributes!
    @IBOutlet weak var passwordTextfield: TextFieldWithBorderAttributes!
    
    var authViewModel: IAuthViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return authViewModel as! BaseViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Register"
        bindAuthResponse()
    }
    
    fileprivate func bindAuthResponse() {
        authViewModel?.authUser.bind { [weak self] res in
            let storyboard = UIStoryboard(name: "Posts", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "postsVC") as! PostsViewController
            self?.navigationController?.setViewControllers([vc], animated: false)
        }.disposed(by: disposeBag)
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        authViewModel?.authenticate(requestBody: [
            AuthRequestKeyConstants.USERNAME_KEY : usernameTextfield.text!,
            AuthRequestKeyConstants.EMAIL_ADDRESS_KEY : emailTextfield.text!,
            AuthRequestKeyConstants.PASSWORD_KEY : passwordTextfield.text!
        ], authType: .register)
    }
}
