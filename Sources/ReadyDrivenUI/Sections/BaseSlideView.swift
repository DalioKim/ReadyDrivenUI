//
//  BaseBannerView.swift
//  
//
//  Created by 김동현 on 2023/08/01.
//

import SwiftUI

public struct BaseSlideView: View {
    public let uiModel: Slide
    @State private var selection = 0
    
    public var body: some View {
        buildUI.applyHandler(slide: uiModel, selection: $selection)
    }
    
    @ViewBuilder
    var buildUI: some View {
        switch uiModel.option.style {
        case .tab: tabSlide
        }
    }
    
    public init(images: [String], slideOpion: (Slide.Opiton.Style, Slide.Opiton.Mode)) {
        let items = images.enumerated().map { Card.Item(mainContent: $1, subContents: [], tag: $0) }
        self.uiModel =  Slide(option: slideOpion, items: items )
    }
}

extension BaseSlideView {
    private var tabSlide: some View {
        TabView(selection : $selection) {
            ForEach(uiModel.items) {
                BaseCardView(uiModel: Card(item: $0, optionStyle: .banner))
                    .tag($0.tag)
            }
        }
    }
}
