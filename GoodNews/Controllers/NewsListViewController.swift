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
  }
}

// MARK: - Setup View

extension NewsListViewController {

  private func configureController() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
