import UIKit

/**
 Swift シンタックスの基礎知識
 - 構造体とユーザ定義関数
 */

/**
 -----------------------------------------------------------------
 struct ContentViewとは
 structから始まる書式のことを構造体と呼ぶ。`struct ContentView`は「ContentView
 構造体」を定義している。

 たとえば、石には重さ、大きさ、材質などの複数の属性があり、これら属性をもった値を
 扱いたい場合に構造体が利用できる。

 ```swift 構造体の書式
 struct 名前 {
 // 属性(プロパティ)
 let 変数1
 var 変数2
 }
 ```
 structは値型
 値には参照型と値型があり、structは値型なので、変数に代入したり、関数の引数で渡すと
 複製された値が渡される。

 補足
 structの定義からインスタンス化するまでのコードを書く際は、do文で囲まない。do文の中
 にstructを定義してインスタンス化すると、`unknown context at $108b5d8ac ~`と
 いうエラーが返るため。
 -----------------------------------------------------------------
 */


/**
 -----------------------------------------------------------------
 Member構造体を定義する。
 属性として、level, name, ageの3個の変数を持っている。nameは後から値を変更できない
 ようletで宣言し、levelは初期値として1を設定する。

 構造体の名前の1文字目は大文字。
 -----------------------------------------------------------------
 */
// Member構造体
struct Member {
    let name: String
    var level = 1           // 初期値を1とする
    var age: Int
}

Member構造体の定義: do {
    // levelは初期値が設定されているので省略
    var member1 = Member(name: "鈴木", age: 19)
    var member2 = Member(name: "田中", level: 5, age: 23)

    // 構造体の属性つまり変数には「.」ドットを使って参照
    let text1 = "\(member1.name)さん \(member1.age)歳 レベル\(member1.level)"
    print(text1)                // 鈴木さん 19歳 レベル1


    // 属性を書き換える
    member2.level += 1
    let text2 = "\(member2.name)さん \(member2.age)歳 レベル\(member2.level)"
    print(text2)                // 田中さん 23歳 レベル6

    // 構造体の属性の値で計算する
    let agesum = member1.age + member2.age
    let text3 = "年齢の合計:\(agesum)歳"
    print(text3)                // 年齢の合計:42歳
}

/**
 -----------------------------------------------------------------
 構造体のイニシャライザ
 構造体の定義文にはイニシャライザinit()を定義できる。

 イニシャライザとは、
 構造体を作成したときに初期化のために自動で実行される特殊な関数。Javaでいうところ
 のコンストラクタみたいなモノ。

 イニシャライザの省略
 引数で受けた値をそのままプロパティの初期値を設定するだけならばinit()の定義を省略で
 きる。
 ※今回は、widthとheightの値によってsizeの値を分岐させているため、init()の定義が必要。

 self
 インスタンス自身を指すselfは、Javaでいうところのthisみたいなモノ。
 -----------------------------------------------------------------
 */
// Box構造体
struct Box {
    // プロパティ
    let width: Int              // 横幅
    let height: Int             // 高さ
    let size: String            // サイズ

    // イニシャライザ ※Int型の引数を2つ受け取る
    init(width: Int, height: Int) {
        self.width  = width
        self.height = height

        // 横幅と高さの合計が120以下であればサイズをMに, それ以外であればLを設定する
        if (width + height) < 120 {
            size = "M"
        } else {
            size = "L"
        }
    }
}

Box構造体の値を使う: do {
    let box1 = Box(width: 50, height: 50)
    let box2 = Box(width: 40, height: 100)
    print(box1)             // Box(width: 50, height: 50, size: "M")
    print(box2)             // Box(width: 40, height: 100, size: "L")
}
