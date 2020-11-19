//
//  FormButton.swift
//  forum
//
//  Created by Luke Solomon on 11/19/20.
//

import UIKit


struct FormButtonViewModel {
  var buttonTitle:String
}


class FormButton:UIView {
  
  lazy var button:UIButton = {
    let button = UIButton()
    return button
  }()
  
  lazy var activityIndicator:UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    return indicator
  }()
  
  func deactivate() {
    self.button.isEnabled = false
    self.activityIndicator.startAnimating()
  }
  
  func activate() {
    self.button.isEnabled = true
    self.activityIndicator.stopAnimating()
  }
  
  func configure(viewModel:FormButtonViewModel) {
    self.button.setTitle(viewModel.buttonTitle, for: .normal)
    self.activate()
  }
  
}

