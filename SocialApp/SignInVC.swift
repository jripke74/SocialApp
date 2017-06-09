//
//  ViewController.swift
//  SocialApp
//
//  Created by Jeff Ripke on 6/6/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JEFF: Unable to authenticate with Facebook - \(error!)")
            } else if result?.isCancelled == true {
                print("JEFF: User cancelled Facebook authentication")
            } else {
                print("JEFF: Successfully authenticate with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JEFF: Unable to authenticate with Firebase - \(error!)")
            } else {
                print("JEFF: Successfully authenticated with Firebase")
            }
        })
    }
    
    @IBAction func signinTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JEFF: Email user authenticated with firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JEFF: Unable to authenticate with Firebase using email")
                        } else {
                            print("JEFF: Successfully authenticated with firebase")
                        }
                    })
                }
            })
        }
    }
}
