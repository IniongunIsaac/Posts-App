//
//  AddPostInjections.swift
//  Posts App
//
//  Created by Isaac Iniongun on 01/02/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Repository
import RemoteApi

struct AddPostInjections {
    
    static func setup(container: Container) {
        
        container.register(IAddPostRemote.self) { _ in AddPostRemoteImpl() }
        
        container.register(IAddPostRepo.self) { res in
            AddPostRepoImpl(addPostRemote: res.resolve(IAddPostRemote.self)!)
        }
        
        container.register(IAddPostViewModel.self) { res in
            AddPostViewModel(addPostRepo: res.resolve(IAddPostRepo.self)!)
        }
        
        container.storyboardInitCompleted(NewPostViewController.self) { res, cntrl in
            cntrl.addPostViewModel = res.resolve(IAddPostViewModel.self)
        }
        
    }
    
}
