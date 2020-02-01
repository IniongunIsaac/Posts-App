//
//  IBaseRemoteApi.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation
import Alamofire
import RxSwift

protocol IBaseRemoteApi {
    
    func makeApiRequest<T: Codable>(responseType: T.Type, url: String, method: HTTPMethod, params: [String : Any]?, encoding: ParameterEncoding) -> Observable<T>
    
    func makeMultiPartFormDataApiRequest<T: Codable>(responseType: T.Type, url: String, method: HTTPMethod, params: [String : Data]) -> Observable<T>
    
}
