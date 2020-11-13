//
//  LaunchViewController.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import UIKit

class LaunchViewController: MZ_ViewController {
 
  var windowView = UIView()
  
  var segmentedControl:UISegmentedControl = {
    var control = UISegmentedControl()
    control.insertSegment(withTitle: "Sign Up", at: 0, animated: false)
    control.insertSegment(withTitle: "Log In", at: 1, animated: false)
    control.addAction(UIAction(handler: { (action) in
      let control = action.sender as! UISegmentedControl.Segment
      print(control)
    }), for: .touchUpInside)
    control.setEnabled(true, forSegmentAt: 0)
    return control
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
  }
  
  func setupViews() {
    view.addSubview(windowView)
    
    view.addSubview(segmentedControl)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentIndex = 0
    
    NSLayoutConstraint.activate([
      
      windowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      windowView.bottomAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor),
      windowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      windowView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      
      segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40.0),
      segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
      segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
    ])
  }
  
}
