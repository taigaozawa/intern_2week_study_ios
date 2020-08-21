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

    func set(_ articleTitle: String, withArticleImage: URL, withLgtm: Int) {
        articleTitleLabel.text = articleTitle
        articleLGTMNumberLabel.text = String(withLgtm)
        Nuke.loadImage(with: withArticleImage, into: cellImageView)
    }
}
