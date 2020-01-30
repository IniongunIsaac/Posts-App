//
//  ILoginViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import RxCocoa

protocol IAuthViewModel {
    var authUser: PublishSubject<User> { get }
    func authenticate(requestBody: [String: String], authType: AuthType)
}
