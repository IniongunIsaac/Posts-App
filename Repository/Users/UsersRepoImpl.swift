//
//  UsersRepoImpl.swift
//  Repository
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RemoteApi
import RxSwift
import Entities

public struct UsersRepoImpl: IUsersRepo {
    
    public let usersRemote: IUsersRemote?
    
    public init(usersRemote: IUsersRemote) {
        self.usersRemote = usersRemote
    }
    
    public func getUsers() -> Observable<ApiResponse<Users>> {
        return usersRemote!.getUsers()
    }
    
}
