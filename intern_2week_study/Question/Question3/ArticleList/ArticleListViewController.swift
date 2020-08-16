//
//  ArticleListViewController.swift
//  intern_2week_study
//
//  Created by Taiga Ozawa on 2020/08/16.
//  Copyright © 2020 caraquri. All rights reserved.
//

import SafariServices
import UIKit

class ArticleListViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Article] = []
    
    var sentKeyWord: String? // SearchViewController から受け取る値

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let keyWord = sentKeyWord else { return }
        print("キーワード「" + keyWord + "」で検索します😁")
        tableView.rowHeight = 80
        displayArticles(keyWord: keyWord)
    }
    
    //
    func displayArticles(keyWord: String) {
        // Qiita の API を叩く
        APIClient.fetchArticles(keyword: keyWord) { [weak self] result in
            // メインスレッドでの実行, 完了後に同期的に処理
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    print("キーワード: ", keyWord, "\n記事数: ", articles.count, "\n検索が完了しました。🎉")
                    // tableView の設定
                    self?.tableView.delegate = self
                    self?.tableView.dataSource = self
                    self?.tableView.register(UINib(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: "articleListCell")
                    self?.tableView.rowHeight = 80
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let articleTitle = articles[indexPath.row].title
        let articleImage = articles[indexPath.row].user?.profileImageUrl
        let lgtm = articles[indexPath.row].likesCount
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleListCell", for: indexPath) as? ArticleListCell,
            let articleImageURL = URL(string: articleImage!) else {
            return UITableViewCell()
        }
        
        cell.setCell(articleTitle: articleTitle, articleImageURL: articleImageURL, lgtm: lgtm)
        
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("「", articles[indexPath.row].title, "」が選択されました")
        
        let articleUrlString = articles[indexPath.row].url
        guard let articleUrl = URL(string: articleUrlString) else {
            return
        }
        let safariViewController = SFSafariViewController(url: articleUrl)
        present(safariViewController, animated: true)
    }
}
