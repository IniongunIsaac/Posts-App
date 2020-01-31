//
//  UsersInjections.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Repository
import RemoteApi

struct UsersInjections {
    
    static func setup(container: Container) {
        
        container.register(IUsersRemote.self) { _ in UsersRemoteImpl() }
        
        container.register(IUsersRepo.self) { res in
            UsersRepoImpl(usersRemote: res.resolve(IUsersRemote.self)!)
        }
        
        container.register(IUsersViewModel.self) { res in
            UsersViewModel(usersRepo: res.resolve(IUsersRepo.self)!)
        }
        
        container.storyboardInitCompleted(UsersViewController.self) { res, cntrl in
            cntrl.usersViewModel = res.resolve(IUsersViewModel.self)
        }
        
    }
    
}
