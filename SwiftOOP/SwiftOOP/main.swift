//
//  main.swift
//  SwiftOOP
//
//  Created by Erdem Özkök on 20.01.2022.
//

import Foundation

let erdem = User(name: "Erdem", age: 23, job: "Software", type: .AdminUser)
let sevda = User(name: "Sevda", age: 23, job: "Nurse", type: UserType.DefaultUser)

erdem.job = "Nurse"

print(erdem.job)

let sefer = SpecialUser(name: "Sefer", age: 23, job: "Nurse", type: .DefaultUser)

print(sefer.name)

sefer.expFunc()

print(erdem.returnHairColor())
