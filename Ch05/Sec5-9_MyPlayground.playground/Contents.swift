import UIKit

/**
 -----------------------------------------------------------------
 Swift シンタックスの基礎知識 - do-try-catch を使う例外処理

 ■ 例外処理の構文
 ```Swift 例外処理の基本的な構文
 do {
    try 例外が発生する可能性がある処理
 } catch {
    例外を受けて実行するステートメント
 }
 ```
 -----------------------------------------------------------------
 */

/**
 -----------------------------------------------------------------
 ■ Errorオブジェクトをユーザー定義関数でスローする
 スローするErrorオブジェクトをenumで定義する。`enum`(列挙型)という構文。なお、
 エラーを定義する場合には必ず`Errorプロトコル`と呼ばれる土台となる規則に従う必要
 がある。
 エラーをスローするユーザー関数を定義する。スローするには`throws`をつけ、
 `エラーをthrowでスローする`。
 -----------------------------------------------------------------
 */
KeyErrorを定義する: do {
    enum KeyError: Error {
        case uniqueError
        case lengthError
    }

    /// 文字連結する関数
    /// - Parameters:
    ///   - key1: 文字列
    ///   - key2: 文字列
    /// - Throws: KeyError 引数の文字列が5 ~ 10文字の範囲外の場合
    /// - Returns: 連結した文字列
    func keyMaker(_ key1: String, _ key2: String) throws -> String {
        // key1とkey2が同値の場合
        guard key1 != key2 else {
            throw KeyError.uniqueError
        }
        // 引数の文字列が5 ~ 10文字の範囲外の場合
        guard (5...10).contains(key1.count) && (5...10).contains(key2.count) else {
            throw KeyError.lengthError
        }
        // 引数の文字列を結合してシャッフルする
        let result = (key1 + key2).shuffled()
        return String(result)
    }

    エラーの種類を区別せずに例外処理をする : do {
        /// keyMakerを呼び出し関数
        /// - Parameters:
        ///   - key1: 文字列
        ///   - key2: 文字列
        func testKeyMake1(_ key1: String, _ key2:String) {
            do {
                let result = try keyMaker(key1, key2)
                print(result)
            // エラーの種類を指定していないので、エラーは全てキャッチする
            } catch {
                print("エラー")
            }
        }

        // キーを与えてテスト
        testKeyMake1("Swift", "1234567")    // 成功する
        testKeyMake1("Swift", "Swift")      // エラー ※引数が同値
        testKeyMake1("Swift", "UI")         // エラー ※第二引数の文字数が5以下
    }

    エラーの種類を区別して例外処理をする: do {
        /// keyMaker呼び出し関数
        /// - Parameters:
        ///   - key1: 文字列
        ///   - key2: 文字列
        func testKeyMake2(_ key1: String, _ key2: String) {
            do {
                let result = try keyMaker(key1, key2)
                print(result)
            } catch KeyError.uniqueError {
                print("2つのキーが同じエラー")
            } catch KeyError.lengthError {
                print("文字数エラー")
            } catch {
                print("予期せぬエラー")
            }
        }

        // キーを与えてテスト
        testKeyMake2("Swift", "1234567")    // 成功する
        testKeyMake2("Swift", "Swift")      // 2つのキーが同じエラー
        testKeyMake2("Swift", "UI")         // 文字数えラー
    }
}
