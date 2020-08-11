import UIKit

final class Question1ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 起動時に textView を空にする
        textView.text = ""
        textField.delegate = self
    }
    
    // MARK: Action
    @IBAction func addText(_ sender: UIButton) {
        self.textFieldDidEndEditing(textField)
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
    // FirstResponder が解除された後に呼び出されるメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        // textField に入力されたテキストを textView に改行して表示
        if let newText = textField.text {
            if newText != "" {
                textView.text += newText + "\n" // 改行して追加
                textField.text = "" // 入力するごとに textField を空にする
            }
        }
    }
    
}
