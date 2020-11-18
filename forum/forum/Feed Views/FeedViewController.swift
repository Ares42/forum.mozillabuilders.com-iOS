//
//  FeedViewController.swift
//  forum
//
//  Created by Luke Solomon on 11/13/20.
//

import UIKit

class FeedViewController:UIViewController {
  
  let networkHandler = NetworkHandler()
  let tableView = UITableView()
  lazy var segmentedControl: UISegmentedControl = {
    var control = UISegmentedControl()
    control.insertSegment(withTitle: "Hot", at: 0, animated: false)
    control.insertSegment(withTitle: "New", at: 1, animated: false)
    return control
  }()
  
  var posts = [Post]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    self.networkHandler.getPosts { [weak self] (response) in
//      if case .success (let posts) = response {
//        DispatchQueue.main.async {
//          self?.posts = posts
//          self?.tableView.reloadData()
//        }
//      } else if case .failure (let error) = response {
//        print(error)
//      }
//    }
    
    setupViews()
  }
  
  func setupViews() {
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "UNFCK"
    
    view.backgroundColor = UIColor.white
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
        
    view.addSubview(segmentedControl)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
    segmentedControl.addAction(UIAction(handler: { [weak self] (action) in
      let control = action.sender as! UISegmentedControl
      if control.selectedSegmentIndex == 0 {
        self?.handleTransitionToHot()
      } else if control.selectedSegmentIndex == 1 {
        self?.handleTransitionToNew()
      } else {
        fatalError()
      }
      
      print(control)
    }), for: .valueChanged)
    segmentedControl.selectedSegmentIndex = 0
    
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      segmentedControl.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor),
      segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
      segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
      
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0)
    ])
  }
  
  func handleTransitionToNew() {
    
  }
  
  func handleTransitionToHot() {
    
  }
  
}

extension FeedViewController:UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    
    cell.textLabel?.text = self.posts[indexPath.row].title
    cell.detailTextLabel?.text = self.posts[indexPath.row].body
    cell.textLabel?.numberOfLines = 0
    
    return cell
  }
  
}

extension FeedViewController:UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("row selected \(indexPath)")
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
}
