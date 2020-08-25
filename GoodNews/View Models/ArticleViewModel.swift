//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct ArticleListViewModel {

  let articles: [Article]
}

extension ArticleListViewModel {

  var numberOfSection: Int {
    return 1
  }

  func numberOfRowsInSection(_ section: Int) -> Int {
    return articles.count
  }

  func article(at index: Int) -> ArticleViewModel {
    let article = articles[index]
    return ArticleViewModel(article)
  }
}

struct ArticleViewModel {

  private let article: Article

  var title: String {
    return article.title
  }

  var description: String? {
    return article.description
  }
}

extension ArticleViewModel {

  init(_ article: Article) {
    self.article = article
  }
}
