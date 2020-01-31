//
//  IPostDetailsViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import Entities
import RxSwift
import RxCocoa

protocol IPostDetailsViewModel {
    var post: PublishSubject<Post> { get }
    func getPostById(id: String)
}
