//
//  ReadArticlesViewController.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/26.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import UIKit
import Firebase
typealias Object = [String: Any]

class TestArrayViewController: UIViewController {
    
    let numberStrings = ["one", "two", "three", "four", "five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadSimpleArray()
        readSimpleArray()
        
        uploadWithPushID()
        readPushIDArray()

        uploadWithPriority()
        readWithPriority()

        uploadWithTimeStampsAsKey()
        readWithTimeStampsAsKeys()
        
    }
    
    // 1. upload numberStrings
    func uploadSimpleArray() {
        let reference = Database.database().reference()
        reference.setValue(["NumberStrings": numberStrings])
        print("1. upload numberStrings completed")
    }

    // 2. read numberStrings
    func readSimpleArray() {
        let reference = Database.database().reference().child("NumberStrings")
        reference.observe(.value) { (snapshot) in
            print("-----snapshot.value-----")
            print(snapshot.value)
            var readNumberStrings: [String] = []
            guard
                let array = snapshot.value as? [String?]
            else { return }

            for element in array {
                if let arrayElement = element {
                    readNumberStrings.append(arrayElement)
                }
            }
            print(readNumberStrings)
        }
    }
    
    // 3. upload five to eight with pushID
    func uploadWithPushID() {
        let reference = Database.database().reference(withPath: "fiveToEightWithPushID")
        let fiveToEight = ["five","six","seven","eight"]
        
        for element in fiveToEight {
            let childReferenece = reference.childByAutoId()
            childReferenece.setValue(element)
            print(element)
        }
    }
    
    // 4. read five to eight with pushID
    func readPushIDArray() {
        let reference = Database.database().reference().child("fiveToEightWithPushID")
        reference.queryOrderedByKey().observe(.value) { (snapshot) in
            print("------read five to eight with pushID-------")
            print(snapshot.value)
            var numbers: [String] = []
            guard
                let objects = snapshot.value as? Object
            else { return }
            for (key, value) in objects {
                guard
                    let number = value as? String
                else { continue }
                numbers.append(number)
            }
            print(numbers)
            print(numbers.count)
        }
    }
    
    // 5. upload with priority
    func uploadWithPriority() {
        let nineToTwelve = ["nine", "ten", "eleven", "twelve"]
        let reference = Database.database().reference(withPath: "nineToTwelve")
        
        for (index, value) in nineToTwelve.enumerated() {
            let childReferenece = reference.child("array \(index + 1)")
            childReferenece.setValue(value, andPriority: index)
        }
    }
    
    // 6. read with priority
    func readWithPriority() {
        let reference = Database.database().reference(withPath: "nineToTwelve")
        var numbers: [String] = []
        reference.queryOrderedByPriority().observe(.value, with: {(snapshot) in
            print("------read nine to Twelve----------")
            print(snapshot.value)
            guard
                let objects = snapshot.value as? Object
                else { return}
            for (key, value) in objects {
                guard
                    let number = value as? String
                else { continue }
                numbers.append(number)
            }
            print(numbers)
            print(numbers.count)
        })
    }

    // 7. upload abcd
    func uploadWithTimeStampsAsKey() {
        let alphabetAToD = ["alpha", "beta", "charlie", "delta"]
        
        let reference = Database.database().reference(withPath: "alphabetA-D")
        
        for alphabet in alphabetAToD {
            let childReference = reference.childByAutoId()
            let object: Object = [
                "timestamp": ServerValue.timestamp(),
                "alphabet": alphabet
            ]
            childReference.setValue(object)
        }
    }
    
    // 8. read abcd
    func readWithTimeStampsAsKeys() {
        let reference = Database.database().reference(withPath: "alphabetA-D")
        var alphabets: [String] = []
        reference.observe(.value, with: {(snapshot) in
            print(snapshot.value)
            guard
                let rootObjects = snapshot.value as? Object,
                let objects = rootObjects.values as? Object
            else { return }
            print("--objects''")
            print(objects)
//            for (key, value) in objects {
//                guard
//                    let object = value as? Object,
//                    let alphabet = object["alphabet"] as? String
//                else { continue }
//                print(object)
//                alphabets.append(alphabet)
//            }
//            print(alphabets)
//            print(alphabets.count)
        })

    }
    
    
    

}
