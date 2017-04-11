//
//  LoginService.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//
import Foundation

protocol LoginService {
  func login(
    user: String,
    password: String,
    onSuccess: @escaping (AccessToken) -> Void,
    onError: @escaping (ApiError) -> Void
  )
}

class LoginServiceImp: LoginService {
  func login(user: String, password: String, onSuccess: @escaping (AccessToken) -> Void, onError: @escaping (ApiError) -> Void) {
    // TODO: Implement real service
    let token = AccessToken()
    let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime) {
      onSuccess(token)
    }
  }
}
