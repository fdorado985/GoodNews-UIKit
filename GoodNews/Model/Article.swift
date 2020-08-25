//
//  Article.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct ArticlesResponse: Decodable {

  let status: String
  let totalResults: Int
  let articles: [Article]
}

struct Article: Decodable {

  let source: Source
  let author: String?
  let title: String
  let description: String?
  let url: String
  let urlToImage: String?
  let publishedAt: Date
  let content: String?
}

struct Source: Decodable {

  let id: String?
  let name: String
}
