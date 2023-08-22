//
//  BaseDescriptionView.swift
//  
//
//  Created by 김동현 on 2023/08/21.
//

import SwiftUI

public struct BaseDescriptionView: View {
    private let title: String?
    private let uiModel: Description

    public var body: some View {
        VStack {
            titleLayer
            detailLayer
        }
        .background(Color.gray)
    }
    
    public init(title: String? = nil, _ uiModel: Description) {
        self.title = title
        self.uiModel =  uiModel
    }
}

// MARK: - Layer

extension BaseDescriptionView {
    private var titleLayer: some View {
        Text(title ?? "")
            .bold()
    }
    
    @ViewBuilder
    private var detailLayer: some View {
        Group {
            switch uiModel {
            case let .more(description): ExpandableText(description.item.text, lineLimit: 3, trigger: description.option.trigger)
                
            case let .list(items):
                AnyLayout(.vStack()) { ForEach(items) { ItemView(style: $0) } }
            }
        }
    }
    
}
