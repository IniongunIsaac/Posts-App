//
//  AddPostRepoImpl.swift
//  Repository
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RxSwift
import Entities
import RemoteApi

public struct AddPostRepoImpl: IAddPostRepo {
    
    public let addPostRemote: IAddPostRemote?
    
    public init(addPostRemote: IAddPostRemote) {
        self.addPostRemote = addPostRemote
    }
    
    public func addPost(requestBody: [String : Data]) -> Observable<ApiResponse<PostResponse>> {
        return addPostRemote!.addPost(requestBody: requestBody)
    }
    
}
