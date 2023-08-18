//
//  ExpandableText.swift
//  
//
//  Created by 김동현 on 2023/08/16.
//

import SwiftUI

public struct ExpandableText: View {
    private typealias Option = (layout: Layout.Option, trigger: Expandable.Opiton.Trigger)
    
    @State private var isExpanded = false
    @State private var isTuncated = false
    @State private var shrinkText: String
    
    private let option: Option
    private let textSet: TextSet
    private let lineLimit: Int
        
    public var body: some View {
        buildUI.applyHandler(isExpanded: $isExpanded, isTuncated: $isTuncated, shrinkText: $shrinkText, textSet: textSet, trailingText: " ... read more", lineLimit: lineLimit)
    }
    
    var buildUI: some View {
        AnyLayout(option.layout) {
            textLayer
            buttonLayer
        }
    }
}

// MARK: - Public Initialize

extension ExpandableText {
    public init(_ text: String, lineLimit: Int, trigger: Expandable.Opiton.Trigger) {
        _shrinkText =  State(wrappedValue: text)
        self.lineLimit = lineLimit
        self.textSet = TextSet(text: text, font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body), color: .gray)
        self.option = (layout: trigger == .text ? .zStack : .vStack, trigger: trigger)
    }
}

// MARK: - Private SubViews

extension ExpandableText {
    private var textLayer: some View {
        Group {
            switch (option.trigger, isTuncated) {
            case (.text, true) :
                Text(mainText)
                + Text(moreLessText)
                    .bold()
            default:
                Text(mainText)
            }
        }
    }
    
    private var buttonLayer: some View {
        Group {
            switch (option.trigger, isTuncated) {
            case (.text, true):
                Button(action: {
                    isExpanded.toggle()
                }, label: {
                    HStack {
                        Spacer()
                        Text("")
                    }
                    .opacity(0)
                })
                
            case (.button, true):
                Button(action: {
                    isExpanded.toggle()
                }, label: {
                    Text("더보기")
                })
            default: EmptyView()
            }
        }
    }
}

// MARK: - Private Properties

extension ExpandableText {
    private var mainText: String {
        isExpanded ? textSet.text : shrinkText
    }
    
    private var moreLessText: String {
        isExpanded ? " read less" : " ... read more"
    }
}
