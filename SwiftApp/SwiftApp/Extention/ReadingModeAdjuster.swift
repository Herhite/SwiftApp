//
//  ReadingModeAdjuster.swift
//  SwiftApp
//
//  Created by apple on 2022/4/21.
//

import Foundation
import RxSwift
import RxCocoa

enum ReadingMode {
    case dayTheme, nightTheme
}

// MARK: - 阅读体验调节器
class ReadingModeAdjuster {
    
    static var readingMode = ReadingMode.dayTheme
    
    init() { }
    
    static func updateStatus(readingMode: ReadingMode = .dayTheme) {
        self.readingMode = readingMode
    }
}
