//
//  LoginView.swift
//  forum
//
//  Created by Luke Solomon on 11/13/20.
//

import UIKit

protocol AuthViewDelegate:class {
  func continueButtonTapped()
}

class AuthView: UIView {
  
  weak var delegate:AuthViewDelegate?
  
  lazy var stackView:UIStackView = {
    var stack = UIStackView()
    
    stack.axis = .vertical
    stack.alignment = .leading
    stack.distribution = .equalSpacing
    stack.spacing = 20
    
    stack.addArrangedSubview(screenNameField)
    stack.addArrangedSubview(emailField)
    stack.addArrangedSubview(tempCodeField)
    stack.addArrangedSubview(continueButton)
    
    stack.translatesAutoresizingMaskIntoConstraints = false

    return stack
  }()
  
  lazy var emailField:LabeledFormField = {
    let view = LabeledFormField()
    view.configure(viewModel: LabeledFormViewModel(title: "Email", placeHolderText: "Enter your email address..."), isEmailField: true)
    return view
  }()
  
  lazy var screenNameField:LabeledFormField = {
    let view = LabeledFormField()
    view.configure(viewModel: LabeledFormViewModel(title: "Screen Name", placeHolderText: "How do you want to be known?"), isEmailField: false)
    return view
  }()
  
  lazy var tempCodeField:LabeledFormField = {
    let view = LabeledFormField()
    view.configure(viewModel: LabeledFormViewModel(title: "Temporary Code", placeHolderText: "Enter your temporary code here..."), isEmailField: false)
    return view
  }()
  
  lazy var continueButton:UIButton = {
    let button = UIButton()
    button.layer.borderWidth = 1.0
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.cornerRadius = 4.0
    
    button.setTitle("Continue with email...", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    return button
  }()
  
  lazy var tempCodeSentLabel:UILabel = {
    let label = UILabel()
    label.text = "We just sent you a temporary login code. /n Please check your inbox "
    return label
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
    self.tempCodeField.isHidden = true
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      emailField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      screenNameField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      screenNameField.trailingAnchor.constraint(equalTo: self.trailingAnchor),

      tempCodeField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      tempCodeField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      continueButton.heightAnchor.constraint(equalToConstant: 45),
      continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
    ])
  }
  
  // MARK: - transitionhandling
  
  func transitionToSignup() {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) { [weak self] in
      self?.screenNameField.isHidden = false
    } completion: { [weak self] (bool) in
      UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn) { [weak self] in
        self?.screenNameField.alpha = 1.0
      }
    }
  }
  
  func transitionToLogin() {
    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn) { [weak self] in
      self?.screenNameField.alpha = 0.0
    } completion: { [weak self] (bool) in
      UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn) { [weak self] in
        self?.screenNameField.isHidden = true
      }
    }
  }
  
  func transitionTempCodeSent() {
    
  }
  
}
