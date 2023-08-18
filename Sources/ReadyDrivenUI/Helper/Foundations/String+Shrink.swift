//
//  String+Shrink.swift
//  
//
//  Created by 김동현 on 2023/08/18.
//

import SwiftUI

public extension String {
    func shrink(target: CGSize, font: UIFont) -> String {
        let size = CGSize(width: target.width, height: .greatestFiniteMagnitude)
        let attributes: [NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font]
        
        var start  = 1
        var end = self.count
        var mid = end
        var tempText = self
        
        while ((end - start) > 1) {
            let attributedText = NSAttributedString(string: tempText, attributes: attributes)
            let boundingRect = attributedText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
            
            if boundingRect.size.height == target.height {
                break
                
            } else if boundingRect.size.height > target.height {
                end = mid
                mid = (end + start) / 2
                
            } else {
                start = mid
                mid = (start + end) / 2
                
            }
            tempText = String(self.prefix(mid))
        }
        
        return String(self.prefix(mid))
    }
}

