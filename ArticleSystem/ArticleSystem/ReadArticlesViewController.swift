//
//  ReadArticlesViewController.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/26.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import UIKit
import Firebase

class ReadArticlesViewController: UIViewController {
    
    let arrayToBeUploaded = ["one", "two", "three", "four", "five"]
    
    let testArrayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("test", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(readArray), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = NSLocalizedString("Articles", comment: "ReadArticles Navigation bar Title")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Logout", comment: ""), style: .plain, target: self, action: #selector(signOut))
        
        view.addSubview(testArrayButton)
        setupTestButton()
    }
    
    @objc func readArray() {
        let reference = Database.database().reference().child("TestArray")
        reference.observe(.value) { (snapshot) in
            print(snapshot.value)
            if let testArray = snapshot.value as? [String?] {
                let array = (testArray as? [String])?.filter{$0 is String}
                print(array?.count)
            }
            
        }
    }
    
    @objc func uploadArray() {
        let reference = Database.database().reference(withPath: "arrayTest")
        for (index, value) in arrayToBeUploaded.enumerated() {
            let object: Any = [index: value]
            reference.setValue(object)
        }
    }
    
    func setupTestButton() {
        NSLayoutConstraint.activate([
            testArrayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testArrayButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testArrayButton.widthAnchor.constraint(equalToConstant: 150),
            testArrayButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func signOut() {
        
    }
    
//    func arrayToObject(from array: [Any]) -> [Int: Any] {
//        var transformedObject = [Int: Any]()
//        for (index, value) in array.enumerated() {
//            transformedObject.updateValue(value, forKey: index)
//        }
//        return transformedObject
//    }


}
