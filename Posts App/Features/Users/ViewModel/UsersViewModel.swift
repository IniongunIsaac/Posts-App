//
//  UsersViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Entities
import Repository
import RxSwift
import RxCocoa

class UsersViewModel: BaseViewModel, IUsersViewModel {
    
    var users: PublishSubject<[User]> = PublishSubject()
    
    let usersRepo: IUsersRepo
    
    init(usersRepo: IUsersRepo) {
        self.usersRepo = usersRepo
    }
    
    func getUsers() {
        isLoading.onNext(true)
        
        usersRepo.getUsers().subscribe(onNext: { [weak self] res in
        
        self?.isLoading.onNext(false)
        
        if let usersRes = res.data {
            self?.users.onNext(usersRes.users)
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
    
    override func viewDidLoad() {
        getUsers()
    }
    
}

