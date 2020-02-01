//
//  IAddPostViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Entities

protocol IAddPostViewModel {
    var post: PublishSubject<Post> { get }
    func addPost(requestBody: [String : Data])
}
