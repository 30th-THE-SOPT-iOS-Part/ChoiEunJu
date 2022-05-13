//
//  SignAPI.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/13.
//

import Foundation
import Alamofire

class SignAPI {
    static let shared = SignAPI()
    
    private init() {}
}

// MARK: - API
extension SignAPI {
    
    /// [POST] 로그인 요청
    func requestSignInAPI(email: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(SignService.requestSignIn(email: email, pw: pw)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.signInJudgeData(status: statusCode, data: data)
                
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    /// [POST] 회원가입 요청
    func requestSignUpAPI(email: String, name: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(SignService.requestSignUp(email: email, name: name, pw: pw)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.signUpJudgeData(status: statusCode, data: data)
                
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

// MARK: - judgeData
extension SignAPI {
    private func signInJudgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<SignInDataModel>.self, from: data) else { return .pathErr }
        
        switch status {
        case 200...201:
            return .success(decodedData.message)
        case 400...409:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func signUpJudgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<SignUpDataModel>.self, from: data) else { return .pathErr }
        
        switch status {
        case 200...201:
            return .success(decodedData.message)
        case 400...409:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
