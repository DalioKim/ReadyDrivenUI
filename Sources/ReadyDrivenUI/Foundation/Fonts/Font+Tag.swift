//
//  Font+Tag.swift
//  
//
//  Created by 김동현 on 2023/08/25.
//

import SwiftUI

public extension Font {
    enum Tag {
        case header
        case headline
        case titleDefault
        case titleModul
        case subtitle
        case body
        case legend
        case legendSmall
        
        var option: Option {
            switch self {
            case .header: return (.suite, .heavy, .h1)
            case .headline: return (.suite, .extraBold, .h2)
            case .titleDefault: return (.suite ,.bold, .h3)
            case .titleModul: return  (.suite ,.semibold, .h3)
            case .subtitle: return (.suite ,.medium, .bodyL)
            case .body: return (.suite, .regular, .bodyM)
            case .legend: return (.suite ,.light, .bodyM)
            case .legendSmall: return (.suite, .light, .bodyS)
            }
        }
    }
}
