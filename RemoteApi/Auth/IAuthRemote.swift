//
//  IAuthRemote.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation
import Entities
import RxSwift

public protocol IAuthRemote {
    func authenticate(requestBody: [String : String], authType: AuthType) -> Observable<ApiResponse<AuthResponse>>
}
