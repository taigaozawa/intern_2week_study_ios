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
    @IBOutlet weak var articleListTableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    var sentKeyWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()

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
