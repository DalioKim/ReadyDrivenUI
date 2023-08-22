//
//  Description.swift
//  
//
//  Created by 김동현 on 2023/08/16.
//

import SwiftUI

public enum Description {
    case more(description: (option: (trigger: Expandable.Trigger, transition: Expandable.Transition), item: TextSet))
    case list(_ descriptions: [Description.ItemStyle])
}
