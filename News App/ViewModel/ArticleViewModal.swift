//
//  ArticleViewModal.swift
//  News App
//
//  Created by Burak Donat on 24.03.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct ArticleListViewModal {
    let articles: [Article]
}

extension ArticleListViewModal {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModal {
        let article = self.articles[index]
        return ArticleViewModal(article: article)
    }
}

//ArticleViewModal is just responsible for displaying one particular news article (just one)
struct ArticleViewModal {
    let article: Article
    
    var title: String {
        return article.title
    }
    
    var description: String {
        return article.description
    }
}

//extension ArticleViewModal {
//    init(_ article: Article) {
//        self.article = article
//    }
//}
//
//extension ArticleViewModal {
//    var title: String {
//        return self.article.title
//    }
//
//    var description: String {
//        return self.article.description
//    }
//}

//THIS IS A TEST COMMENT
