//
//  Quotes.swift
//  1-2-QuotesGenerator
//
//  Created by sungyeopTW on 2022/04/12.
//
import UIKit
import Foundation

struct Quote {
    let content: String
    let name: String
}

let quotes = [
    Quote(content: "죽음을 두려워 하는 나머지 삶을 시작조차 못하는 사람이 많다.", name: "벤다이크"),
    Quote(content: "나는 나 자신을 빼 놓고는 모두 안다.", name: "비용"),
    Quote(content: "편견이란 실효성이 없는 의견이다.", name: "암브로스 빌"),
    Quote(content: "분노는 바보들의 가슴속에서만 살아간다.", name: "아인슈타인"),
    Quote(content: "몇 번이라도 좋다! 이 끔찍한 생이여... 다시!", name: "니체")
]

func getRandomQoutes(_ quoteLabel: UILabel, _ nameLabel: UILabel) {
    let countOfQuotes = UInt32(quotes.count) // qoutes의 길이를 UInt32 타입으로 변환
    let randomNumber = Int(arc4random_uniform(countOfQuotes)) // 0 ~ (qoutes.count - 1) 사이의 난수생성
    let quote = quotes[randomNumber]
    
    quoteLabel.text = quote.content
    nameLabel.text = quote.name
}


