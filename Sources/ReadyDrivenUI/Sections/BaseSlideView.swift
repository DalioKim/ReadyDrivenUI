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
    
    var buildUI: some View {
        mainLayer
            .overlay(controllerLayer)
    }
    
    public init(images: [String], slideOpion: (Slide.Opiton.Style, Slide.Opiton.Mode, Slide.Opiton.Controller)) {
        let items = images.enumerated().map { Card.Item(mainContent: $1, subContents: [], tag: $0) }
        self.uiModel =  Slide(option: slideOpion, items: items )
    }
}

// MARK: - Layer

extension BaseSlideView {
    @ViewBuilder
    private var mainLayer: some View {
        switch uiModel.option {
        case (.tab, .manual, _): tabSlide
        case (.tab, .auto, _): tabSlide
        }
    }
    
    @ViewBuilder
    private var controllerLayer: some View {
        switch uiModel.option.controller {
        case .threedots: ThreeDotsStyleControllerView(numberOfPages: uiModel.items.count, currentIndex: selection)
        }
    }
}

// MARK: - Layer

extension BaseSlideView {
    private var tabSlide: some View {
        TabView(selection : $selection) {
            ForEach(uiModel.items) {
                BaseCardView(uiModel: Card(item: $0, optionStyle: .banner))
                    .tag($0.tag)
            }
        }
    }
    
    private var autoTabSlide: some View {
        TabView(selection : $selection) {
            ForEach(uiModel.items) {
                BaseCardView(uiModel: Card(item: $0, optionStyle: .banner))
//                    .tag($0.tag)
            }
        }
    }

    

    
}
