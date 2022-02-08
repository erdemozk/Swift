//
//  UserClass.swift
//  AdvancedSwiftSkills
//
//  Created by Erdem Özkök on 6.02.2022.
//

import Foundation

class UserClass {
    
    var name: String
    var surname: String
    var age: Int
    var job: String
    
    init(name: String, surname: String, age: Int, job: String) {
        self.age = age
        self.job = job
        self.name = name
        self.surname = surname
    }
    
    func ageIncrease() {
        self.age += 1
    }
    
}
