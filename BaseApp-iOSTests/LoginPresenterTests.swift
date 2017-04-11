//
//  LoginPresenterTests.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import XCTest
@testable import BaseApp_iOS

class LoginPresenterTests: XCTestCase {
  private static let validUser = "valid@user.com"
  private static let validPass = "validPassword"
  
  var presenter: LoginPresenter?
  var view = LoginViewMock()
  var service = LoginServiceMock(validUser: validUser, validPassword: validPass)
  
  override func setUp() {
    super.setUp()
    
    presenter = LoginPresenter(view: view, service: service)
  }
  
  func testLoginSuccess() {
    presenter?.login(user: LoginPresenterTests.validUser, password: LoginPresenterTests.validPass)
    
    XCTAssertTrue(service.loginSuccess, "Login Failed")
  }
}

class LoginViewMock: LoginView {
  func userError(message: String) {
  }
  func passwordError(message: String) {
  }
  func loginScuceeded() {
  }
  
  func showProgress() {
  }
  func hideProgress() {
  }
  func showError(message: String) {
  }
}
class LoginServiceMock: LoginService {
  private var user: String
  private var pass: String
  var loginSuccess = false
  
  init(validUser user: String, validPassword pass: String) {
    self.user = user
    self.pass = pass
  }
  
  func login(user: String, password: String, onSuccess: @escaping (AccessToken) -> Void, onError: @escaping (ApiError) -> Void) {
    if user.isEmpty {
      
    }
    loginSuccess = true
    onSuccess(AccessToken())
  }
}
