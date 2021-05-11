//
//  RandomUserRouter.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/11.
//

import Foundation
import Alamofire

let BASE_URL = "https://randomuser.me/api/"

enum RandomUserRouter: URLRequestConvertible {
    case getUsers(page: Int = 0, results: Int = 20)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getUsers:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        default:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getUsers(let page, let results):
            var params = Parameters()
            params["page"] = page
            params["results"] = results
            params["seed"] = "yoonah-dev"
            return params
        default:
            return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getUsers:
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            return request
        }
        
        return request
    }
}
