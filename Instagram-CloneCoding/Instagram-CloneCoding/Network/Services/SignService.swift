//
//  SignService.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/13.
//

import Foundation
import Alamofire

enum SignService {
    case requestSignUp(email: String, name: String, pw: String)
    case requestSignIn(email: String, pw: String)
}

extension SignService: TargetType {
    
    var baseURL: String {
        return APIConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .requestSignUp:
            return "/auth/signup"
        case .requestSignIn:
            return "/auth/signin"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .requestSignUp, .requestSignIn:
            return .post
        }
    }

    var parameters: RequestParams {
        switch self {
        case .requestSignUp(let email, let name, let pw):
            let body: [String : Any] = [
                "email": email,
                "name": name,
                "password": pw
            ]
            return .requestParameters(body)
        case .requestSignIn(let email, let pw):
            let body: [String : Any] = [
                "email": email,
                "password": pw
            ]
            return .requestParameters(body)
        }
    }

}
