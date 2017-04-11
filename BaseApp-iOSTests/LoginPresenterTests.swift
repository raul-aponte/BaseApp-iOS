//
//  LoginPresenterTests.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import XCTest
@testable import BaseApp_iOS

class LoginPresenterTests: XCTestCase {
    var presenter: LoginPresenter?
    var view = LoginViewMock()
    var service = LoginServiceMock()
    
    override func setUp() {
        super.setUp()
        
        presenter = LoginPresenter(view: view, service: service)
    }
    
    func testLoginSuccess() {
        presenter?.login(user: "valid@user.com", password: "validPassword")
        
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
    var loginSuccess = false
    func login(user: String, password: String, callback: @escaping (AccessToken?) -> Void) {
        loginSuccess = true
        callback(AccessToken())
    }
}
