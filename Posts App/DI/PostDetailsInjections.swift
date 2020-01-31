//
//  PostDetailsInjections.swift
//  PostDetails App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Repository
import RemoteApi

struct PostDetailsInjections {
    
    static func setup(container: Container) {
        
        container.register(IPostDetailsRemote.self) { _ in PostDetailsRemoteImpl() }
        
        container.register(IPostDetailsRepo.self) { res in
            PostDetailsRepoImpl(postDetailsRemote: res.resolve(IPostDetailsRemote.self)!)
        }
        
        container.register(IPostDetailsViewModel.self) { res in
            PostDetailsViewModel(postDetailsRepo: res.resolve(IPostDetailsRepo.self)!)
        }
        
        container.storyboardInitCompleted(PostDetailsViewController.self) { res, cntrl in
            cntrl.postDetailsViewModel = res.resolve(IPostDetailsViewModel.self)
        }
        
    }
    
}
