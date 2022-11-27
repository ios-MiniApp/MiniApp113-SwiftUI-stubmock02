//
//  ArticleViewModel.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = [Article]()
    private let articleListAPIClient = ArticleListAPIClient()

    init() {
        loadArticles()
    }

    func loadArticles() {
        articleListAPIClient.fetch(completion: { [weak self] resulte in
            switch resulte {
            case .success(let articleList):
                self?.articles = articleList
            case .failure(let error):
                print(error)
            }
        })
    }

}
