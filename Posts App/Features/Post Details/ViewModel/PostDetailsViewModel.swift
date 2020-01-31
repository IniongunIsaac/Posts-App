//
//  PostDetailsViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift
import RxCocoa
import Repository

class PostDetailsViewModel: BaseViewModel, IPostDetailsViewModel {
    
    var post: PublishSubject<Post> = PublishSubject()
    
    let postDetailsRepo: IPostDetailsRepo
    
    init(postDetailsRepo: IPostDetailsRepo) {
        self.postDetailsRepo = postDetailsRepo
    }
    
    func getPostById(id: String) {
        isLoading.onNext(true)
        
        postDetailsRepo.getPostById(id: id).subscribe(onNext: { [weak self] res in
        
        self?.isLoading.onNext(false)
        
        if let postRes = res.data {
            self?.post.onNext(postRes.post)
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
