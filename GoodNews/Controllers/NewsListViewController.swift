//
//  NewsListViewController.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {

  // MARK: - Properties

  private var articleListVM: ArticleListViewModel?

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
    getArticles()
  }

  // MARK: - Methods

  private func getArticles() {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e840bd82686d42fcabbfeab19da1d635")!
    GWService().getArticles(from: url) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let response):
        self.articleListVM = ArticleListViewModel(articles: response.articles)
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

// MARK: - TableView Delegate & DataSource

extension NewsListViewController {

  override func numberOfSections(in tableView: UITableView) -> Int {
    return articleListVM?.numberOfSection ?? 0
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articleListVM?.numberOfRowsInSection(section) ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
      fatalError("ArticleCell couldn't be found!")
    }

    let articleVM = articleListVM?.article(at: indexPath.row)
    cell.titleLabel.text = articleVM?.title
    cell.descriptionLabel.text = articleVM?.description
    return cell
  }
}

// MARK: - Setup View

extension NewsListViewController {

  private func configureController() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
