//
//  Preference.swift
//  Preference
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation

public struct Preference {
    
    public static func getAuthorizationHeader(key: String = PreferenceConstants.AUTHORIZATION_HEADER_KEY) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    public static func saveAuthorizationHeader(key: String = PreferenceConstants.AUTHORIZATION_HEADER_KEY, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
}
