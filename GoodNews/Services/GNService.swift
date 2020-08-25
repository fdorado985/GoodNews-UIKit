//
//  GNService.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct EndPoint {

  static private let base = "https://newsapi.org"
  static let topHeadlines = "\(base)/v2/top-headlines"
}

class GNService {

  #error("Get and add your API Key from NewsApi")
  private let apiKey = "<YOUR_API_KEY>"
  private let country = "us"

  enum GNError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToParse = "The data received is unable to parse, please check the models match!"
  }

  func getArticles(_ completion: @escaping (Result<ArticlesResponse, GNError>) -> Void) {
    guard var urlComponents = URLComponents(string: EndPoint.topHeadlines) else { return }
    urlComponents.queryItems = [
      URLQueryItem(name: "country", value: country),
      URLQueryItem(name: "apiKey", value: apiKey)
    ]

    guard let url = urlComponents.url else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        completion(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let articlesResponse = try decoder.decode(ArticlesResponse.self, from: data)
        completion(.success(articlesResponse))
      } catch {
        completion(.failure(.unableToParse))
      }
    }.resume()
  }
}
