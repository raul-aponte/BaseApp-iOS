//
//  LoginPresenter.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
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
        
        view?.showProgress()
        service?.login(user: user, password: password) { user in
            self.view?.hideProgress()
            self.view?.loginScuceeded()
        }
    }
    
}
extension LoginPresenter: BasePresenter {
    func onError(message: String) {
        view?.showError(message: message)
    }
}
