import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    private let areaImages: [String] = [
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/tochigi/tochigi_kensho.png",
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
        tableView.register(UINib(nibName: "Question2Cell", bundle: nil), forCellReuseIdentifier: "question2Cell")
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "question2Cell", for: indexPath) as? Question2Cell, let areaImageURL = URL(string: areaImage) else {
            return UITableViewCell()
        }
        
        cell.setCellImageAndLabel(labelText: areaText, imageURL: areaImageURL)
        
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    
}
