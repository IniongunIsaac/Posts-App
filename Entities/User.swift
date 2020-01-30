//
//  User.swift
//  Entities
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public let username: String
    public let email: String
    public let updatedAt: String
    public let createdAt: String
    
}
