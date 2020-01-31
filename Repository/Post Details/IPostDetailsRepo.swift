//
//  IPostDetailsRepo.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift

public protocol IPostDetailsRepo {
    func getPostById(id: String) -> Observable<ApiResponse<PostResponse>>
}
