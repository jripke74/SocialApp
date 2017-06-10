//
//  FeedVC.swift
//  SocialApp
//
//  Created by Jeff Ripke on 6/10/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
//import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    @IBAction func signOutButton(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("JEFF: ID removed from \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
