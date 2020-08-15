//
//  ResultViewController.swift
//  intern_2week_study
//
//  Created by Taiga Ozawa on 2020/08/15.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var sentKeyWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let keyWord = sentKeyWord else {
            return
        }
        print("キーワード「" + keyWord + "」を受け取りました。")
        
        let numberOfArticles = 50
        callQiitaAPI(numberOfArticles: numberOfArticles)
        
    }
    
    private func callQiitaAPI(numberOfArticles: Int = 10) {
        let url = "https://qiita.com/api/v2/items"
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        // urlComponents.string = "${url}?per_page=${numberOfArticles}" に設定
        urlComponents.queryItems = [ URLQueryItem(name: "per_page", value: String(numberOfArticles)) ]
        
        print(urlComponents.string!)
    }
    
}
