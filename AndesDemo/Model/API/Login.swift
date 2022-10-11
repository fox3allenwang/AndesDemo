//
//  Login.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/27.
//

import Foundation

struct LoginRequest: Codable {
    
    var account: String
    
    var password: String
}

struct LoginResponse: Decodable {

    let status: String
    
    let message: String
}
