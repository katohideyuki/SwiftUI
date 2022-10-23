//
//  TabViewSample2.swift
//  Sec6-6_TabViewSample
//  
//  Created in 2022/10/23
//  
//

import SwiftUI

struct TabViewSample2: View {
    @State var selectedTag = 1

    var body: some View {
        TabView(selection: $selectedTag) {
            // 表示するビュー
            HomeTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }.tag(1)

            WeatherTabView()
                .tabItem {
                    Image(systemName: "cloud.sun")
                    Text("お天気")
                }.tag(2)

            NewsTabView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("ニュース")
                }.tag(3)
        }
    }
}

// HOME
struct HomeTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "music.note.house")
                .scaleEffect(x: 3.0, y: 3.0)
                .frame(width: 100, height: 100)
            Text("HOME").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.5, green:0.9, blue: 0.9))
        .ignoresSafeArea()
    }
}

// お天気ページ
struct WeatherTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun")
                .scaleEffect(x: 3.0, y: 3.0)
                .frame(width: 100, height: 100)
            Text("お天気ページ").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1.0, green: 0.9, blue: 1.0))
        .ignoresSafeArea()
    }
}

// ニュースと解説
struct NewsTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "newspaper")
                .scaleEffect(x: 3.0, y: 3.0)
                .frame(width: 100, height: 100)
            Text("ニュースと解説").font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.9, green: 0.9, blue: 0.8))
        .ignoresSafeArea()
    }
}

struct TabViewSample2_Previews: PreviewProvider {
    // 4つのビューのプレビューを個別に作る
    static var previews: some View {
        TabViewSample2()
        HomeTabView()
        WeatherTabView()
        NewsTabView()
    }
}
