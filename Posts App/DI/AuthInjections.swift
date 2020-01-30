//
//  AuthInjections.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Repository
import RemoteApi

struct AuthInjections {
    
    static func setup(container: Container) {
        
        container.register(IAuthRemote.self) { _ in AuthRemoteImpl() }
        
        container.register(IAuthRepo.self) { res in
            AuthRepoImpl(authRemote: res.resolve(IAuthRemote.self)!)
        }
        
        container.register(IAuthViewModel.self) { res in
            AuthViewModel(authRepo: res.resolve(IAuthRepo.self)!)
        }
        
        container.storyboardInitCompleted(RegisterViewController.self) { res, cntrl in
            cntrl.authViewModel = res.resolve(IAuthViewModel.self)
        }
        
        container.storyboardInitCompleted(LoginViewController.self) { res, cntrl in
            cntrl.authViewModel = res.resolve(IAuthViewModel.self)
        }
        
    }
}
