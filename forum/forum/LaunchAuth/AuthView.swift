//
//  LoginView.swift
//  forum
//
//  Created by Luke Solomon on 11/13/20.
//

import UIKit


class AuthView: UIView {
  
  lazy var stackView:UIStackView = {
    var stack = UIStackView()
    
    stack.axis = .vertical
    stack.alignment = .leading
    stack.distribution = .fillProportionally
    stack.spacing = 4
    
    stack.addArrangedSubview(screenNameLabel)
    stack.addArrangedSubview(screenNameTextField)
    stack.addArrangedSubview(emailLabel)
    stack.addArrangedSubview(emailTextField)
    stack.translatesAutoresizingMaskIntoConstraints = false

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
    button.titleLabel?.text = "Enter your email address..."
    return button
  }()
  
  
  
  // MARK: - Initialization
  override init(frame: CGRect) {
      super.init(frame: frame)
      didLoad()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    didLoad()
  }

  convenience init() {
    self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
  }

  // MARK: - Setup
  func didLoad() {
    self.addSubview(stackView)
    self.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
    //I actually create & place constraints in here, instead of in
    //updateConstraints
  }
  
  func transitionToSignup() {
    
  }
  
  func transitionToLogin() {
    
  }
  
}
