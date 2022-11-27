//
//  ArticleListAPIClientProtocol.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

import Foundation

protocol ArticleListAPIClientProtocol {

    func fetch(completion: @escaping ((Result<[Article], APIError>) -> Void))

}
