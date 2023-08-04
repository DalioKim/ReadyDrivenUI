//
//  Card.swift
//  
//
//  Created by 김동현 on 2023/08/04.
//

import SwiftUI

public struct Card {
    public enum Option {
        public enum Style {
            case card
            case banner
        }
    }
    
    public struct Item: Identifiable {
        public var id = UUID()
        var mainContent: String
        var subContents: [String]
        var tag: Int
    }

    let item: Item
    let optionStyle: Option.Style
}
