//
//  ScaledFont.swift
//
//
//  Created by 김동현 on 2023/08/24.
//

import SwiftUI

public struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    
    var style: Font.Family
    var weight: Font.CustomWeight
    var size: Font.Size
    
    public func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size.rawValue)
        return content
            .font(.init(style, weight, scaledSize))
    }
}

extension View {
    public func scaledFont(_ font: Font.Family, _ weight: Font.CustomWeight, size: Font.Size) -> some View {
        modifier(ScaledFont(style: font, weight: weight, size: size))
    }
    
    public func scaledFont(_ tag: Font.Tag) -> some View {
        modifier(ScaledFont(style: tag.option.family, weight: tag.option.weight, size: tag.option.size))
    }
}
