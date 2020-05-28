//
//  Article.swift
//  News App
//
//  Created by Burak Donat on 24.03.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct ArticleData: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let title: String
    let description: String
}
