//
//  PostDetailsRepoImpl.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift
import RemoteApi

public struct PostDetailsRepoImpl: IPostDetailsRepo {
    
    public let postDetailsRemote: IPostDetailsRemote?
    
    public init(postDetailsRemote: IPostDetailsRemote) {
        self.postDetailsRemote = postDetailsRemote
    }
    
    public func getPostById(id: String) -> Observable<ApiResponse<PostResponse>> {
        return postDetailsRemote!.getPostById(id: id)
    }
    
}
