//
//  PostDetailsRemote.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift

public class PostDetailsRemoteImpl: BaseRemoteApiImpl, IPostDetailsRemote {
    
    public override init() { }
    
    public func getPostById(id: String) -> Observable<ApiResponse<PostResponse>> {
        return makeApiRequest(responseType: ApiResponse<PostResponse>.self, url: "\(RemoteApiConstants.POSTS_URL)/\(id)", params: nil)
    }
    
}
