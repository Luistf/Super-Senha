//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Luis Ferreira on 8/19/18.
//  Copyright © 2018 Luis Ferreira. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var textFieldPasswords: UITextView!
    
    //MARK: Properties
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var userLetters: Bool!
    var userNumbers: Bool!
    var userCapitalLatters: Bool!
    var userSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: userLetters, useNumbers: userNumbers, useCapitalLatters: userCapitalLatters, useSpeacilCharacters: userSpecialCharacters)
        
        generatePassword()
    }
    
    //MARK: Actions
    @IBAction func generate(_ sender: UIButton) {
        generatePassword()
    }
    
    //MARK: Methods
    func generatePassword() {
        textFieldPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        textFieldPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            textFieldPasswords.text.append(password + "\n\n")
        }
    }
    

}
