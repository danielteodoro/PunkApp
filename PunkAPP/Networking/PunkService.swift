//
//  PunkService.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import UIKit

class PunkService: URLSession {
    
    func getBeerList(completion: ((Result<[BeerModel], Error>) -> Void)?) {
        var request = URLRequest(url: URL(string: "https://api.punkapi.com/v2/beers")!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    
                    do {
                        let repos = try decoder.decode([BeerModel].self, from: jsonData)
                        completion?(.success(repos))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
