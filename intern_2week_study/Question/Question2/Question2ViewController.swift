import UIKit

final class Question2ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    private let areaImages: [String] = [
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://kunitori-jp.net/wp-content/uploads/2019/03/symbol_tochigi.jpg",
        "https://uub.jp/47/gunma/gunma_monsho.png",
        "https://uub.jp/47/saitama/saitama_kensho.png",
        "https://uub.jp/47/chiba/chiba_kensho.png",
        "https://uub.jp/47/tokyo/tokyo_symbol.png",
        "https://uub.jp/47/kanagawa/kanagawa_kensho.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.question2Cell)
        tableView.rowHeight = 50
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard areaTexts.count == areaImages.count else {
            print("areaTexts と areaImages の要素数が異なります。")
            return UITableViewCell()
        }
        
        let areaText = areaTexts[indexPath.row]
        let areaImage = areaImages[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "question2Cell", for: indexPath) as? Question2Cell,
            let areaImageURL = URL(string: areaImage) else {
            return UITableViewCell()
        }
        
        cell.setArea(areaText, withImageURL: areaImageURL)
        
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell がタップされたらアラートを表示
        // アラートを定義
        let message = self.areaTexts[indexPath.row] + "が選択されました"
        let alert = UIAlertController(title: self.areaTexts[indexPath.row], message: message, preferredStyle: .alert)
        // アラートのデフォルトアクションを定義
        let defaultAction = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: { _ in
                print("ユーザーは" + self.areaTexts[indexPath.row] + "を選択し OK を押しました。")
            })
        // アラートにアクションを追加
        alert.addAction(defaultAction)
        // アラートを表示
        present(alert, animated: true)
    }
}
