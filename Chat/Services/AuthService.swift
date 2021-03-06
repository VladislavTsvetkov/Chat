//
//  AuthService.swift
//  Chat
//
//  Created by Владислав Цветков on 27/01/2019.
//  Copyright © 2019 Владислав Цветков. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let user = authDataResult?.user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider":user.providerID, "email":user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                loginComplete(false, error)
            }
            loginComplete(true, nil)
        }
    }
}
