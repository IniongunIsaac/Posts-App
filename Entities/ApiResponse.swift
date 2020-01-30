//
//  ApiResponse.swift
//  Entities
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation

public struct ApiResponse<T: Codable> : Codable {
    public var data: T? = nil
    public var apiError: ApiError? = nil
    public var tokenExpiredErrorResponse: TokenExpiredErrorResponse? = nil
}
