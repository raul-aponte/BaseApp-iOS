//
//  LoginController.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {
  // MARK: Properties
  weak var presenter: LoginPresenter?
  
  // MARK: Controls
  @IBOutlet weak var textFieldUser: UITextField!
  @IBOutlet weak var textFieldPassword: UITextField!
  
  // MARK: UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter = LoginPresenter(view: self, service: LoginServiceImp())
  }
  
  // MARK: Actions
  @IBAction func buttonLoginTap(_ sender: UIButton) {
    if let user = textFieldUser.text, let pass = textFieldPassword.text {
      presenter?.login(user: user, password: pass)
    }
  }
  
  // MARK: Functions
  func goToDashboard() {
    
  }
}
// MARK: LoginView
extension LoginController: LoginView {
  func userError(message: String) {
    Alerts.showAlert(context: self, message: message)
  }
  func passwordError(message: String) {
    Alerts.showAlert(context: self, message: message)
  }
  func loginScuceeded() {
    
  }
}
