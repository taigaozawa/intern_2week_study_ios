//
//  ArticleListViewController.swift
//  intern_2week_study
//
//  Created by Taiga Ozawa on 2020/08/16.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    private let articleTitles: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    private let articleImages: [String] = [
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png",
        "https://uub.jp/47/ibaraki/ibaraki_kensho.png"
    ]
    
    var sentKeyWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView の設定
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: "articleListCell")
        tableView.rowHeight = 50
        
        // API をコールする
        guard let keyWord = sentKeyWord else {
            return
        }
        print("キーワード「" + keyWord + "」を受け取りました")
        callQiitaAPI(keyWord: keyWord)
    }
    
    private func callQiitaAPI(keyWord: String) {
        /*
        guard let url = URL(string: "https://qiita.com/api/v2/items") else { return }
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            
            guard let jsonData = data else { return }
            
            print(jsonData)

        })
        
        task.resume()
        */
        
        print(keyWord + " を検索します。")
    }

}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard articleTitles.count == articleImages.count else {
            return UITableViewCell()
        }
        
        let articleTitle = articleTitles[indexPath.row]
        let articleImage = articleImages[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleListCell", for: indexPath) as? ArticleListCell, let articleImageURL = URL(string: articleImage) else {
            return UITableViewCell()
        }
        
        cell.setCellImageAndLabel(labelText: articleTitle, imageURL: articleImageURL)
        
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
    }
}
