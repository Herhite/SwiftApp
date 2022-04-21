//
//  ThemeStyleConfig.swift
//  SwiftApp
//
//  Created by apple on 2022/4/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


struct NightTheme {
    // 主背景颜色
    static let primaryBackgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0)
    // 大标题文本颜色样式
    static let titleTextColor =  UIColor(red: 191/255.0, green: 191/255.0, blue: 191/255.0, alpha: 1.0)
    // 小标题文本颜色样式
    static let detailLabelTextColor = UIColor(red: 140/255.0, green: 140/255.0, blue: 140/255.0, alpha: 1.0)
}

struct DayTheme {
    // 主背景颜色
    static let primaryBackgroundColor = UIColor.white
    // 大标题文本颜色样式
    static let titleTextColor =  UIColor(red: 63/255.0, green: 63/255.0, blue: 63/255.0, alpha: 1.0)
    // 小标题文本颜色样式
    static let detailLabelTextColor = UIColor(red: 101/255.0, green: 106/255.0, blue: 113/255.0, alpha: 1.0)
    
}

struct MixStyle <T> {
    /// 混合风格类属性
    var dayTimeStyle: T // 日间模式样式输入
    var nightTimeStyle: T // 夜间间模式样式输入

    // outPut
    var presentedStyle: Driver<T> // 外部输出属性，即呈现给外部的模式样式

    fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器
    
//    /// 混合风格类初始化构造器的配置
//    init(dayTime dayStyle: T, nightTime nightStyle: T) {
//
//        self.dayTimeStyle = dayStyle
//        self.nightTimeStyle = nightStyle
        
        // 默认日间模式
//        presentedStyle = ReadingModeAdjuster.readingMode.asObservable().flatMapLatest { (readMode) -> Observable<T> in
//            switch readMode {
//            case .dayTime:
//                return Observable.just(dayStyle)
//            case .nightTime:
//                return Observable.just(nightStyle)
//            }
//        }
//        .asDriver(onErrorJustReturn: dayStyle)
//    }
}
