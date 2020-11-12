//
//  NetworkHandler.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import Foundation


class NetworkHandler {
  

  
  func getPosts(completion: @escaping (Result<[Post], Error>)->()) {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let safeData = data else {
        completion(.failure(error!))
        return
      }
      
      let decoder = JSONDecoder.init()
      
      do {
        let posts = try decoder.decode([Post].self, from: safeData)
        completion(.success(posts))
      } catch let error {
        completion(.failure(error))
      }
    }.resume()
    
    
  }
  
  
  
}
