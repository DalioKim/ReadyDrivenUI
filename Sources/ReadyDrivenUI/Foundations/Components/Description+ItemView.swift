//
//  Description+ItemView.swift
//  
//
//  Created by 김동현 on 2023/08/22.
//

import SwiftUI

extension BaseDescriptionView {
    public struct ItemView: View {
        typealias Layout = Description.ItemStyle.Layout
        
        public let style: Description.ItemStyle
        
        public var body: some View {
            Group {
                switch style {
                case let .default(icon, content, layout):
                    defaultView(icon: icon, mainContent: content, layout: layout)
                case let .detail(icon, main, sub, layout):
                    detailView(icon: icon, mainContent: main, subContent: sub, layout: layout)
                case let .onlyText(main, sub, layout):
                    textLayer(mainContent: main, subContent: sub, layout: layout)
                }
            }
        }
    }
}

extension BaseDescriptionView.ItemView {
    private func defaultView(icon: String, mainContent: String, layout: Layout) -> some View {
        AnyLayout(layout == .horizontal ? .hStack() : .vStack()) {
            Image(icon, bundle: Bundle.module).asIconStyle()
            Text(mainContent)
        }
    }
    
    private func detailView(icon: String, mainContent: String, subContent: String, layout: Layout) -> some View {
        AnyLayout(layout == .horizontal ? .hStack() : .vStack()) {
            Image(icon, bundle: Bundle.module).asIconStyle()
            textLayer(mainContent: mainContent, subContent: subContent, layout: .vertical)
        }
    }
    
    private func textLayer(mainContent: String, subContent: String, layout: Layout) -> some View {
        AnyLayout(layout == .horizontal ? .hStack() : .vStack()) {
            Text(mainContent)
            Text(subContent)
        }
    }
}
