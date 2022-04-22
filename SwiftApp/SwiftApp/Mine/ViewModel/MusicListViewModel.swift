//
//  MusicListViewModel.swift
//  SwiftApp
//
//  Created by apple on 2022/4/21.
//

import Foundation
import RxSwift

struct Music {
    let name: String //歌名
    let singer: String //演唱者
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

//实现 CustomStringConvertible 协议，方便输出调试
extension Music: CustomStringConvertible {
    var description: String {
        return "name：\(name) singer：\(singer)"
    }
}

struct MusicListViewModel {
    let data = [
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
    ]
    var data2 = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
    ])
    
}

struct MusicCollectionViewModel{
    var  data = Observable.just([
        Music(name: "断桥残雪", singer: "许嵩"),
        Music(name: "如果当时", singer: "vae"),
        Music(name: "医生", singer: "许嵩"),
        Music(name: "送你的独白", singer: "许嵩"),
        Music(name: "情侣装", singer: "vae"),
        Music(name: "我想牵着你的手", singer: "许嵩"),
        Music(name: "想象之中", singer: "许嵩"),
        Music(name: "微博控", singer: "vae"),
        Music(name: "医生", singer: "许嵩"),
        Music(name: "散场电影", singer: "许嵩"),
        Music(name: "白马非马", singer: "vae"),
        Music(name: "尘世美", singer: "许嵩"),
        Music(name: "你若成风", singer: "许嵩"),
        Music(name: "我的baby", singer: "vae"),
        Music(name: "我很喜欢", singer: "许嵩"),
        Music(name: "多余的解释", singer: "许嵩"),
        Music(name: "有何不可", singer: "vae"),
        Music(name: "坏孩子", singer: "许嵩"),
        Music(name: "清明雨上", singer: "许嵩"),
        Music(name: "认错", singer: "vae"),
        Music(name: "城府", singer: "许嵩"),
        Music(name: "星座书上", singer: "许嵩"),
        Music(name: "灰色头像", singer: "vae"),
        Music(name: "不煽情", singer: "许嵩"),
        Music(name: "单人旅途", singer: "许嵩"),
        Music(name: "半城烟沙", singer: "vae"),
        Music(name: "素颜", singer: "许嵩"),
    ])
    
}
