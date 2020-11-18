//
//  Post.swift
//  forum
//
//  Created by Luke Solomon on 11/11/20.
//

import Foundation

struct Post:Decodable{
  var userId:Int
  var id:Int
  var title:String
  var body:String
}
