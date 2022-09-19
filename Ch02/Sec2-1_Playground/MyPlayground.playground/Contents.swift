import UIKit

/**
 var 変数名 : 型 {
    ステートメント
    return
 }
 */
式の値を返す変数: do {
    var num: Int {
        let RESULT = 2 * 5
        return RESULT
    }
    print(num)      // 10
}


/**
 var 変数名 : 型 {
    値
 }
 ステートメントの式の値が1個だけならば、「return 値」の式を省略できる。
 */
return値を省略する: do {
    var num2: Int {
        2 * 5
    }
    print(num2)
}


/**
 var 変数名 : 型 {
    get {
        ステートメント
        return 値
    }
 }
 リードオンリーの変数であれば、暗黙的にget{}が定義されている。
 要はgetterみたいのモノ。
 */
Computedプロパティ: do {
    var num3 : Int {
        // get{}を省略せずに定義した場合
        get {
            return 2 * 5
        }
    }
}


/**
 var 変数名 : 型 {
    get {
        ステートメント
        return 値
    }
    set(引数) {
        ステートメント
    }
 }
 getter/setterみたいなモノ。
 */
直径_円周の値を式で計算: do {
    // 半径 (radiusの値だけが保存されている)
    var radius = 10.0
    
    // 直径 (変数diameterは計算しているだけで、値を持っていない)
    var diameter: Double {
        // 半径から直径を計算して返す (return 省略)
        get {
            radius * 2
        }
        // 直径から半径を計算して変数radiusに保存する。
        set(length) {
            radius = length / 2
        }
    }
    
    // 円周の長さ (変数aroundは計算しているだけで、値を持っていない)
    var around: Double {
        // 半径から円周を計算して返す (return 省略)
        get {
            2 * radius * Double.pi
        }
        // 円周から半径を計算して変数radiusに保存する。
        set(length) {
            radius = length / (2 * Double.pi)
        }
    }
    
    /**
     変数radiusとdiameterは、内部でget / set の式で値の取得や設定が処理されている。
     それらを意識することなく、普通の変数と同じように使うことができる。
     初見だと分かりづらい気がするが、感覚的に慣れてくるモノなのか。。。
     */
    半径_直径_円周の値を調べる: do {
        print("半径が\(radius)のとき直径の長さは、\(diameter)")      // 半径が10.0のとき直径の長さは、20.0
        // 直径を30にする (setterに値を渡す)
        diameter = 30
        print("直径が\(diameter)の円の半径は、\(radius)")           // 直径が30.0の円の半径は、15.0
        // 円周を100にする (setterに値を渡す)
        around = 100
        print("円周の長さが\(around)の円の半径は、\(radius)")        // 円周の長さが100.0の円の半径は、15.915494309189533
    }
}
