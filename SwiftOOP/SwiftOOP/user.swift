//
//  user.swift
//  SwiftOOP
//
//  Created by Erdem Özkök on 20.01.2022.
//

import Foundation

enum UserType {
    case AdminUser
    case DefaultUser
    case UnAuthorizedUser
}

class User {
    
    var name: String
    var age: Int
    var job: String
    var type: UserType
    private var hairColor : String = "siyah"
    private var gender : String = ""
    
    // Initalizer
    init(name: String, age: Int, job: String, type: UserType) {
        self.name = name
        self.age = age
        self.job = job
        self.type = type
    }
    
    func expFunc() -> Void {
        print("example func run")
    }
    
    // Access Leves
    // open, public, internal, fileprivate, private
    
    private func testFunc(){
        print("test")
    }
    
    func returnHairColor() -> String {
        return self.hairColor
    }
}
