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
    XCTAssertTrue(view.loginSuccess, "Login Failed")
  }
  func testLoginFail() {
    presenter?.login(user: "invalid@user.com", password: "invalidPass")
    XCTAssertFalse(view.loginSuccess, "Login Success (must fail)")
  }
}

class LoginViewMock: LoginView {
  var userErrorMessage: String?
  var passErrorMessage: String?
  var loginSuccess = false
  var errorMessage: String?
  
  func userError(message: String) {
    userErrorMessage = message
  }
  func passwordError(message: String) {
    passErrorMessage = message
  }
  func loginScuceeded() {
    loginSuccess = true
  }
  // MARK: BaseView
  func showProgress() {
  }
  func hideProgress() {
  }
  func showError(message: String) {
    errorMessage = message
  }
}
class LoginServiceMock: LoginService {
  private var user: String
  private var pass: String
  
  init(validUser user: String, validPassword pass: String) {
    self.user = user
    self.pass = pass
  }
  
  func login(user: String, password: String, onSuccess: @escaping (AccessToken) -> Void, onError: @escaping (ApiError) -> Void) {
    if self.user != user {
      onError(ApiError())
      return
    }
    if self.pass != password {
      onError(ApiError())
      return
    }
    onSuccess(AccessToken())
  }
}
