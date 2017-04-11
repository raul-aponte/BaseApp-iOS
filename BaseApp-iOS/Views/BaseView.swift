//
//  BaseView.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//

protocol BaseView {
    func showProgress()
    func hideProgress()
    func showError(message: String)
}
