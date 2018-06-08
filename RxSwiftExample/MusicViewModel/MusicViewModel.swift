//
//  MusicViewModel.swift
//  RxSwiftExample
//
//  Created by 郑小燕 on 2018/6/6.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import RxSwift

struct MusicListViewModel {
    let data = Observable.just([Music(name: "无条件", singer: "陈奕迅"), Music(name: "你曾是少年", singer: "S.H.E"), Music(name: "从前的我", singer: "陈洁仪"), Music(name: "在木星", singer: "朴树")])
}
