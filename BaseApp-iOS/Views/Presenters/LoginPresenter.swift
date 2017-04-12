//
//  LoginPresenter.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//

protocol LoginView: BaseView {
  func userError(message: String)
  func passwordError(message: String)
  func loginScuceeded()
}

class LoginPresenter {
  var view: LoginView?
  var service: LoginService?
  
  init(view: LoginView, service: LoginService) {
    self.view = view
    self.service = service
  }
  
  func login(user: String, password: String) {
    if user.isEmpty {
      view?.userError(message: "ERROR_EMPTY_USER".localized)
      return
    }
    if password.isEmpty {
      view?.passwordError(message: "ERROR_EMPTY_PASS".localized)
    }
    view?.showProgress()
    service?.login(user: user, password: password, onSuccess: { token in
      self.view?.hideProgress()
      self.view?.loginScuceeded()
    }, onError: { error in
      self.view?.hideProgress()
      self.view?.showError(message: error.localizedMessage ?? "")
    })
  }
}

extension LoginPresenter: BasePresenter {
  func onError(message: String) {
    view?.showError(message: message)
  }
}
