//
//  ViewController.swift
//  Swolemates
//
//  Created by Cortlin P Dunlevy on 3/22/19.
//  Copyright © 2019 Cortlin P Dunlevy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var incomingEmail = String()
    var incomingPass = String()
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainToSignUpSeque" {
            
            let signUpViewController = segue.destination as! SignUpViewController
            signUpViewController.incomingEmail = ""
            signUpViewController.incomingPass = ""
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

