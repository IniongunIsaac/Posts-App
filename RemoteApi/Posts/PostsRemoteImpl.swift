//
//  PostsRemoteImpl.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift

public class PostsRemoteImpl: BaseRemoteApiImpl, IPostsRemote {
    
    public override init() { }
    
    public func getPosts() -> Observable<ApiResponse<Posts>> {
        return makeApiRequest(responseType: ApiResponse<Posts>.self, url: RemoteApiConstants.POSTS_URL, params: nil)
    }
    
}
