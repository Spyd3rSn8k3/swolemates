//
//  Utils.swift
//  Swolemates
//
//  Created by Cortlin P Dunlevy on 3/27/19.
//  Copyright © 2019 Cortlin P Dunlevy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayAlert(alertTitle: String, alertText: String) {
        let alert = UIAlertController(title: alertTitle, message: alertText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func pauseResumeApp(pauseApp: Bool) {
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        
        view.addSubview(activityIndicator)
        
        if pauseApp {
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        } else {
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        
    }
    
    //This function checks the value entered in the email address field and lets the application know if it is formatted properly or not
    func checkEmail(incomingEmail: String) -> Bool {
        var valid = false
        //Break the email entered by the user into it's components
        let emailStringArray = incomingEmail.components(separatedBy: "@")
        if emailStringArray.count > 1 {
            //If there are more than 1 resulting strings, we can continue checking
            if emailStringArray[0].count > 0 {
                //If there are 1 or more characters to the left of the @ sign, we can move onto checking the right side
                let rightSideArray = emailStringArray[1].components(separatedBy: ".")
                if rightSideArray.count > 1 {
                    //If there are more than 1 resulting strings, we can continue checking the right side
                    if rightSideArray[0].count > 0 && rightSideArray[1].count > 1 {
                        //If both sides of the period have the necessary amount of characters, we have a mostly valid email
                        valid = true
                    }
                    //If both sides of the period do not have the necessary amount of characters, the email is not valid
                }
                //There were no periods on the right side of the email, so it is invalid
            }
            //There was nothing to the left of the "@" sign in the email, so it is an invalid email address
        }
        //There were no @ symbols in the email, so it is invalid
        return valid
    }
    
    //This function checks the password entered by the user to determine if it is a secure password and returns a boolean to show whether the password is valid or not
    func isValidPassword(passString: String) -> Bool {
        var valid = false
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,15}$"
        valid = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: passString)
        return valid
    }
    
}
