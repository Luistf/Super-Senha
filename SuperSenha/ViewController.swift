//
//  ViewController.swift
//  SuperSenha
//
//  Created by Luis Ferreira on 8/19/18.
//  Copyright © 2018 Luis Ferreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var textFieldTotalPasswords: UITextField!
    @IBOutlet weak var textFieldTotalNumberOfCharacters: UITextField!
    @IBOutlet weak var switchLatters: UISwitch!
    @IBOutlet weak var switchNumbers: UISwitch!
    @IBOutlet weak var switchCapitalLatters: UISwitch!
    @IBOutlet weak var switchSpecialCharacters: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordViewController
        if let numberOfPassword = Int(textFieldTotalPasswords.text!) {
            passwordViewController.numberOfPasswords = numberOfPassword
        }
        if let numberOfCharacters = Int(textFieldTotalNumberOfCharacters.text!) {
            passwordViewController.numberOfCharacters = numberOfCharacters
        }
        passwordViewController.userLetters = switchLatters.isOn
        passwordViewController.userNumbers = switchNumbers.isOn
        passwordViewController.userSpecialCharacters = switchSpecialCharacters.isOn
        passwordViewController.userCapitalLatters = switchCapitalLatters.isOn
        view.endEditing(true)
    }


}

