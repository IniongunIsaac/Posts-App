//
//  PostsViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import Repository

class PostsViewModel: BaseViewModel, IPostsViewModel {
    
    var posts: PublishSubject<[Post]> = PublishSubject()
    
    let postsRepo: IPostsRepo
    
    init(postsRepo: IPostsRepo) {
        self.postsRepo = postsRepo
    }
    
    func getPosts() {
        
        isLoading.onNext(true)
        
        postsRepo.getPosts().subscribe(onNext: { [weak self] res in
            
            self?.isLoading.onNext(false)
            
            if let postsRes = res.data {
                self?.posts.onNext(postsRes.posts)
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
        getPosts()
    }
    
}
