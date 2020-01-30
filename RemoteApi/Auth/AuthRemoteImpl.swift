//
//  AuthRemoteImpl.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift

public class AuthRemoteImpl: BaseRemoteApiImpl, IAuthRemote {
    
    public override init() { }
    
    public func authenticate(requestBody: [String : String], authType: AuthType) -> Observable<ApiResponse<AuthResponse>> {
        
        var authUrl = ""
        
        switch authType {
        case .login:
            authUrl = RemoteApiConstants.LOGIN_URL
        case .register:
            authUrl = RemoteApiConstants.REGISTER_URL
        }
        
        return makeApiRequest(responseType: ApiResponse<AuthResponse>.self, url: authUrl, method: .post, params: requestBody)
    }
    
}
