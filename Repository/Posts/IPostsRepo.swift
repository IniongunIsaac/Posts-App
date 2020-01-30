//
//  IPostsRepo.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities

public protocol IPostsRepo {
    func getPosts() -> Observable<ApiResponse<Posts>>
}
