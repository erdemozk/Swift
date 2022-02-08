//
//  main.swift
//  ProtocolSwift
//
//  Created by Erdem Özkök on 6.02.2022.
//

import Foundation

protocol Running {
    
    func myRun()
    
}

class Animal {
    
    func running()  {
        print("running")
    }
    
    func test(){
        print("test")
    }
    
}

class Dog: Running{
    func myRun() {
        print("running")
    }
    
    
    
}
let kiki = Dog()
kiki.myRun()

class Cat : Animal, Running {
    func myRun() {
        print("running")
    }
    
    
    
}
let cat = Cat()
cat.test()

class Turtle : Animal {
    
    
}
let leonardo = Animal()


struct Bird : Running {
    func myRun() {
        print("running")
    }
    
    
}

let lokum = Bird()
lokum.myRun()
