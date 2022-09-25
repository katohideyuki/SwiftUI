import UIKit

/**
 -----------------------------------------------------------------
 数値の乱数を作る
 数値の乱数は`random(in: 範囲)`で作ることができる。
 整数なら`Int.random(in: 範囲)`、浮動小数点なら`Double.random(in: 範囲)`
 -----------------------------------------------------------------
 */
整数1_10の乱数を5回作る: do {
    for _ in 1 ... 5 {
        let num = Int.random(in: 1 ... 10)
        print(num)
    }
}

整数0_1未満の乱数を5回作る: do {
    for _ in 1 ... 5 {
        let num = Double.random(in: 0 ..< 1)
        print(num)
    }
}

/**
 -----------------------------------------------------------------
 理論値(true/false)をランダムに選ぶ
 -----------------------------------------------------------------
 */
trueとfalseをランダムに5回選ぶ: do {
    for _ in 1 ... 5 {
        let value = Bool.random()
        print(value)
    }
}

/**
 -----------------------------------------------------------------
 コレクションからランダムに選ぶ
 `randomElement()`は配列などのコレクションから要素をランダムに取り出すメソッド。
 配列が空の場合は結果が`nil`になるため、取り出された値はOptional()でラップされた
 `Optional型の値`となる。したがって、中に入っている値を使うには`Optional`を
 アンラップする。

 次の例で、colors配列には値が必ず入っていることを前提としているため、値を取り出す
 時は`!`を付けることで強制アンラップして取り出している。
 -----------------------------------------------------------------
 */
配列colorsから色を5回選ぶ: do {
    let colors = ["green", "red", "blue", "pink", "orange"]
    for _ in 1 ... 5 {
        let item = colors.randomElement()
        print(item!)        // !を付けることで強制アンラップする
    }
}

// 文字列はコレクションなので、randomElement()を使って1文字ずつ取り出す
文字列ABCDEFGHIJKLMNから5文字を選ぶ: do {
    let letters = "ABCDEFGHIJKLMN"
    for _ in 1 ... 5 {
        let item = letters.randomElement()
        print(item!)
    }
}

/**
 -----------------------------------------------------------------
 コレクションの要素をシャッフルする
 `shuffle()`または`shuffled()`を使えば、配列や文字列などのコレクションの要素
 をシャッフルできる。shuffle()は`対象のコレクションの要素の並びを変更`するが、
 shuffled()は要素をシャッフルした`新しいコレクション`を返却し、対象のコレクションは
 変更されない。
 -----------------------------------------------------------------
 */
配列のシャッフル: do {
    var names = ["一美", "二美", "三美", "四美", "五美", "六美"]
    names.shuffle()     // 対象の配列を書き換える
    print(names)        // ["一美", "二美", "六美", "四美", "三美", "五美"]
}

文字列のシャッフル: do {
    let word    = "SwiftUI"
    let anagram = word.shuffled()
    print("word: \(word)")              // word: SwiftUI
    print("anagram: \(anagram)")        // anagram: ["I", "w", "f", "i", "U", "t", "S"]
}

// レンジに対してshuffle()は使えないため、shuffled()を使用する
レンジのシャッフル: do {
    var aRange = 1 ... 10
    let shuffledRange = aRange.shuffled()
    print(shuffledRange)        // [3, 10, 1, 2, 9, 5, 8, 6, 7, 4]
}
