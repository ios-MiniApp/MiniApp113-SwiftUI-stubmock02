//
//  ArticleViewModel.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = [Article]()
    var apiError: APIError?
    private let articleListAPIClient: ArticleListAPIClientProtocol!

    // テスト用のイニシャライザ
    init(fetchArticlesAPIClient: ArticleListAPIClientProtocol) {
        articleListAPIClient = fetchArticlesAPIClient
        loadArticles()
    }

    init() {
        articleListAPIClient = ArticleListAPIClient()
        loadArticles()
    }

    func loadArticles() {
        articleListAPIClient.fetch(completion: { [weak self] resulte in
            switch resulte {
            case .success(let articleList):
                self?.articles = articleList
            case .failure(let error):
                self?.apiError = error
                print(error)
            }
        })
    }

}
