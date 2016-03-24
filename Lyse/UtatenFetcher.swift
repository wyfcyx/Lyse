//
//  UtatenFetcher.swift
//  Lyse
//
//  Created by wyfcyx on 16/3/23.
//  Copyright © 2016年 jz. All rights reserved.
//

import Foundation

class UtatenFetcher {
    func getCompleteBracket(htmlSourceCode: String, leftIndex: String.Index) -> String.Index {
        var rightIndex = leftIndex.successor()
        while htmlSourceCode[rightIndex] != ">" {
            rightIndex = rightIndex.successor()
        }
        return rightIndex.successor()
    }
    func getBracketClass(bracket: String) -> String {
        var leftIndex = bracket.rangeOfString("class=\"")!.endIndex
        var ansString = ""
        while bracket[leftIndex] != "\"" {
            ansString.append(bracket[leftIndex])
            leftIndex = leftIndex.successor()
        }
        return ansString
    }
    func getLineOfHtmlSourceCode(htmlSourceCode: String, leftIndex: String.Index) -> (String.Index, String.Index) {
        var rightIndex = leftIndex
        let endIndex: String.Index!
        let nextIndex: String.Index!
        while htmlSourceCode[rightIndex] != "\n" {
            rightIndex = rightIndex.successor()
        }
        endIndex = rightIndex.predecessor()
        while true {
            rightIndex = rightIndex.successor()
            if htmlSourceCode[rightIndex] != "\n" && htmlSourceCode[rightIndex] != " " {
                break
            }
        }
        nextIndex = rightIndex
        return (endIndex, nextIndex)
    }
    func getAWord(htmlSourceCode: String, leftIndex: String.Index) -> (String.Index!, String!) {
        //暂且只考虑歌词中不含转义的情况
        var rightIndex = leftIndex
        var string: String = ""
        while htmlSourceCode[rightIndex] != "<" {
            rightIndex = rightIndex.successor()
        }
        for i in leftIndex..<rightIndex {
            string.append(htmlSourceCode[i])
        }
        return (rightIndex, string)
    }
    func getString(source: String, leftIndex: String.Index, rightIndex: String.Index) -> String {
        var ans = ""
        for i in leftIndex..<rightIndex {
            ans.append(source[i])
        }
        return ans
    }
    //只好希望没有奇怪的换行啦。。。
    func getLyric(htmlSourceCode: String) -> Lyric {
        var beginIndex = htmlSourceCode.rangeOfString("<div class=\"lyricBody\">")?.startIndex
        var endIndex: String.Index
        var nextIndex: String.Index
        var tempIndex: String.Index!
        var nowIndex: String.Index
        var stack: [String] = []
    	let ansLyric = Lyric()
        var lastWord: String!//存放最后一次得到的Word
        var lastPart: Part = Part(sinogram: "", hiragana: "")//存放最后一次得到的Part
        var bracketString: String
        while true {
            //得到一个新的行
            (endIndex, nextIndex) = getLineOfHtmlSourceCode(htmlSourceCode, leftIndex: beginIndex!)
            nowIndex = beginIndex!
            while nowIndex <= endIndex {
                if htmlSourceCode[nowIndex] == "<" {
                    tempIndex = getCompleteBracket(htmlSourceCode, leftIndex: nowIndex)
                    bracketString = getString(htmlSourceCode, leftIndex: nowIndex, rightIndex: tempIndex)
                    nowIndex = tempIndex
                    if bracketString.rangeOfString("<br />") != nil {
                        ansLyric.insertPart(Part(sinogram: "\n", hiragana: ""))
                    } else if bracketString.rangeOfString("</") != nil {
                        if stack[stack.count - 1] == "rb" {
                            lastPart.sinogram = lastWord
                        } else if stack[stack.count - 1] == "rt" {
                            lastPart.hiragana = lastWord
                        } else if stack[stack.count - 1] == "ruby" {
                            ansLyric.insertPart(lastPart)
                            //ansLyric.output()
                            lastPart = Part(sinogram: "", hiragana: "")
                        }
                        stack.popLast()
                    } else {
                        let className = getBracketClass(bracketString)
                        if (className != "ruby" && className != "rb" && className != "rt") {
                            print("New type occured!")
                        }
                        stack.append(className)
                    }
                } else {
                    (tempIndex, lastWord) = getAWord(htmlSourceCode, leftIndex: nowIndex)
                    nowIndex = tempIndex
                    if stack[stack.count - 1] == "medium" {
                        ansLyric.insertPart(Part(sinogram: lastWord, hiragana: ""))
                        //ansLyric.output()
                    }
                }
            }
            beginIndex = nextIndex
            if stack.count == 0 {
                break
            }
        }
        return ansLyric
    }
    
}