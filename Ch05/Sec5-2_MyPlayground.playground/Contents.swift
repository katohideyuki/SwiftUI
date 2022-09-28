import UIKit

let BORDER           = 80             // 合格点
let SUBJECT_MATH     = "数学"          // 教科：数学
let SUBJECST_ENGLISH = "英語"          // 教科：英語
let PASS             = " → 合格"       // 合格
let FAILURE          = " → 不合格"     // 不合格

/**
 -----------------------------------------------------------------
 if文で条件分岐する
 ```Swift if文の書式
 if (条件式) {
 trueのとき実行するステートメントA
 }
 ```
 -----------------------------------------------------------------
 */
_80点以上なら合格: do {
    func hantei(tokuten: Int) -> String {
        var result = "結果: \(tokuten)"
        // 80点以上なら
        if (tokuten >= BORDER) {
            result += PASS
        }
        return result
    }

    var test1 = hantei(tokuten: 67)
    var test2 = hantei(tokuten: 82)
    var test3 = hantei(tokuten: 56)
    print(test1)        // 結果: 67
    print(test2)        // 結果: 82 → 合格
    print(test3)        // 結果: 56
}

/**
 条件を満たさない場合の処理があるif-else文
 ```Swift if-else文の書式
 if (条件式) {
    trueのとき実行するステートメントA
 } else {
    条件式に当てはまらなかったとき実行するステートメントB
 }
 ```
 */
_80点以上なら合格_80点未満だと不合格: do {
    func hantei(tokuten: Int) -> String {
        var result = "結果: \(tokuten)"
        if (tokuten >= BORDER) {
            result += PASS
        } else {
            result += FAILURE
        }
        return result
    }

    var test1 = hantei(tokuten: 67)
    var test2 = hantei(tokuten: 82)
    var test3 = hantei(tokuten: 56)
    print(test1)        // 結果: 67 → 不合格
    print(test2)        // 結果: 82 → 合格
    print(test3)        // 結果: 56 → 不合格
}

/**
 -----------------------------------------------------------------
 条件をみたさないときに次の条件を試す
 ```Swift if-else if-else文の書式
 if (条件式1) {
    条件式1がtrueのとき実行するステートメントA
 } else if (条件式2) {
    条件式1がtrueではなく、条件式がtrueのとき実行するステートメントB
 } else {
    どれにも当てはまらなかったときに実行するステートメントC
 }
 ```
 -----------------------------------------------------------------
 */
_80点以上なら優秀_60から80点なら合格_60点未満だと不合格: do {
    func hantei(tokuten: Int) -> String {
        var result = "結果: \(tokuten)"
        if (tokuten >= 80) {
            result += "\(PASS)・優秀"
        } else if (tokuten >= 60) {
            result += PASS
        } else {
            result += FAILURE
        }
        return result
    }
    var test1 = hantei(tokuten: 67)
    var test2 = hantei(tokuten: 82)
    var test3 = hantei(tokuten: 56)
    print(test1)        // 結果: 67 → 合格
    print(test2)        // 結果: 82 → 合格・優秀
    print(test3)        // 結果: 56 → 不合格
}

/**
 -----------------------------------------------------------------
 条件式を論理演算子を使って作る
 - && : AND検索
 - ||    : OR検索
 - !     : 反転
 -----------------------------------------------------------------
 */
条件式を論理演算子を使って作る: do {
    _2教科とも80点以上のとき合格_どちらかが80点未満だと不合格: do {
        func scoreJudg(math: Int, english: Int) -> String {
            var result = "数学: \(math), 英語: \(english)"
            if (math >= BORDER) && (english >= BORDER) {
                result += PASS
            } else {
                result += FAILURE
            }
            return result
        }

        var test1 = scoreJudg(math: 97, english: 68)
        var test2 = scoreJudg(math: 81, english: 83)
        var test3 = scoreJudg(math: 72, english: 65)
        print(test1)        // 数学: 97, 英語: 68 → 不合格
        print(test2)        // 数学: 81, 英語: 83 → 合格
        print(test3)        // 数学: 72, 英語: 65 → 不合格
    }

    どちらか1教科でも80点以上のとき: do {
        func scoreJudg(math: Int, english: Int) -> String {
            var result = "数学: \(math), 英語: \(english)"
            if (math >= BORDER) || (english >= BORDER) {
                result += PASS
            } else {
                result += FAILURE
            }
            return result
        }
        var test1 = scoreJudg(math: 97, english: 68)
        var test2 = scoreJudg(math: 81, english: 83)
        var test3 = scoreJudg(math: 72, english: 65)
        print(test1)        // 数学: 97, 英語: 68 → 合格
        print(test2)        // 数学: 81, 英語: 83 → 合格
        print(test3)        // 数学: 72, 英語: 65 → 不合格
    }
}
