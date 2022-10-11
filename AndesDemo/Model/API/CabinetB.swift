//
//  CabinetB.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/28.
//

import Foundation

struct CabinetBRequset: Codable {
    
    var cabinet: String
}

struct CabinetBResponse: Decodable {
    
    let Gauze: Int
    
    let Cotton_Swab: Int
    
    let Ear_Thermometer: Int
    
    let Normal_Saline: Int
}
