//
//  Extension.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/28.
//

import UIKit

extension UILabel {
    
    func setCharacterSpacing(characterSpacing: CGFloat = 2.0) {
        
        guard let labelText = text else { return }
        
        let attributedString: NSMutableAttributedString
        if let labelAttributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Character spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
}

extension Encodable {
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}
extension UIView{
    public class func loadFromNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
