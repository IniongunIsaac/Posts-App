//
//  TokenExpiredError.swift
//  Entities
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation

public struct TokenExpiredErrorResponse: Codable {
    public let err: TokenExpiredError
}
