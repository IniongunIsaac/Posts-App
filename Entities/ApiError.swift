//
//  ApiError.swift
//  Entities
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

public struct ApiError: Codable {
    public let message: String
    
    enum CodingKeys: String, CodingKey{
        case message = "msg"
    }
    
    public init(decoder: Decoder) throws {
        
        //Get the root of our object
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode message from container(the root)
        message = try container.decode(String.self, forKey: .message)
        
    }
}
