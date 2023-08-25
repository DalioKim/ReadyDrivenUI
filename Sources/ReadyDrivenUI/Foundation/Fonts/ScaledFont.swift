//
//  ScaledFont.swift
//
//
//  Created by 김동현 on 2023/08/24.
//

import SwiftUI

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    
    var style: Font.Family
    var weight: Font.CustomWeight
    var size: Font.Size
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size.rawValue)
        return content
            .font(.init(style, weight, scaledSize))
    }
}

extension View {
    func scaledFont(_ font: Font.Family, _ weight: Font.CustomWeight, size: Font.Size) -> some View {
        modifier(ScaledFont(style: font, weight: weight, size: size))
    }    
}
