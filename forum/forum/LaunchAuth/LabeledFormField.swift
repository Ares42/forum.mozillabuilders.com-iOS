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


class LabeledFormField:UIView {
  
  lazy var stackView:UIStackView = {
    var stack = UIStackView()
    
    stack.axis = .vertical
    stack.alignment = .leading
    stack.distribution = .fill
    stack.spacing = 10
    
    stack.addArrangedSubview(label)
    stack.addArrangedSubview(textFieldBorderView)

    stack.translatesAutoresizingMaskIntoConstraints = false

    return stack
  }()
  
  lazy var label:UILabel = {
    var label = UILabel()
    return label
  }()
  
  lazy var textFieldBorderView:UIView = {
    let view = UIView()
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.cornerRadius = 2.0
    
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
    return textField
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
      
      label.heightAnchor.constraint(equalToConstant: 30),
      
      textFieldBorderView.heightAnchor.constraint(equalToConstant: 45),
      textFieldBorderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      textFieldBorderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
    ])
  }
  
  func configure(viewModel:LabeledFormViewModel) {
    self.label.text = viewModel.title
    self.textField.placeholder = viewModel.placeHolderText
  }
  
}
