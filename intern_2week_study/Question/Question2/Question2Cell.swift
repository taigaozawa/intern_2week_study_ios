import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setArea (_ labelText: String, withImageURL url: URL) {
        label.text = labelText
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
