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
            .onReceive(timer, perform: { _ in
                $selection.wrappedValue = $selection.wrappedValue == itemCount ? 0 : $selection.wrappedValue

                withAnimation{
                    $selection.wrappedValue += 1
                }
            })
    }
}

extension View {
    func addAutoSliderAction(delayTime: TimeInterval, selection: Binding<Int>, itemCount: Int) -> some View {
        modifier(AutoSliderModifier(delayTime: delayTime, selection: selection, itemCount: itemCount))
    }
}
