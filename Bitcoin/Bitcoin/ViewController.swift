//
//  ViewController.swift
//  Bitcoin
//
//  Created by Zain Cheema on 9/15/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var Username = "Zain"
    var Password = "123"
    
    
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var InputPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserName.delegate = self
        InputPassword.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if UserName.text == Username && InputPassword.text == Password{
                performSegue(withIdentifier: "id", sender: Any?.self)
            }
            return true
        }
    }

