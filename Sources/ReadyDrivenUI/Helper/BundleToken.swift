//
//  BundleToken .swift
//  
//
//  Created by 김동현 on 2023/08/25.
//

import Foundation

final class BundleToken {
  static let bundle: Bundle = {
    return Bundle.module
  }()
}
