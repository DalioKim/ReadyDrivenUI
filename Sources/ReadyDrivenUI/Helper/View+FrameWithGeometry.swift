//
//  View+FrameWithGeometry.swift
//  
//
//  Created by 김동현 on 2023/08/04.
//

import SwiftUI

extension View {
    @ViewBuilder func frameWithGeometry(widthRatio: CGFloat, heightRatio: CGFloat) -> some View {
        GeometryReader {
            self.frame(width: $0.size.width * widthRatio, height: $0.size.height * heightRatio)
        }
    }
}
