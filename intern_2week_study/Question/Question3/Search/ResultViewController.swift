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
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
