//
//  MoreView.swift
//  
//
//  Created by 김동현 on 2023/08/18.
//

import SwiftUI

public enum Expandable {
        public enum Trigger {
            case button
            case text
        }
        
        public enum Transition {
            case expansion
            case sheet
        }    
}
