//
//  LoginService.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//
import Foundation

protocol LoginService {
    func login(user: String, password: String, callback: @escaping (AccessToken?) -> Void)
}

class LoginServiceImp: LoginService {
    func login(user: String, password: String, callback: @escaping (AccessToken?) -> Void) {
        // TODO: Implement real service 
        let token = AccessToken()
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            callback(token)
        }
    }
}
