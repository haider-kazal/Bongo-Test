//
//  HomeAPIService.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

final class HomeAPIService {
    func getDisclaimerHTML(onCompletion completionHandler: ((Result<String, URLError>) -> Void)?) {
        let endpoint = Endpoint.bongoDisclaimer
        
        URLSession
            .shared
            .dataTask(with: endpoint.url, completionHandler: { (data, response, error) in
                guard let data = data, error == nil else {
                    error is URLError
                        ? completionHandler?(.failure(error as! URLError))
                            
                        : completionHandler?(.failure(URLError(URLError.unknown)))
                    return
                }
                
                guard let htmlString = String(data: data, encoding: .utf8) else {
                    completionHandler?(.failure(URLError(URLError.cannotParseResponse)))
                    return
                }
                completionHandler?(.success(htmlString))
            })
            .resume()
    }
}
