//
//  Post.swift
//  Entities
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

public struct Post: Codable {
    public let id: Int
    public let title: String
    public let description: String
    public let hashtags: String
    public let image: String
    public let updatedAt: String
    public let createdAt: String
    public let User: User
}
