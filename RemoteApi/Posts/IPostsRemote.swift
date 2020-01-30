//
//  IPostsRemote.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift

public protocol IPostsRemote {
    func getPosts() -> Observable<ApiResponse<Posts>>
}
