//
//  ServiceManager.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//
import Foundation

class NetworkHandler {
  
  // MARK: - Properties
  public static let shared: NetworkHandler = NetworkHandler()
  
  public var baseURL: String = "https://api.binance.com/api/v3"
}

// MARK: - Public Functions
extension NetworkHandler {
  
  func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Result<T, NetworkError>) -> Void) {
    if request.isLoggingEnabled.0 {
      LogManager.req(request)
    }
    
    /// Uncomment for rest service
    URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
      // Check that there is no error with the session
      if error != nil {
        print("Error response from Data Session")
        completion(.failure(.general))
        return
      }
      
      //ensure an HTTP Response code of 200
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        print("Error with Response: \(String(describing: response))")
        completion(.failure(.responseError))
        return
      }
      
      //Data object is optional - bind to prevent further issues
      guard let safeData = data else {
        completion(.failure(.dataError))
        return
      }
      
      do {
        var responseModel = try JSONDecoder().decode(ResponseModel<T>.self, from: safeData)
        if responseModel.isSuccess, let data = responseModel.data {
          responseModel.rawData = safeData
          responseModel.request = request
          
          if request.isLoggingEnabled.1 {
            LogManager.res(responseModel)
          }
          completion(.success(data))
        } else {
          completion(.failure(.general))
        }
        //return the results within the completion handler
      } catch let jsonErr {
        print("Error serializing Json \(jsonErr)")
        completion(.failure(.JSONError))
      }
      
    }.resume()

  }
}
