//
//  AnyLayout.swift
//  
//
//  Created by 김동현 on 2023/08/18.
//

import SwiftUI

public struct AnyLayout<Content>: View where Content: View {
    public typealias Option = Layout.Option
    
    private let content: () -> Content
    private let option: Option
    
    public init(_ option: Option,
         @ViewBuilder content: @escaping () -> Content) {
        self.option = option
        self.content = content
    }
    
    public var body: some View {
        Group {
            switch option {
            case .hStack:
                HStack {
                    content()
                }
                
            case .zStack:
                ZStack(alignment: .bottomTrailing){
                    content()
                }
                
            case .vStack:
                VStack {
                    content()
                }
            }
        }
    }
}
