//
//  LabeledFormField.swift
//  forum
//
//  Created by Luke Solomon on 11/19/20.
//

import UIKit


struct LabeledFormViewModel {
  var title:String
  var placeHolderText:String
}

protocol EmailFormFieldDelegate:class {
  func emailIsInvalid()
}

class LabeledFormField:UIView {
  
  weak var delegate:EmailFormFieldDelegate?
  
  lazy var stackView:UIStackView = {
    var stack = UIStackView()
    
    stack.axis = .vertical
    stack.alignment = .leading
    stack.distribution = .fill
    stack.spacing = 10
    
    stack.addArrangedSubview(label)
    stack.addArrangedSubview(textFieldBorderView)
    stack.addArrangedSubview(errorLabel)

    stack.translatesAutoresizingMaskIntoConstraints = false

    return stack
  }()
  
  lazy var label:UILabel = {
    var label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15)
    return label
  }()
  
  lazy var textFieldBorderView:UIView = {
    let view = UIView()
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.cornerRadius = 4.0
    
    view.addSubview(textField)
    textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8).isActive = true
    textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    return view
  }()
  
  lazy var textField:UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.systemFont(ofSize: 12, weight: .light)
    return textField
  }()
  
  lazy var errorLabel:UILabel = {
    var label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
    label.textColor = UIColor.red
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

    self.errorLabel.isHidden = true
    self.errorLabel.alpha = 0.0
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      label.heightAnchor.constraint(equalToConstant: 30),
      
      textFieldBorderView.heightAnchor.constraint(equalToConstant: 45),
      textFieldBorderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      textFieldBorderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
      
      errorLabel.heightAnchor.constraint(equalToConstant: 20),

    ])
  }
  
  func configure(viewModel:LabeledFormViewModel, isEmailField:Bool) {
    self.label.text = viewModel.title
    self.textField.placeholder = viewModel.placeHolderText
    if isEmailField {
      textField.addTarget(
        self,
        action: #selector(textFieldDidChange),
        for: .editingChanged
      )
    }
  }
  
  @objc func textFieldDidChange() {
    guard let text  = self.textField.text else {
      errorFixed()
      return
    }
    print(text.count)
    if !isValidEmail(text) {
      self.delegate?.emailIsInvalid()
      displayError(text: text)
    } else if text.count == 0 {
      errorFixed()
    } else {
      errorFixed()
    }
  }
  
  func isValidEmail(_ email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }

  func displayError(text:String) {
    self.textFieldBorderView.layer.borderColor = UIColor.systemRed.cgColor
    self.label.textColor = UIColor.systemRed
    self.errorLabel.text = "\(text) is not a valid email address."

    UIView.animate(withDuration: 0.3) {
      self.errorLabel.isHidden = false
      self.errorLabel.alpha = 1.0
    }
  }
  
  func errorFixed() {
    self.textFieldBorderView.layer.borderColor = UIColor.lightGray.cgColor
    self.label.textColor = UIColor.black
    
    UIView.animate(withDuration: 0.3) {
      self.errorLabel.isHidden = true
      self.errorLabel.alpha = 0.0
    }

  }
}

