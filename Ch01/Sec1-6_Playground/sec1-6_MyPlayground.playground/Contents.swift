import UIKit
/**
 # 前置き
 ## ■ 以下を表現するためdo文を使用する。(doの使い方として、良いか悪いかは一旦置いておく)
 - 学習していく上で、変数名はできる限り決まった名前を使いたい。
 - ただし、変数名が同じだと予期せぬ再代入が起き得るため、各変数のスコープを最小限にしたい。
 - 説明文の区切りを分かりやすくしたい。
 */


/**
 ---------------------------------------------
 ## ■ Playgroundを活用する、
 ---------------------------------------------
 */
// 式の実行
var greeting = "Hello, playground"
var a   = 1
var b   = 20
var c   = 3
var ans = a + b + c         // 24

// 式の再代入と再実行
c = 100
ans                         // 24
ans = a + b + c             // 121


/**
 ---------------------------------------------
 ## ■ Swiftシンタックスの基礎知識
 - 変数、タプル、型、繰り返し
 ---------------------------------------------
 */
変数宣言と初期化: do {
    var tanka = 120
    var ninzu = 3 + 2
    var price = tanka * ninzu
    print(price)                // 600
}


代入演算子: do {
    var km = 10
    km += 5                     // 15
    km += 5                     // 20
    km += 5                     // 25
    
    var value = 0
    value += 2                  // 2
    value *= 5                  // 10
    value /= 2                  // 2
}


型推論: do {
    var title  = "為替計算"       // Srting
    var dollar = 250            // Int
    var rate   = 108.5          // Double
    print(String(format: "title : %@, dollar : %d, rate : %f", title, dollar, rate))  // title : 為替計算, dollar : 250, rate : 108.50000
}


/**
 var 変数名 : 型
 var 変数名 : 型 = 初期値
 */
変数宣言で明示的に型を指定する: do {
    // 初期値を指定しない場合は、型を指定しなければならない。
    var title : String
    var dollar: Int
    var rate  : Double

    title  = "為替計算"
    dollar = 250
    rate   = 108.5
    
    print(title, dollar, rate) // 為替計算 250 108.5
    
    // 型が違う同士の計算はコンパイルエラーとなる(Int * Double)
//    var yen = dollar * rate
}


/**
 let 変数名 = 初期値
 let 変数名 : 型
 */
定数宣言: do {
    let TITLE = "為替計算"
    let TITLE_02: String
    // 定数の初期化
    TITLE_02 = "代入"
    print(TITLE, TITLE_02)  //為替計算 代入
    
    // 定数なので、初期化した後の代入はコンパイルエラー
//    TITLE_02 = "再代入"
}


文字列の演算: do {
    // ちなみにテキストブロックが使える
    let MESSAGE = """
        iosアプリはSwiftで作ります。
        空を素早く飛び回る"アマツバメ"です。
    """
    
    let NAME = "高橋"
    let WHO  = NAME + "さん"
    print(WHO)              // 高橋さん
    
    // 文字列の代入演算子
    // 空文字で初期化しないと連結できない(理由は後で調べる)
    var stars = ""
    stars += "★ "
    stars += "☆ "
    stars += "★ "
    print(stars)            // ★ ☆ ★
}


/**
 String(数値)
 */
数値を文字列に変換: do {
    let TANKA   = 240
    let KOSU    = 3
    let KINGAKU = String(TANKA * KOSU) + "円です"
    print(KINGAKU)          // 720円です
}

文字列に変数や式を埋め込む: do {
    let TIME   = 9.95
    let RESULT = "タイムは\(TIME)秒でした。"
    print(RESULT)           // タイムは9.95秒でした。
}


/**
 異なる型を扱える。
 タプル(tuple)を使うと、複数の値を1個の変数で扱えるようになる。
 異なった型の値を組み合わせて1つの値にすることもできる。
 */
複数の値をいっぺんに扱えるタプル : do {
    let GREETING = ("Hello", "こんにちは")
    let GUEST    = ("直鳥", "なおとり", 24)
    let POINT    = (3.1, 51.2, 13.8)
}


