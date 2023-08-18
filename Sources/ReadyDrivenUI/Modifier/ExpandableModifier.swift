//
//  ExpandableModifier.swift
//  
//
//  Created by 김동현 on 2023/08/18.
//

import SwiftUI

struct ExpandableModifier: ViewModifier {
    @Binding var isExpanded: Bool
    @Binding var isTuncated: Bool
    @Binding var shrinkText: String
    
    let text: String
    let trailingText: String
    let font: UIFont
    let lineLimit: Int

    func body(content: Content) -> some View {
        return content
            .background(GeometryReader { visibleTextGeometry in
                Color.clear.onAppear() {
                    $shrinkText.wrappedValue = text.shrink(target: visibleTextGeometry.size, font: font)
                    guard text != shrinkText else { return }
                    
                    let spacing = trailingText.count + 2
                    $shrinkText.wrappedValue = String(shrinkText.prefix(shrinkText.count - spacing)) 
                    isTuncated = true
                }
            })
            .animation(.easeInOut)
            .lineLimit(isExpanded ? nil : lineLimit)
    }
}

extension View {
    func setExpandable(isExpanded: Binding<Bool>,
                       isTuncated: Binding<Bool>,
                       shrinkText: Binding<String>,
                       text: String,
                       trailingText: String,
                       font: UIFont,
                       lineLimit: Int) -> some View {
        modifier(ExpandableModifier(isExpanded: isExpanded, isTuncated: isTuncated, shrinkText: shrinkText, text: text, trailingText: trailingText, font: font, lineLimit: lineLimit))
    }
}
