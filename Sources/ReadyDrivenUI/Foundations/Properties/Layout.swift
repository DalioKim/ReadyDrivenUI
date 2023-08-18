//
//  Layout.swift
//  
//
//  Created by 김동현 on 2023/08/18.
//

import SwiftUI

public enum Layout {
    public enum Option {
        case hStack(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil)
        case zStack(alignment: Alignment)
        case vStack(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil)
    }
}
