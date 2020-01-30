//
//  LoginViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextfield: TextFieldWithBorderAttributes!
    @IBOutlet weak var passwordTextfield: TextFieldWithBorderAttributes!
    
    var authViewModel: IAuthViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return authViewModel as! BaseViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        authViewModel?.authenticate(requestBody: [
            AuthRequestKeyConstants.EMAIL_ADDRESS_KEY : emailTextfield.text!,
            AuthRequestKeyConstants.PASSWORD_KEY : passwordTextfield.text!
        ], authType: .login)
    }
    
    override func setChildClassObservers() {
        bindAuthResponse()
    }
    
    fileprivate func bindAuthResponse() {
        authViewModel?.authUser.bind { [weak self] res in
            let storyboard = UIStoryboard(name: "Posts", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "postsVC") as! PostsViewController
            self?.navigationController?.setViewControllers([vc], animated: false)
        }.disposed(by: disposeBag)
    }
    
}
