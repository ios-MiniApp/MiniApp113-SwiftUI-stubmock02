//
//  MiniApp113_SwiftUI_stubmock02Tests.swift
//  MiniApp113-SwiftUI-stubmock02Tests
//
//  Created by 前田航汰 on 2022/11/28.
//

import XCTest
@testable import MiniApp113_SwiftUI_stubmock02

final class MiniApp113_SwiftUI_stubmock02Tests: XCTestCase {

    private var mockArticlesAPIClient: MockArticlesAPIClient!
    private var articleViewModel: ArticleViewModel!

    override func setUp() async throws {
        mockArticlesAPIClient = MockArticlesAPIClient()
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
    }

    func test_記事が正常に取得できている() {
        XCTAssertNotNil(articleViewModel.articles)
        XCTAssertEqual(articleViewModel.articles[0].title, "記事0")
        XCTAssertEqual(articleViewModel.articles[17].title, "記事17")
    }

    func test_通信エラーだとnetworkErrorを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.networkError)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.networkError)
    }
/*
 外部APIなど通信を行って値を取得する場合、時間やタイミングによってレスポンスの値が変化することも多いと思います。そのような状態でXCTAssertEqualでテストを実装すれば、あるときは成功したり失敗したり、不安定なテストになるかと思います。
 */
    func test_値が空だとnoneValueを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.noneValue)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.noneValue)
    }

    func test_無効なURLだとinvalidURLを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.invalidURL)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.invalidURL)
    }

    func test_不明なエラーだとunknownを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.unknown)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.unknown)
    }

}
