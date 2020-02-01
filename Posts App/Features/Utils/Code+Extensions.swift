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

extension Date {
    var milliSeconds: Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

func getPostImageName() -> String {
    return "Post_Image_\(Date().milliSeconds)"
}
