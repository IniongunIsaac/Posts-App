//
//  IAddPostRepo.swift
//  Repository
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RxSwift
import Entities

public protocol IAddPostRepo {
    func addPost(requestBody: [String : Data]) -> Observable<ApiResponse<PostResponse>>
}
