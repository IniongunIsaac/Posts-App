//
//  Code+Extensions.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation

func runAfter(_ delay: Double = 2.0, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
        action()
    }
}
