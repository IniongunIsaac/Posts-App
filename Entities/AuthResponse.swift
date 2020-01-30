//
//  AuthResponse.swift
//  Entities
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

public struct AuthResponse: Codable {
    public let token: String
    public let user: User
}
