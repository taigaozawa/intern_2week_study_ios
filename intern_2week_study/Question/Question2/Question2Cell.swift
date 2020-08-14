import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    // MARK: Methods
    public func setCellImageAndLabel (labelText: String, imageURL: URL) {
        label.text = labelText
        Nuke.loadImage(with: imageURL, into: areaImageView)
    }
}
