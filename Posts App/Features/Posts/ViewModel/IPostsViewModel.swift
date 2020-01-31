//
//  IPostsViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities
import RxCocoa

protocol IPostsViewModel {
    var posts: PublishSubject<[Post]> { get }
    func getPosts()
    func getPostsByHashTag(hashTag: String)
}
