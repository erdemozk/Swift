//
//  main.swift
//  AdvancedSwiftSkills
//
//  Created by Erdem Özkök on 6.02.2022.
//

import Foundation

/*
Struct ->
    inheritance yok
    Stack - filo (RAM)
    daha hızlı ve daha basit
    value type
    immutable

Class ->
    inheritance var
    Heap - fifo (RAM)
    reference type
    mutable
    objective-c
*/

let erdemClass = UserClass(name: "Erdem", surname: "Özkök", age: 23, job: "Developer")
//print(erdemClass.name)

var erdemStruct = UserStruct(name: "Erdem", surname: "Özkök", age: 23, job: "Developer")
//print(erdemStruct.name)

erdemClass.age = 33
//print(erdemClass.age)

erdemStruct.age = 33
//print(erdemStruct.age)

// Reference and Value Differance

let erdemCopyClass = erdemClass
var erdemCopyStruct = erdemStruct

//print(erdemCopyClass.age)
//print(erdemCopyStruct.age)

erdemCopyStruct.age = 34
erdemCopyClass.age = 34

//print(erdemCopyClass.age)
//print(erdemCopyStruct.age)
//
//print(erdemClass.age)
//print(erdemStruct.age)

// Reference Type -> Class | kopyalama yapıldığında tek bir obje, 2 referans var
// Value Type -> Struct    | kopyalama yapıldığında 2 obje


//print(erdemClass.age)

erdemClass.ageIncrease()

//print(erdemClass.age)

print(erdemStruct.age)

erdemStruct.ageIncrease()

print(erdemStruct.age)

// Tuple

var myTuple = (10,20)
print(myTuple.0)

var myTuple2 = (10,20,30,40)
print(myTuple2.3)
myTuple2.3 = 50
print(myTuple2.3)

let myTuple3 = ("Erdem", 33)
print(myTuple3.1)

let myTuple4 = ("Erdem",[1,2,3,4])
print(myTuple4.1[2])

let myNumber : Int?

let myTuple5 : (String, String)

myTuple5.0 = "Erdem"
myTuple5.1 = "Özkök"

print(myTuple5)

let newTuple = (name: "Erdem", surname: "Özkök")

print(newTuple.name)


// Guard Let

let number = "erdem"

func toIntIf(string: String) -> Int {
    if let myInt = Int(string){
        return myInt
    } else {
        return 0
    }
}

print(toIntIf(string: number))

func toIntGuardLet(string: String) -> Int {
    guard let myInt = Int(string) else{
        return 0
    }
    
    return myInt
}

print(toIntGuardLet(string: number))

// Switch - Case

let dayCount = 5
var dayString = ""
/*
if dayCount == 1 {
    dayString = "Monday"
} else if dayCount == 2{
    dayString = "Tuesday"
}

print(dayString)
*/

switch dayCount {
case 1:
    dayString = "Monday"
case 2:
    dayString = "Tuesday"
case 3:
    dayString = "Wednesday"
default:
    dayString = "Sunday"
}

print(dayString)

// Breakpoint

var myNumber2 = 5

print(myNumber2)

myNumber2 += 1

print(myNumber2)
