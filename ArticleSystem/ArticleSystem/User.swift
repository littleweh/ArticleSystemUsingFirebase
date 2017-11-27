//
//  User.swift
//  ArticleSystem
//
//  Created by 典萱 高 on 2017/11/27.
//  Copyright © 2017年 LostRfounds. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let nickName: String
    
    init(firstName: String,
         lastName: String,
         email: String,
         nickName: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.nickName = nickName
    }
    
    init(snapshot: DataSnapshot) {
        
        // ToDo: to be completed
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.nickName = ""
    }
        
}
