//
//  MusicModel.swift
//  RxSwiftExample
//
//  Created by 郑小燕 on 2018/6/6.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit

struct Music {
    var name = ""//歌名
    var singer = ""//演唱者
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name: \(name) singer: \(singer)"
    }
}
