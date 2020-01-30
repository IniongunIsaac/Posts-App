//
//  AuthValidation.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation

struct AuthValidation {
    
    fileprivate static func validEmailAddressErrorMessage(email: String?) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailTest.evaluate(with: email?.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return "Please enter a valid Email address"
        }
        return nil
    }
    
    fileprivate static func validUsernameErrorMessage(name: String?) -> String? {
        let nameRegex = "[A-Za-z ]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        if !emailTest.evaluate(with: name?.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return "Please enter a valid username name"
        }
        return nil
    }
    
    fileprivate static func requiredValueErrorMessage(text: String?, param: String) -> String? {
        if text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            return "\(param) is required"
        }
        return nil
    }
    
    public static func validLoginDetailsErrorMessage(requestBody: [String: String]) -> String? {
        
        if let emailError = validEmailAddressErrorMessage(email: requestBody[AuthRequestKeyConstants.EMAIL_ADDRESS_KEY]) {
            return emailError
        } else if let passwordError = requiredValueErrorMessage(text: requestBody[AuthRequestKeyConstants.PASSWORD_KEY], param: "Password") {
            return passwordError
        }
        
        return nil
    }
    
    public static func validRegistrationDetailsErrorMessage(requestBody: [String: String]) -> String? {
        
        if let usernameError = validUsernameErrorMessage(name: requestBody[AuthRequestKeyConstants.USERNAME_KEY]) {
            return usernameError
        } else if let emailError = validEmailAddressErrorMessage(email: requestBody[AuthRequestKeyConstants.EMAIL_ADDRESS_KEY]) {
            return emailError
        } else if let passwordError = requiredValueErrorMessage(text: requestBody[AuthRequestKeyConstants.PASSWORD_KEY], param: "Password") {
            return passwordError
        }
        
        return nil
    }
}
