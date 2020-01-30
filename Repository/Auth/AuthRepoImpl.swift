//
//  AuthRepoImpl.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import RemoteApi
import Preference

public struct AuthRepoImpl: IAuthRepo {
    
    public let authRemote: IAuthRemote?
    
    public init(authRemote: IAuthRemote) {
        self.authRemote = authRemote
    }
    
    public func authenticate(requestBody: [String : String], authType: AuthType) -> Observable<ApiResponse<AuthResponse>> {
        return authRemote!.authenticate(requestBody: requestBody, authType: authType)
    }
    
    public func saveUserToken(token: String) {
        Preference.saveAuthorizationHeader(value: token)
    }
    
}
