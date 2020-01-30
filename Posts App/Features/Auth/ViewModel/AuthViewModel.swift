//
//  AuthViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import Repository

class AuthViewModel: BaseViewModel, IAuthViewModel  {
    var authUser: PublishSubject<User> = PublishSubject()
    let authRepo: IAuthRepo
    
    init(authRepo: IAuthRepo) {
        self.authRepo = authRepo
    }
    
    func authenticate(requestBody: [String : String], authType: AuthType) {
        
        switch authType {
            
        case .login:
            if let error = AuthValidation.validLoginDetailsErrorMessage(requestBody: requestBody) {
                self.alertValue.onNext(AlertValue(message: error, type: .error))
                return
            }
        case .register:
            if let error = AuthValidation.validRegistrationDetailsErrorMessage(requestBody: requestBody) {
                self.alertValue.onNext(AlertValue(message: error, type: .error))
                return
            }
            
        }
        
        self.isLoading.onNext(true)
        
        self.authRepo.authenticate(requestBody: requestBody, authType: authType).subscribe(onNext: { [weak self] res in
            
            self?.isLoading.onNext(false)
            
            if let authRes = res.data {
                self?.authRepo.saveUserToken(token: "Bearer \(authRes.token)")
                self?.authUser.onNext(authRes.user)
            } else if let apiErr = res.apiError {
                self?.apiError.onNext(apiErr)
            } else if let tokenExprErr = res.tokenExpiredErrorResponse {
                self?.tokenExpiredError.onNext(tokenExprErr.err)
            }
            
        }, onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }).disposed(by: disposeBag)
        
    }
    
}
