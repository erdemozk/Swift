//
//  specialuser.swift
//  SwiftOOP
//
//  Created by Erdem Özkök on 20.01.2022.
//

import Foundation

class SpecialUser : User {
    
    func newFunc() -> Void {
        print("New Func Run")
    }
    
    override func expFunc() {
        super.expFunc()
        print("Private Func")
    }
    
}
