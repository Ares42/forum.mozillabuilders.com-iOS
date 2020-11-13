//
//  LoginView.swift
//  forum
//
//  Created by Luke Solomon on 11/13/20.
//

import UIKit


class LoginView: UIView {
  
  lazy var stackView:UIStackView = {
    var stack = UIStackView()
    
    stack.addArrangedSubview(screenNameLabel)
    stack.addArrangedSubview(screenNameTextField)
    stack.addArrangedSubview(emailLabel)
    stack.addArrangedSubview(emailTextField)

    return stack
  }()
  
  lazy var screenNameLabel:UILabel = {
    var label = UILabel()
    label.text = "Screen Name"
    return label
  }()
  
  lazy var screenNameTextField:UITextField = {
    let textField = UITextField()
    textField.placeholder = "How do you want to be known?"
    return textField
  }()
  
  lazy var emailLabel:UILabel = {
    var label = UILabel()
    label.text = "Email"
    return label
  }()

  lazy var emailTextField:UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter your email address..."
    return textField
  }()
  
  lazy var continueButton:UIButton = {
    let button = UIButton()
//    button.setTitleText = "Enter your email address..."
    return button
  }()
  
}
