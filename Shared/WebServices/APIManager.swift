//
//  APIManager.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import Foundation
import Alamofire

class APIManager {

  static let shared = APIManager()

  typealias ErrorHandler = (ErrorResponse?, Error?) -> Void

  func request<T: Decodable>(_ router: Router,
                             completionHandler: @escaping (T?) -> Void,
                             errorHandler: ErrorHandler? = nil) {
    do {
      let urlReq = try router.asURLRequest()
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(DateFormatter.serverFormatter)
      AF.request(urlReq).responseDecodable(decoder: decoder) { (response: AFDataResponse<T>) in
        self.processResponse(resp: response, router: router, completionHandler: completionHandler, errorHandler: errorHandler)
      }
    } catch {
      print("Error creating request")
    }
  }

  func processResponse<T: Decodable>(resp: AFDataResponse<T>, router: Router,
                                     completionHandler: @escaping (T?) -> Void,
                                     errorHandler: ErrorHandler? = nil) {

    let response = resp.response
    let object = resp.value

    switch response?.statusCode ?? 0 {
    case 200..<400: // OK
      completionHandler(object)
    default:  // some (backend) error
      if let errorResponse = errorBackendMessage(data: resp.data), errorHandler != nil {
        errorHandler?(errorResponse, nil)
      } else if let error = resp.error as NSError?, errorHandler != nil {
        errorHandler?(nil, error)
      } else {
        completionHandler(nil)
      }
    }
  }

  func errorBackendMessage(data: Data?) -> ErrorResponse? {
    if let data = data {
      let error = try? JSONDecoder().decode(ErrorResponse.self, from: data)
      return error
    }
    return nil
  }
}
