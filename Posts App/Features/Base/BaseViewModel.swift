//
//  BaseViewModel.swift
//  Posts App
//
//  Created by Isaac Iniongun on 30/01/2020.
//

import Foundation
import RxSwift
import Entities

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let alertValue: PublishSubject<AlertValue> = PublishSubject()
    let apiError: PublishSubject<ApiError> = PublishSubject()
    let tokenExpiredError: PublishSubject<TokenExpiredError> = PublishSubject()
    let throwableError: PublishSubject<Error> = PublishSubject()
    
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
    
}
