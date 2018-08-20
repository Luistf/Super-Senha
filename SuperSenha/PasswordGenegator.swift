//
//  PasswordGenegator.swift
//  SuperSenha
//
//  Created by Luis Ferreira on 8/19/18.
//  Copyright © 2018 Luis Ferreira. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLatters: Bool
    var useNumbers: Bool
    var useCapitalLatters: Bool
    var useSpacialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLatters: Bool, useSpeacilCharacters: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacters = numchars
        self.useLatters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLatters = useCapitalLatters
        self.useSpacialCharacters = useSpeacilCharacters
        
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLatters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpacialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLatters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
    
}
