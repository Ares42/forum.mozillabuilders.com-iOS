//
//  AuthController.swift
//  forum
//
//  Created by Luke Solomon on 11/19/20.
//

import Foundation

enum AuthError {
  case start
  case emailEmpty
  case emailInvalid
  case screenNameTaken
  case noAccountForEmail
  case tempCodeFailed
}

enum AuthSuccess {
  case start
  case emailEmpty
  case emailInvalid
  case noAccountForEmail
  case tempCodeFailed
}

protocol AuthControllerDelegate {
  func handleAuthError(_ error:AuthError)
  func handleAuthSuccess(_ success:AuthSuccess)
}

class AuthController {
  
  
  
  
  
}
