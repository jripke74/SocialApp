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
import FirebaseAuth

class SignInVC: UIViewController {
    
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
}
