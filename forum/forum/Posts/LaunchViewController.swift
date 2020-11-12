//
//  LaunchViewController.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import UIKit

class LaunchViewController: MZ_ViewController {

  let networkHandler = NetworkHandler()
  let tableView = UITableView()
  var posts = [Post]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "posts"
    
    self.networkHandler.getPosts { (response) in
      if case .success (let posts) = response {
        DispatchQueue.main.async {
          self.posts = posts
          self.tableView.reloadData()
        }
      } else if case .failure (let error) = response {
        print(error)
      }
    }
    
    setupViews()
  }

  func setupViews() {
    self.view.backgroundColor = UIColor.white
    
    let margins = self.view.layoutMarginsGuide
    self.view.addSubview(tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    
    self.tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0.0).isActive = true
    self.tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0.0).isActive = true
    self.tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0.0).isActive = true
    self.tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0.0).isActive = true
    
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
  
  

}

extension LaunchViewController:UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    
    cell.textLabel?.text = self.posts[indexPath.row].title
    cell.detailTextLabel?.text = self.posts[indexPath.row].body
    
    cell.textLabel?.numberOfLines = 0
    
    return cell
  }
  
  
  
  
}

extension LaunchViewController:UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("row selected \(indexPath)")
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
}
