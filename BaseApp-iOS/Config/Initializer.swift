//
//  Initializer.swift
//  BaseApp-iOS
//
//  Copyright © 2017 BaseCompany. All rights reserved.
//
import Foundation

let ENVIROMENT = Enviroment(env: "Develop")

class Enviroment {
  var API_URL: String?
  
  init(env: String){
    if let path = Bundle.main.path(forResource: "Application", ofType: "plist"),
      let content = NSDictionary(contentsOfFile: path) {
      let variables = content[env] as? NSDictionary
      API_URL = variables?.value(forKey: "API_URL") as? String
    }
  }
}
