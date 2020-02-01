//
//  AddPostViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RxCocoa
import RxSwift
import Entities
import Repository

class AddPostViewModel: BaseViewModel, IAddPostViewModel {
    
    let addPostRepo: IAddPostRepo
    
    init(addPostRepo: IAddPostRepo) {
        self.addPostRepo = addPostRepo
    }
    
    var post: PublishSubject<Post> = PublishSubject()
    
    func addPost(requestBody: [String : Data]) {
        
        isLoading.onNext(true)
        
        addPostRepo.addPost(requestBody: requestBody).subscribe(onNext: { [weak self] res in
            
            self?.isLoading.onNext(false)
            
            if let _ = res.data {
                self?.alertValue.onNext(AlertValue(message: "Post created successfully", type: .success))
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
