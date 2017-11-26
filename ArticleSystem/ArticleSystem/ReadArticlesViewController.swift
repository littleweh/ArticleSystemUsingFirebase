//
//  ReadArticlesViewController.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/26.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import UIKit

class ReadArticlesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = NSLocalizedString("Articles", comment: "ReadArticles Navigation bar Title")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Logout", comment: ""), style: .plain, target: self, action: #selector(signOut))

        
    }
    
    @objc func signOut() {
        
    }


}
