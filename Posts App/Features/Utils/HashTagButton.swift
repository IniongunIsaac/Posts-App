//
//  HashTagButton.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import UIKit

class HashTagButton : UIButton {

    var postId : String = ""

    convenience init(postId: String) {
        self.init()
        self.postId = postId
    }
    
}
