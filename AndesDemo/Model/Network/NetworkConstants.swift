//
//  NetworkConstants.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/28.
//

import Foundation

struct NetworkConstants {
    
    static let httpBaseUrl = "http://"
    static let httpsBaseUrl = "https://"
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case xml = "application/xml"
        case x_www_form_urlencoded = "application/x-www-form-urlencoded"
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum RequestError: Error {
    case unknownError
    case connectionError
    case authorizationError
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case internalError
    case badGateway
    case jsonDecodeFailed
}

enum ApiPathConstants: String {
    case login = "192.168.1.228:5000/account/login"
    case logout = "192.168.1.228:5000/account/logout"
    case cabinet = "192.168.1.228:5000/account/inventory"
}
