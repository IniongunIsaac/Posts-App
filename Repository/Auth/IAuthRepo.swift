//
//  IAuthRepo.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities

public protocol IAuthRepo {
    
    func authenticate(requestBody: [String : String], authType: AuthType) -> Observable<ApiResponse<AuthResponse>>
    
    func saveUserToken(token: String)
    
}
