//
//  Image+IconStyle.swift
//  
//
//  Created by 김동현 on 2023/08/22.
//

import SwiftUI

extension Image {
    func asIconStyle(withMaxWidth maxWidth: CGFloat = 20, withMaxHeight maxHeight: CGFloat = 20) -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: maxWidth, height: maxHeight)
            .foregroundColor(.white)
    }
}
