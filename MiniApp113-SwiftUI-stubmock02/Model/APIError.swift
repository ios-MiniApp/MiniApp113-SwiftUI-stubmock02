//
//  APIError.swift
//  MiniApp113-SwiftUI-stubmock02
//
//  Created by 前田航汰 on 2022/11/28.
//

enum APIError: Error {
    case noneValue
    case invalidURL
    case networkError
    case unknown

    var title: String {
        switch self {
        case .noneValue:
            return "値が空で取得されたエラー"
        case .invalidURL:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        default:
            return "不明なエラー"
        }
    }

}
