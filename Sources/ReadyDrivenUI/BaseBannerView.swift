//
//  BaseBannerView.swift
//  
//
//  Created by 김동현 on 2023/08/01.
//

import SwiftUI

public struct BaseBannerView: View {
    public enum DisplayMode {
        case `default`(_ isAutoSlide: Bool)
        case poster(_ isAutoSlide: Bool)
        
        var isAutoSlide: Bool {
            switch self {
            case let .`default`(isAutoSlide), let .poster(isAutoSlide):
                return isAutoSlide
            }
        }
    }
    
    let images: [String]
    let displayMode: DisplayMode
    @State private var selection = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public var body: some View {
            TabView(selection : $selection) {
                ForEach(tabItems) { item in
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .tag(item.tag)
                }
            }
            .if(displayMode.isAutoSlide) {
                $0.addAutoSliderAction(delayTime: 1, selection: $selection, itemCount: images.count)
            }
    }
}

extension BaseBannerView {
    struct TabItem: Identifiable {
        let id = UUID()
        let image: String
        let tag: Int
    }
}

public extension BaseBannerView {
    init(_ image: String) {
        self.init(images: [image], displayMode: DisplayMode.poster(false))
    }
    
    init(_ images: [String], displayMode: DisplayMode) {
        self.init(images: images, displayMode: displayMode)
    }
}


@available(macOS 10.15, *)
extension BaseBannerView {
    private var tabItems: [TabItem] {
        images.enumerated().map { idx, item in
            TabItem(image: item, tag: idx)
        }
    }
}
