import UIKit

/**
 -----------------------------------------------------------------
 Swift シンタックスの基礎知識 - クラス定義

 ■ クラスを定義する
 基本的にはjavaと同じ考え方。
 ```Swift クラス定義の書式
 class クラス {
    // プロパティ
    var 変数: 型 = 初期値

    // イニシャライザ
    init(引数: 型) {
        self.変数 = 引数
    }

    // メソッド
    func 関数名(引数: 型) -> 戻り値の型 {
        return 戻り値
    }
 }
 ```
 -----------------------------------------------------------------
 */

/**
 -----------------------------------------------------------------
 ■ MyFriendクラス
 -----------------------------------------------------------------
 */
class MyFriend {
    // プロパティ
    var name: String
    var age: Int

    // イニシャライザ ※初期値設定
    init(name: String, age: Int) {
        self.name = name
        self.age  = age
    }

    // メソッド
    func hello() -> String {
        let message = "ハロー! \(name)です。\(age)歳です。"
        return message
    }
}

/**
 -----------------------------------------------------------------
 ■ クラスのインスタンスを作る
 -----------------------------------------------------------------
 */
let friend1 = MyFriend(name: "植木", age: 31)
let friend2 = MyFriend(name: "さくら", age: 26)

プロパティを参照する: do {
    print(friend1.name + "と" + friend2.name + "は、ともだちです。")
    print(friend1.name + "は" + String(friend1.age) + "歳です。")

    friend2.age += 1    // プロパティを更新
    print(friend2.name + "は、誕生日で" + String(friend2.age) + "歳になりました。")
}

メソッドを実行する: do {
    print(friend1.hello())      // ハロー! 植木です。31歳です。
    print(friend2.hello())      // ハロー! さくらです。27歳です。
}

/**
 -----------------------------------------------------------------
 ■ スーパークラスを継承しているクラス
 ```Swift クラスを継承したクラス定義の書式
 class クラス名: スーパークラス {
    ...
 }
 ```
 -----------------------------------------------------------------
 */
MyFriendクラスを継承したクラス: do {
    class GoodFriend: MyFriend {
        let fortune = ["大吉", "吉", "小吉", "凶"]
        // 占いができる
        func uranai() -> String {
            let index = Int.random(in: 0 ..< fortune.count)
            return "今日の運勢は" + fortune[index] + "です！"
        }
        // スーパークラスのnameプロパティを使う
        func who() -> String {
            return name + "です。よろしく！"
        }
    }

    // スーパークラスのプロパティの初期値を指定する必要がある
    let friend3 = GoodFriend(name: "のん", age: 12)
    // サブクラスのメソッド
    print(friend3.uranai())     // 今日の運勢は吉です！
    print(friend3.who())        // のんです。よろしく！
    // スーパークラスのメソッド
    print(friend3.hello())      // ハロー! のんです。12歳です。
}

/**
 -----------------------------------------------------------------
 ■ スーパークラスの初期化
 サブクラスにイニシャライザがある場合は、スーパークラスのイニシャライザを
 `super.init(引数: 値)`のように呼び出してスーパークラスも初期化する必要がある。
 -----------------------------------------------------------------
 */
MyFriendクラスを継承したクラスでイニシャライザを定義: do {
    class GoodFriend: MyFriend {
        let fortune = ["大吉", "吉", "小吉", "凶"]
        var nickname: String        // 初期値がないのでイニシャライザで設定する
        // イニシャライザ
        init(name: String, age: Int, nickname: String) {
            self.nickname = nickname
            // スーパークラスの初期化
            super.init(name: name, age: age)
        }
    }
    let friend4 = GoodFriend(name: "片貝鯛造", age: 56, nickname: "イタサン")
    print(friend4.name + " " + String(friend4.age) + "歳です。")     // 片貝鯛造 56歳です。
    print("ニックネームは\(friend4.nickname)です。")                   // ニックネームはイタサンです。
}

/**
 -----------------------------------------------------------------
 ■ プロトコルが指定されているクラス
 プロトコルとはクラスを作る上での規格のようなもの。プロトコルを指定したならば、
 `プロトコルで規定されているメソッドを必ず実装しなければならない`。
 ```Swift クラス定義の書式（プロトコルが指定されている場合）
 class クラス名: スーパークラス, プロトコル, プロトコル {
    ...
    // プロトコルで実装を指されているメソッド
    func 関数名(引数: 型) -> 戻り値の型 {
        ...
        return 戻り値
    }
 }
 ```
 -----------------------------------------------------------------
 */

/**
 -----------------------------------------------------------------
 ■ extensionを使ってクラス拡張する
 `extension`を使うことで既存のクラスを手軽に拡張することができる。extensionで
 はget/setを使ったComputedプロパティとメソッドを追加できる。
 ```Swift エクステンション
 extension 既存のクラス名 {
    拡張ステートメント
 }
 -----------------------------------------------------------------
 */
// Playerクラス
class Player {
    var name: String = ""
    func hello() {
        print("やあ！" + name)
    }
}
// playerクラスを拡張
extension Player {
    var who: String {
        get        { return name }
        set(value) { name = value }
    }
    // 新しいメソッド
    func bye() {
        print("またね！" + name)
    }
}

// 拡張済みPlayerクラスを使う
let user = Player()
user.who = "健治"
user.hello()        // やあ！健治
user.bye()          // またね！健治

