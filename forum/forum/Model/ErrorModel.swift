//
//  ErrorModel.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

enum NetworkError : Error {
  case general
  case dataError
  case responseError
  case connectivityFailed
  case URLissue
  case JSONError
}
