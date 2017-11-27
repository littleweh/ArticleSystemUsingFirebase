//
//  ReadArticlesViewController.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/26.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import UIKit
import Firebase

class TestArrayViewController: UIViewController {
    
    let arrayToBeUploaded = ["one", "two", "three", "four", "five"]
    let user1 = User(
        firstName: "Candy",
        lastName: "Crush",
        email: "candycrush@gmail.com",
        nickName: "C.C."
    )
    let user2 = User(
        firstName: "Lucifer",
        lastName: "MorningStar",
        email: "devil@gmail.com",
        nickName: "FabulousMe"
    )
    
    let user3 = User(
        firstName: "Cloe",
        lastName: "Deckor",
        email: "cloeD@gmail.com",
        nickName: "detective"
    )
    
    let uploadArrayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("upload", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(uploadWithPriority), for: .touchUpInside)
        return button
    }()
    
    let readArrayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("read", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(readSimpleArray), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.navigationItem.title = "Array"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Logout", comment: ""), style: .plain, target: self, action: #selector(signOut))
        
        view.addSubview(readArrayButton)
        view.addSubview(uploadArrayButton)
        
        setupReadButton()
        setupUploadButton()
    }
    
    @objc func readSimpleArray() {
        let reference = Database.database().reference().child("TestArray")
        reference.observe(.value) { (snapshot) in
            print(snapshot.value)
            var testArray: [String] = []
            guard
                let array = snapshot.value as? [String?]
            else { return }
            for element in array {
                if let arrayElement = element {
                    testArray.append(arrayElement)
                }
            }
            print(testArray)
        }
    }
    
    @objc func uploadSimpleArray() {
        let reference = Database.database().reference(withPath: "UploadSimpleArray")
        reference.setValue(["TestArrayUpload": arrayToBeUploaded])
        print("upload complete")
    }
    
    @objc func uploadObjectArray() {
        let users = [user1, user2, user3, user2, user1]
        var userObjects: [Object] = []
        for user in users {
            let userObject = toObject(from: user)
            userObjects.append(userObject)
        }
        
        let reference = Database.database().reference(withPath: "UploadObjectArray")
        reference.setValue(userObjects)
        
        print("completed user object array upload")
        
    }
    
    @objc func uploadWithPushID() {
        let reference = Database.database().reference(withPath: "UploadObjectArrayWithPushID")

        let users = [user1, user2, user3, user2, user3]

        for user in users {
            let childReferenece = reference.childByAutoId()
            let userObject = toObject(from: user)
            childReferenece.setValue(userObject)
        }
    }
    
    @objc func uploadWithPriority() {
        let reference = Database.database().reference(withPath: "UploadObjectArrayWithPriority")
        
        let users = [user1, user2, user3, user2, user2, user3]
        
        for (index, value) in users.enumerated() {
            let childReferenece = reference.child("user \(index + 1)")
            let userObject = toObject(from: value)
            childReferenece.setValue(userObject, andPriority: index)
        }
        reference.observe(.value) { (snapshot) in
            print(snapshot.value)
        }
        
    }
    
    
    func setupReadButton() {
        NSLayoutConstraint.activate([
            readArrayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readArrayButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            readArrayButton.widthAnchor.constraint(equalToConstant: 150),
            readArrayButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupUploadButton() {
        NSLayoutConstraint.activate([
            uploadArrayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadArrayButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            uploadArrayButton.widthAnchor.constraint(equalToConstant: 150),
            uploadArrayButton.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    @objc func signOut() {
        
    }
    
    func toObject(from user: User) -> Object {
        let firstName = user.firstName
        let lastName = user.lastName
        let nickName = user.nickName
        let email = user.email
        let object = [
            "firstName": firstName,
            "lastName": lastName,
            "nickName": nickName,
            "email": email
        ]
        return object
    }

}
