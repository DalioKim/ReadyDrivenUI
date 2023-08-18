//
//  Slide+ApplyHandler.swift
//  
//
//  Created by 김동현 on 2023/08/04.
//

import SwiftUI

extension View {
    @ViewBuilder
    func applyHandler(slide: Slide, selection: Binding<Int>) -> some View {
        switch slide.option {
        case (.tab, .manual, _):
            self.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        case (.tab, .auto, _):
            self.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .addAutoSliderAction(delayTime: Slide.Opiton.defaultIntervalTime,
                                     selection: selection, itemCount: slide.items.count - 1)
        }
    }
}


