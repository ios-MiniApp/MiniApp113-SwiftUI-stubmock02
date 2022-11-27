//
//  ContentView.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

import SwiftUI

struct Article: Codable {
    let title: String
}

struct ArticleView: View {
    @ObservedObject var viewModel = ArticleViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(0..<viewModel.articles.count, id: \.self) { index in
                    Text(viewModel.articles[index].title)
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