/**
 タプルの型は、含まれている値(要素)の個数とそれぞれに対応する値の型で決まる。
 */
タプルの型指定: do {
    var greeting: (String, String) = ("Hello", "こんにちは")
    var guest: (String, String, Int)
    guest = ("直鳥", "なおとり", 24)
    var point: (Double, Double, Double)
    point = (23.1, 51.2, 13.8)
    print(greeting, guest, point)         // ("Hello", "こんにちは") ("直鳥", "なおとり", 24) (23.1, 51.2, 13.8)
}


/**
 タプルの型を宣言していない場合でも、値を代入した時点で型推論が決まる。
 したがって、値を代入した後に別の型の値を代入しようとすると、当然コンパイルエラーになる。
 */
タプルの型推論と型エラー: do {
    var greeting = ("Hello", "こんにちは")
//    greeting   = ("よろしく", 4649)       // (String, Int)になっているのでコンパイルエラー
    var guest    = ("直鳥", "なおとり", 24)
//    guest      = ("金田一", "きんだいち")  // 要素の個数が一致しないのでコンパイルエラー
    print(greeting, guest)                // ("Hello", "こんにちは") ("直鳥", "なおとり", 24)
}


/**
 タプつの値を要素別に取り出す(展開、アンパック)するには、値を代入する変数を入れた
 同じ要素数のタプルを利用する。
 アンパック後に使わない要素がある場合は、該当位置に変数の代わりに_を書く。
 */
タプルを要素を個別に取り出す: do {
    var guest = ("桑原", "くわはら", 34)
    // "guest[1]の"くわはら"は使用しないので、_に代入する
    let (NAME, _, AGE) = guest
    let USER = NAME + "さん、" + "\(AGE)歳"
    print(USER)                           // 桑原さん、34歳
}


/**
 ラベル:型, ラベル:型
 ラベルがあれば、各要素を個別に「変数名.ラベル」のようにドット
 を使って指し示すことができる。
 */
ラベル付きタプルの型: do {
    var point: (x: Double, y: Double, z: Double)
    point = (4.2/**x*/, 3.5/**y*/, 6.1/**z*/)
    print(point.x, point.y, point.z)      // 4.2 3.5 6.1
}


/**
 タプル.番号
 タンプルの要素にはインデックス番号でもアクセスできる。
 要素を先頭から0, 1, 2 〜と数える。
 */
タプルの要素にインデックス番号でアクセスする: do {
    var value = (100, 200, 300)
    print(value.1)                        // 200
}


/**
 for 変数 in コレクション { ステートメント }
 ひとまず、javaで言うところの拡張for文みたいなものと、覚えておく。
 */
処理を繰り返すfor_in文: do {
    let NUM_ARRAY = [4, 8, 15, 16, 23, 42]
    var sum = 0
    // NUM_ARRAYの中身を一つずつ取り出し、累積していく。
    for num in NUM_ARRAY {
        sum += num
    }
    print("合計 : \(sum)")                // 合計 : 108
}


/**
 for 変数 in 開始値 ... 終了値      ※ 終了値を含む
 または
 for 変数 in 開始値 ..< 終了値  ※ 終了値を含まない
 など。
 範囲のことを"レンジ"と言う。(そのままrange)
 javaで言うところの通常for文みないなものと、覚えておく。
 */
整数のレンジから数値を順に取り出して使う: do {
    // 0度から始め、719度まで1度ずつ角度を上げていく
    // Double.piは、円周率のこと(3.141592653589793)
    for x in 0 ..< 360 * 2 {
        let radian = Double(x) * Double.pi / 180 // rad(ラジアン) = 角度 * 円周率 / 180
        let y      = sin(radian)                 // 三角関数sinでradianを渡し、正弦を返却する
        print(x, y)                              // 719 -0.017452406437282915
    }
}


/**
 ループを5回繰り返す。
 レンジから取り出した値は使わないので、値を受け取る変数の代わりに
 _を指定する。
 */
for_inを利用してループ処理を行う: do {
    var stars = ""
    // 1以上5以下
    for _ in 1 ... 5 {
        stars += "★ "
        print(stars)                            // ★ ★ ★ ★ ★
    }
}
