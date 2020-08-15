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
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellImageAndLabel(labelText: String, imageURL: URL) {
        cellLabel.text = labelText
        Nuke.loadImage(with: imageURL, into: cellImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
