//
//  BaseRemoteApiImpl.swift
//  RemoteApi
//
//  Created by Isaac Iniongun on 29/01/2020.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import Preference

public class BaseRemoteApiImpl: IBaseRemoteApi {
    
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var requestHeaders: [String : String] {
        if let authHeader = Preference.getAuthorizationHeader() {
            return ["Authorization": authHeader]
        } else {
            return [:]
        }
    }
    
    public func makeApiRequest<T>(responseType: T.Type, url: String, method: HTTPMethod = .get, params: [String : Any]?, encoding: ParameterEncoding = URLEncoding.default) -> Observable<T> where T : Codable {
        
        return string(method, url, parameters: params, encoding: encoding, headers: requestHeaders)
            .debug()
            .flatMap { responseString -> Observable<T> in
                do {
                    var jsonResponseString = ""
                    
                    //if the `responseString` contains an ApiError using key `msg`, create a new json string with key `apiError`
                    //if the `responseString` contains an TokenExpiredErrorResponse using key `err`, create a new json string with key `tokenExpiredErrorResponse`
                    //otherwise, create a new json string with key `data`
                    
                    if responseString.localizedCaseInsensitiveContains("msg") {
                        jsonResponseString = self.getJsonString(withKey: "apiError", forValue: responseString)
                    } else if responseString.localizedCaseInsensitiveContains("err") {
                        jsonResponseString = self.getJsonString(withKey: "tokenExpiredErrorResponse", forValue: responseString)
                    } else {
                        jsonResponseString = self.getJsonString(withKey: "data", forValue: responseString)
                    }

                    //map the result of `jsonResponseString` above to the `responseType`
                    let requestResponse = try responseType.mapTo(jsonString: jsonResponseString)!

                    //return result in `requestResponse` as an `Observable`
                    return Observable.just(requestResponse)

                } catch {
                    print(error)
                    throw error
                }
            }
    }
    
    /// Creates a new JSON String
    ///
    /// - Parameter withKey: key to be formed as part of the new json string
    /// - Parameter forValue: value of the aforementioned key
    /// - Returns: String
    fileprivate func getJsonString(withKey: String, forValue: String) -> String {
        return "{\"\(withKey)\": \(forValue)}"
    }
    
}
