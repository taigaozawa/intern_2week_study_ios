import UIKit

final class Question1ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textFieldWarningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 起動時に textView を空にする
        textView.text = ""
        textFieldWarningLabel.isHidden = true
        textField.delegate = self
    }
    
    // MARK: Action
    @IBAction func addTextButtonTapped(_ sender: UIButton) {
        if let newText = textField.text {
            if newText != "" {
                textView.text += newText + "\n" // 改行して追加
                textField.text = "" // 入力するごとに textField を空にする
                textFieldWarningLabel.isHidden = true
            } else {
                textFieldWarningLabel.isHidden = false
            }
        }
    }
    @IBAction func clearText(_ sender: UIButton) {
        textView.text = ""
    }
    
}

// MARK: UITextFieldDelegate
extension Question1ViewController: UITextFieldDelegate {
    // textField で Return されたときに呼び出されるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを隠す
        textField.resignFirstResponder() // FirstResponder を解除
        return true
    }
    
}
