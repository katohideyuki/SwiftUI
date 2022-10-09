import UIKit

/**
 -----------------------------------------------------------------
 Swift シンタックスの基礎知識 - switch文

 ■ 値で処理を振り分けるswitch文
 複数の値をカンマで区切って指定できる。`breakがなくてもcase文を抜ける。`逆に意
 図的に次のcase文へ処理を続けたい場合は、`fallthrough`を実行する。
 ```Swift switch文の書式
 switch 式 {
    case 値1:
        ステートメントA
    case 値2:
        ステートメントB
    case 値3, 値4, 値5:
        ステートメントC
    default:
        ステートメントD
 }
 ```
 -----------------------------------------------------------------
 */
switch文を試す: do {
    func fortune(color: String) {
        // colorによって処理を振り分ける
        switch color {
        case "red", "yellow":
            print("\(color)は、当たり")

        case "green":
            print("\(color)は、大当たり")

        default:
            print("\(color)は、ハズレ")
        }
    }

    fortune(color: "yellow")        // 当たり
    fortune(color: "blue")          // ハズレ
    fortune(color: "green")         // 大当たり
    fortune(color: "red")           // 当たり
}

