//
//  LaunchViewController.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import UIKit


class LaunchViewController: MZ_ViewController {
  
  lazy var mozillaLogoView:UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "MozillaBuilders_Logo")
    return imageView
  }()
  
  lazy var scrollView:UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
    return scrollView
  }()
  
  lazy var windowView:AuthView = {
    let loginView = AuthView()
    return loginView
  }()
  
  var segmentedControl:UISegmentedControl = {
    var control = UISegmentedControl()
    control.insertSegment(withTitle: "Sign Up", at: 0, animated: false)
    control.insertSegment(withTitle: "Log In", at: 1, animated: false)
    control.addTarget(self, action: #selector(handleSegmentedControlTapped), for: .valueChanged)
    control.setEnabled(true, forSegmentAt: 0)
    return control
  }()
  
  @objc func handleSegmentedControlTapped(sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      handleTransitionToSignup()
    case 1:
      handleTransitionToLogin()
    default:
      print("error - segment out of bounds")
    }
  }
  
  func handleTransitionToSignup() {
    self.windowView.transitionToSignup()
  }
  
  func handleTransitionToLogin() {
    self.windowView.transitionToLogin()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow(_:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide(_:)),
      name: UIResponder.keyboardWillHideNotification,
      object: nil)
  }
  
  func setupViews() {
    view.addSubview(scrollView)
    
    scrollView.addSubview(mozillaLogoView)
    
    scrollView.addSubview(windowView)
    windowView.translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.addSubview(segmentedControl)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    
    scrollView.isScrollEnabled = false
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      
      mozillaLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      mozillaLogoView.bottomAnchor.constraint(equalTo: windowView.topAnchor, constant: -20.0),
      mozillaLogoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      mozillaLogoView.heightAnchor.constraint(equalToConstant: 24),
      mozillaLogoView.widthAnchor.constraint(equalToConstant: 167),

      windowView.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -40.0),
      windowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      windowView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      
      segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
      segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
      segmentedControl.heightAnchor.constraint(equalToConstant: 40.0)
    ])
  }
  
  func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
    guard
      let userInfo = notification.userInfo,
      let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else {
        return
    }
      
    let adjustmentHeight = (keyboardFrame.cgRectValue.height + 20) * (show ? 1 : -1)
    scrollView.contentInset.bottom += adjustmentHeight
    scrollView.verticalScrollIndicatorInsets.bottom += adjustmentHeight
  }
    
  @objc func keyboardWillShow(_ notification: Notification) {
    adjustInsetForKeyboardShow(true, notification: notification)
    scrollView.isScrollEnabled = true
  }
  @objc func keyboardWillHide(_ notification: Notification) {
    adjustInsetForKeyboardShow(false, notification: notification)
    scrollView.isScrollEnabled = false
  }
  
  func hideKeyboard(_ sender: AnyObject) {
//    nameTextField.endEditing(true)
  }
  
}
