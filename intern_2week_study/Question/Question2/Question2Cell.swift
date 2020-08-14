import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setCellImageAndLabel (labelText: String) {
        label.text = labelText
    }
}
