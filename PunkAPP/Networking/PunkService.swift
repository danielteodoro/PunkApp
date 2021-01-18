//
//  PunkService.swift
//  PunkAPP
//
//  Created by Daniel Teodoro on 16/01/21.
//

import Foundation

protocol PunkServicing {
    func fetchBeerList(completion: @escaping (Result<[BeerModel], Error>) -> Void)
}

class PunkService: PunkServicing {
    
    func fetchBeerList(completion: @escaping (Result<[BeerModel], Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.punkapi.com/v2/beers")!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            if let error = responseError {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let jsonData = responseData {
                let decoder = JSONDecoder()
                
                do {
                    let repos = try decoder.decode([BeerModel].self, from: jsonData)
                    DispatchQueue.main.async {
                        completion(.success(repos))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
