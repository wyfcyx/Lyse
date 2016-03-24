//
//  Lyric.swift
//  Lyse
//
//  Created by wyfcyx on 16/3/23.
//  Copyright © 2016年 jz. All rights reserved.
//

import Foundation

struct Part {								//歌词的片段
    var sinogram: String = ""				//汉字部分
    var hiragana: String = ""				//平假名部分
    init(sinogram: String, hiragana: String) {
        self.sinogram = sinogram
        self.hiragana = hiragana
    }
}
class Lyric {
    var words: [Part] = []					//存放歌词
    func insertPart(part: Part) {
        words.append(part)
    }
    func output() {
        for part in words {
            print("\(part.sinogram)", terminator: "")
            if part.hiragana != "" {
                print("(\(part.hiragana))", terminator: "")
            }
        }
        print("")
    }
}