//
//  AddPostRemoteImpl.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import Entities
import RxSwift

public class AddPostRemoteImpl : BaseRemoteApiImpl, IAddPostRemote {
    
    public override init() { }
    
    public func addPost(requestBody: [String : Data]) -> Observable<ApiResponse<PostResponse>> {
        return makeMultiPartFormDataApiRequest(responseType: ApiResponse<PostResponse>.self, url: RemoteApiConstants.POSTS_URL, method: .post, params: requestBody)
    }
    
}
