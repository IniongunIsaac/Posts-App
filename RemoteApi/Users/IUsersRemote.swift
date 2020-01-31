//
//  IUsersRemote.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Entities
import RxSwift

public protocol IUsersRemote {
    func getUsers() -> Observable<ApiResponse<Users>>
}
