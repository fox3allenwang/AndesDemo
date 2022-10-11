//
//  Cabinet.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/28.
//

import Foundation

struct CabinetARequset: Codable {
    
    var cabinet: String
}

struct CabinetAResponse: Decodable {
    
    let Panadol: Int
    
    let Needle: Int
    
    let Band_Aid: Int
    
    let Hydrocolloid_Dressing: Int
}
