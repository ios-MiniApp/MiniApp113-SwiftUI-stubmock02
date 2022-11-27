//
//  ArticleViewModel.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var article: [Article] = [Article]()
    private let articleListAPIClient = ArticleListAPIClient()

    func loadArticles() {
        articleListAPIClient.fetch(completion: { [weak self] resulte in
            switch resulte {
            case .success(let articleList):
                self?.article = articleList
            case .failure(let error):
                print(error)
            }
        })
    }

}
