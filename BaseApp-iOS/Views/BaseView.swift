//
//  BaseView.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//

protocol BaseView {
  func showProgress()
  func hideProgress()
  func showError(message: String)
}
