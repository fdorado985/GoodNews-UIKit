//
//  GWService.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

class GWService {

  func getArticles(from url: URL, completion: @escaping ([Any]?) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        debugPrint("Error: \(error.localizedDescription)")
        completion(nil)
      } else if let data = data {
        print(data)
      }
    }.resume()
  }
}
