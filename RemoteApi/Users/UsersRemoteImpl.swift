//
//  UsersRemote.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RxSwift
import Entities

public class UsersRemoteImpl: BaseRemoteApiImpl, IUsersRemote {
    
    public override init() { }
    
    public func getUsers() -> Observable<ApiResponse<Users>> {
        return makeApiRequest(responseType: ApiResponse<Users>.self, url: RemoteApiConstants.USERS_URL, params: nil)
    }
    
}
