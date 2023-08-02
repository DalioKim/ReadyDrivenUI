//
//  AutoSliderModifier.swift
//  
//
//  Created by 김동현 on 2023/08/01.
//

import SwiftUI

struct AutoSliderModifier: ViewModifier {
    var delayTime: TimeInterval
    @Binding var selection: Int
    var itemCount: Int
    
    func body(content: Content) -> some View {
        let timer = Timer.publish(every: delayTime, on: .main, in: .common).autoconnect()
        return content
            .tabViewStyle(PageTabViewStyle())
            .onReceive(timer, perform: { _ in
                withAnimation{
                    $selection.wrappedValue = $selection.wrappedValue < itemCount ? $selection.wrappedValue + 1 : 0
                }
            })
    }
}

@available(macOS 11.0, *)
extension TabView {
    func addAutoSliderAction(delayTime: TimeInterval, selection: Binding<Int>, itemCount: Int) -> some View {
        modifier(AutoSliderModifier(delayTime: delayTime, selection: selection, itemCount: itemCount))
    }
}
