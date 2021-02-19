//
//  ViewController.swift
//  vkclient
//
//  Created by Svetlana Safonova on 12.02.2021.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func loginButton(_ sender: UIButton) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        if login == "admin" && password == "admin" {
            print("Successfully")
        }
        else {
            print("Please, try again")
        }
    }
}

