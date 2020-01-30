//
//  Injections.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    public static func setup() {
        AuthInjections.setup(container: defaultContainer)
        PostsInjections.setup(container: defaultContainer)
    }
    
}
