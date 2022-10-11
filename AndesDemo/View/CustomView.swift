//
//  CustomView.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/27.
//

import Foundation
import UIKit
class CustomView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOffset.height = 0.5
        self.layer.shadowColor = #colorLiteral(red: 0.9433211088, green: 0.9532697797, blue: 0.9660016894, alpha: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.7
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.borderColor = CGColor(red: 135/255, green: 178/255, blue: 248/255, alpha: 1)
        self.layer.borderWidth = 1.0
        
        
    }
}
