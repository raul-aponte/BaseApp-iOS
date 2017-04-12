//
//  String+Extensions.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 12/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import Foundation
extension String {
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
}
