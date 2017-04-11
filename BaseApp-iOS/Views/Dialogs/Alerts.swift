//
//  Alerts.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import UIKit

class Alerts {
    static func showAlert(context: UIViewController, message: String, title: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
}
