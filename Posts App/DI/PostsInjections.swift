//
//  PostsInjections.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Repository
import RemoteApi

struct PostsInjections {
    
    static func setup(container: Container) {
        
        container.register(IPostsRemote.self) { _ in PostsRemoteImpl() }
        
        container.register(IPostsRepo.self) { res in
            PostsRepoImpl(postsRemote: res.resolve(IPostsRemote.self)!)
        }
        
        container.register(IPostsViewModel.self) { res in
            PostsViewModel(postsRepo: res.resolve(IPostsRepo.self)!)
        }
        
        container.storyboardInitCompleted(PostsViewController.self) { res, cntrl in
            cntrl.postsViewModel = res.resolve(IPostsViewModel.self)
        }
        
    }
}
