//
//  NewsListViewController.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
    getArticles()
  }

  // MARK: - Methods

  private func getArticles() {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e840bd82686d42fcabbfeab19da1d635")!
    GWService().getArticles(from: url) { result in
      print(result)
    }
  }
}

// MARK: - Setup View

extension NewsListViewController {

  private func configureController() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
