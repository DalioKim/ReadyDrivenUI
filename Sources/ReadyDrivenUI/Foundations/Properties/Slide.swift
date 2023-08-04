//
//  Slide.swift
//  
//
//  Created by 김동현 on 2023/08/04.
//

import SwiftUI

public struct Slide {
    public enum Opiton {
        public enum Style {
            case tab
        }
        public enum Mode {
            case manual
            case auto
        }
        
        static let defaultIntervalTime: Double = 1
        
    }
    
    let option: (style: Opiton.Style, mode: Opiton.Mode)
    let items: [Card.Item]
}

