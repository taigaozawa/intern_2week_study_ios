import UIKit

final class QuestionListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var question1: QuestionItem = {
        let questionViewController = R.storyboard.question1.instantiateInitialViewController()!
        return QuestionItem(title: "課題1: Textfield, Button, TextView等の基礎", viewController: questionViewController)
    }()
    
    private lazy var question2: QuestionItem = {
        let questionViewController = R.storyboard.question2.instantiateInitialViewController()!
        return QuestionItem(title: "課題2: TableViewとCellの実装", viewController: questionViewController)
    }()
    
    private lazy var search: QuestionItem = {
        let questionViewController = R.storyboard.search.instantiateInitialViewController()!
        return QuestionItem(title: "課題3: [API]Qiitaの記事検索を実装", viewController: questionViewController)
    }()
    
    private lazy var sampleSearch: QuestionItem = {
        let questionViewController = R.storyboard.sampleSearch.instantiateInitialViewController()!
        return QuestionItem(title: "課題3のサンプル: 課題3の参考にして下さい", viewController: questionViewController)
    }()
    
    private lazy var questionItems: [QuestionItem] = {
        return [question1, question2, search, sampleSearch]
    }()
    
    override func viewDidLoad() {
        tableView.register(R.nib.questionListCell)
    }
}

extension QuestionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionListCell, for: indexPath),
            let item = questionItems[safe: indexPath.row] else { return UITableViewCell() }

        cell.set(item)
        return cell
    }
}

extension QuestionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = questionItems[safe: indexPath.row]?.viewController else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
