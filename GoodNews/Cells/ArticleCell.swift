//
//  ArticleCell.swift
//  GoodNews
//
//  Created by Juan Francisco Dorado Torres on 24/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

  // MARK: - Outlets

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  // MARK: - Properties

  var article: ArticleViewModel? {
    didSet {
      guard let article = article else { return }
      titleLabel.text = article.title
      descriptionLabel.text = article.description
    }
  }
}
