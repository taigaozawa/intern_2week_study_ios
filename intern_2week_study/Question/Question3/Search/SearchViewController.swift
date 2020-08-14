import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textFieldWarningLabel: UILabel!
    
    // 複数回検索防止のためのチェック
    var isFirstSearch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldWarningLabel.isHidden = true
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isFirstSearch = true // 読み込みの度に検索可能にする
    }
    
    // MARK: Action
    @IBAction func searchButtonTapped(_ sender: Any) {
        _ = self.textFieldShouldReturn(textField)
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    
    // textField で Return されたときに呼び出されるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 検索が 2 度以上行われていないかチェック
        guard isFirstSearch else {
            return true
        }
        
        // キーボードを隠す
        textField.resignFirstResponder() // FirstResponder を解除
        guard let keyWord = textField.text else {
            return true
        }
        if keyWord.isEmpty {
            textFieldWarningLabel.isHidden = false
        } else {
            textFieldWarningLabel.isHidden = true
            search(keyWord)
            isFirstSearch = false // 有効な検索が行われたことを記録
        }
        return true
    }
    
    // キーワード検索を実行するメソッド
    func search(_ keyWord: String) {
        print("キーワードは「" + keyWord + "」です。")
    }
    
}
