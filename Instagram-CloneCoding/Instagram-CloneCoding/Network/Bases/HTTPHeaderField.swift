//
//  HTTPHeaderField.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/13.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}
