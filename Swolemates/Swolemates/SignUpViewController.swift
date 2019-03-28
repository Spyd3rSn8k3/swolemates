//
//  SignUpViewController.swift
//  
//
//  Created by Cortlin P Dunlevy on 3/25/19.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var incomingEmail = String()
    var incomingPass = String()
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var createPass: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signUpToLoginSegue" {
            
            let viewController = segue.destination as! ViewController
            viewController.incomingEmail = ""
            viewController.incomingPass = ""
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
