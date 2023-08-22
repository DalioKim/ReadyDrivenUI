//
//  Description+Item.swift
//  
//
//  Created by 김동현 on 2023/08/22.
//

import Foundation

extension Description {
    public enum ItemStyle {
        case `default`(icon: String, mainContent: String, layout: ItemStyle.Layout)
        case detail(icon: String, mainContent: String, subContent: String, layout: ItemStyle.Layout)
        case onlyText(mainContent: String, subContent: String, layout: ItemStyle.Layout)
        
        public enum Layout {
            case vertical
            case horizontal
        }
    }
}

extension Description.ItemStyle: Identifiable {
    public var id : String { UUID().uuidString }
}
