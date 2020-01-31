//
//  IUsersViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Entities
import RxSwift
import RxCocoa

protocol IUsersViewModel {
    
    var users: PublishSubject<[User]> { get }
    
    func getUsers()
    
}
