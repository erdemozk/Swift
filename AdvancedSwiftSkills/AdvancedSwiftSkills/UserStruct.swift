//
//  UserStruct.swift
//  AdvancedSwiftSkills
//
//  Created by Erdem Özkök on 6.02.2022.
//

import Foundation

struct UserStruct {
    
    var name: String
    var surname: String
    var age: Int
    var job: String
    
    
    mutating func ageIncrease() {
        self.age += 1
    }
}
