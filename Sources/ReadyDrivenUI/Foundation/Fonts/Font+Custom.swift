//
//  Font+Custom.swift
//
//
//  Created by 김동현 on 2023/08/24.
//

import SwiftUI

fileprivate func rawName(_ family: Font.Family, _ weight: Font.CustomWeight) -> String {
    let fontWeight: String
    switch (family, weight) {
    default: fontWeight = weight.rawValue
    }
    
    return fontWeight.isEmpty ? "\(family.rawValue)" : "\(family.rawValue)-\(fontWeight)"
}

fileprivate func register(_ family: Font.Family, _ weight: Font.CustomWeight) {
    let fileExt: String
    switch (family, weight) {
    default: fileExt = ".otf"
    }
    let path = rawName(family, weight) + fileExt
    guard let url = BundleToken.bundle.url(forResource: path, withExtension: nil) else { return }
    
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
}

fileprivate func registerIfNeeded(_ family: Font.Family, _ weight: Font.CustomWeight) {
#if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family.rawValue).contains(weight.rawValue) {
        register(family, weight)
    }
#elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
        register(family, weight)
    }
#endif
}

extension Font {
    enum Family: String {
        case suite = "SUITE"
    }
    
    enum CustomWeight: String {
        case regular = "Regular"
        case medium = "Medium"
        case light = "Light"
        case heavy = "Heavy"
        case bold = "Bold"
        case semibold = "Semibold"
        case extraBold = "ExtraBold"
    }
    
    enum Size: CGFloat {
        case h1 = 36, h2 = 28, h3 = 20
        case bodyL = 17, bodyM = 14, bodyS = 12
    }
}

extension Font {
    init(_ family: Family = .suite, _ weight: CustomWeight, _ scaledSize: CGFloat) {
        registerIfNeeded(family, weight)
        self.init(UIFont(name: rawName(family, weight), size: scaledSize) ?? .systemFont(ofSize: scaledSize))
    }
}
