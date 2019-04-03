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
        
        //Make sure we can assign values from the optionals
        if let firstNameText = firstName.text,
            let lastNameText = lastName.text,
            let emailAddressText = emailAddress.text,
            let createPassText = createPass.text,
            let confirmPassText = confirmPass.text {
            
            //Make sure first name contains a value
            if firstNameText.count > 0 {
                if lastNameText.count > 0 {
                    if checkEmail(incomingEmail: emailAddressText) {
                        if createPassText == confirmPassText {
                            if isValidPassword(passString: createPassText) {
                                //Start the spinner while we run the sign up tasks
                                pauseResumeApp(pauseApp: true)
                                if newUser(emailText: emailAddressText, passText: createPassText) {
                                    self.displayAlert(alertTitle: "Success!", alertText: "You have successfully signed up!")
                                    self.pauseResumeApp(pauseApp: false)
                                    firstName.text = ""
                                    lastName.text = ""
                                    emailAddress.text = ""
                                    createPass.text = ""
                                    confirmPass.text = ""
                                    addPerson(firstName: firstNameText, lastName: lastNameText, emailText: emailAddressText)
                                    performSegue(withIdentifier: "signUpToLoginSegue", sender: self)
                                }
                            } else {
                                self.displayAlert(alertTitle: "Invalid Password", alertText: "Password must be 8-15 characters and contain a capital letter (A-Z), a lowercase letter (a-z), and a number or special character.")
                            }
                        }
                        else {
                            self.displayAlert(alertTitle: "Passwords Do Not Match", alertText: "Passwords provided do not match.")
                        }
                    } else {
                        self.displayAlert(alertTitle: "Valid Email Required", alertText: "Please provide a valid email address.")
                    }
                } else {
                    self.displayAlert(alertTitle: "Last Name Required", alertText: "Please provide your last name.")
                }
            }
            else {
                self.displayAlert(alertTitle: "First Name Required", alertText: "Please provide your first name.")
            }
            
        } else {
            self.displayAlert(alertTitle: "All Fields Required", alertText: "Please enter your first name, last name, email address, and password.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signUpToLoginSegue" {
            
            let viewController = segue.destination as! ViewController
            if let incomingEmail = emailAddress.text {
                viewController.incomingEmail = incomingEmail
            }
            else {
                viewController.incomingEmail = ""
            }
            if let incomingPass = createPass.text {
                viewController.incomingPass = incomingPass
            } else {
                viewController.incomingPass = ""
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
