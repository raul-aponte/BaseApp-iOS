//
//  BaseViewController.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

// MARK: BaseView
extension BaseViewController: BaseView {
  func showProgress() {
    MBProgressHUD.showAdded(to: self.view, animated: true)
  }
  func hideProgress() {
    MBProgressHUD.hide(for: self.view, animated: true)
  }
  func showError(message: String) {
    Alerts.showAlert(context: self, message: message)
  }
}
