//
//  ArticleListCell.swift
//  intern_2week_study
//
//  Created by Taiga Ozawa on 2020/08/16.
//  Copyright © 2020 caraquri. All rights reserved.
//

import Nuke
import UIKit

class ArticleListCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleLGTMLabel: UILabel!
    @IBOutlet weak var articleLGTMNumberLabel: UILabel!

    func setCell(articleTitle: String, articleImageURL: URL, lgtm: Int) {
        articleTitleLabel.text = articleTitle
        articleLGTMNumberLabel.text = String(lgtm)
        Nuke.loadImage(with: articleImageURL, into: cellImageView)
    }
}
