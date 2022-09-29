import UIKit

/**
 -----------------------------------------------------------------
 構造体の中に関数を定義する
 ```Swift 関数定義がある構造体の書式
 struct 名前: プロトコル {
    let 変数1
    var 変数2
    ...
 ```
 -----------------------------------------------------------------
 */

/**
 -----------------------------------------------------------------
 外部引数名とは
 `引数を受け取る変数（パラメータ変数）に付けた名前`のこと。
 関数を呼び出す側が、引数に何を渡せば良いかを分かりやすくするために、「外部引数名」
 というものがある。逆に「内部引数名」とは、引数を受け取った関数内で使用する時に指定
 する名前。

 `基本的には「外部引数名」と「内部引数名」は同じの方が分かりやすい。`
 ただし、外部引数名が長い場合は、「内部引数名」を短く`num`とか`str`とかで記述する
 のもあり。

 ```Swift 外部引数名と内部引数名が別の名前の場合
 func sample(externalA internalB: Int) -> Int {
    // 関数内で使用する側は、内部引数名を指定
    print(internalB)
 }
 // 呼び出す側は、外部引数名を指定
 sample(externalA: 10)      // 結果は10
 ```

 ```Swift 外部引数名と内部引数名が同じ名前の場合
 func sample(externalA: Int) -> Int {
    // 関数内で使用する側は、内部引数名を指定
    print(externalA)
 }
 // 呼び出す側は、外部引数名を指定
 sample(externalA: 10)      // 結果は10
 ```
 -----------------------------------------------------------------
 */
外部引数名がある関数とない関数の定義: do {
    let unitPrice = 240

    /// 外部引数名なし , 内部引数名 num
    /// - Parameter num: 個数
    /// - Returns: 金額（単価 * 個数 ）
    func calcA(num: Int) -> Int {
        let price = unitPrice * num
        return price
    }

    /// 外部引数名 quantity , 内部引数名 num
    /// - Parameter num: 個数
    /// - Returns: 金額（単価 * 個数 ）
    func calcB(quantity num: Int) -> Int {
        let price = unitPrice * num
        return price
    }

    /// 外部引数名 _ , 内部引数名 num
    /// - Parameter num: 個数
    /// - Returns: 金額（単価 * 個数 ）
    func calcC(_ num: Int) -> Int {
        let price = unitPrice * num
        return price
    }

    // 関数calcを実行する場合の引数の違い
    print("calcA(num: Int)の場合          : \(calcA(num: 2))円")
    print("calcB(quantity num: Int)の場合 : \(calcB(quantity: 2))円")       // 外部引数名を指定する
    print("calcC(_ num: Int)             : \(calcC(2))円")                 // 引数名を指定しない
}
