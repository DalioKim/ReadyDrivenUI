//
//  File.swift
//  
//
//  Created by 김동현 on 2023/08/21.
//

import SwiftUI

struct Icon: ToggleStyle {
    let images: (on: String, off: String)
    let onAction: () -> Void
    let offAction: () -> Void

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
            configuration.isOn ? onAction() : offAction()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(configuration.isOn ? images.on : images.off, bundle: Bundle.module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
        }
    }
}
