//
//  PostsRepoImpl.swift
//  Repository
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import RemoteApi

public struct PostsRepoImpl: IPostsRepo {
    
    public let postsRemote: IPostsRemote?
    
    public init(postsRemote: IPostsRemote) {
        self.postsRemote = postsRemote
    }
    
    public func getPosts() -> Observable<ApiResponse<Posts>> {
        return postsRemote!.getPosts()
    }
    
}
