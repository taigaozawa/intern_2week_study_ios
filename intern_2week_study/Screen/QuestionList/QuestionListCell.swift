import UIKit

struct QuestionItem {
    var title: String
    var viewController: UIViewController
}

final class QuestionListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var viewController: UIViewController?
    
    func set(_ item: QuestionItem) {
        titleLabel.text = item.title
        self.viewController = item.viewController
    }
}
