//
//  TokenExpiredError.swift
//  Entities
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation

public struct TokenExpiredError: Codable {
    public let name: String
    public let message: String
    public let expiredAt: String
}
