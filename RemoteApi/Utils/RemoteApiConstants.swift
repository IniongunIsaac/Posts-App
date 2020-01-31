//
//  RemoteApiConstants.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

struct RemoteApiConstants {
    
    fileprivate static let BASE_URL = "https://ios-test-january-2020.africave.co/api/v1/"
    
    static let REGISTER_URL = "\(BASE_URL)register"
    static let LOGIN_URL = "\(BASE_URL)login"
    static let POSTS_URL = "\(BASE_URL)posts"
    static let USERS_URL = "\(BASE_URL)users"
    static let POSTS_BY_HASHTAG_URL = "\(BASE_URL)explore"
    
}
