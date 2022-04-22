//
//  NetworkService.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation

class NetworkService {
    func request<T>(_ url: String, httpMethod: HttpMethod, parameters:[String:Any]? = nil, completionHandler:@escaping (Result<NetworkResponse<T>>) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethod.rawValue
        if parameters != nil {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
        }
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let httpUrlResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(NetworkRequestError(error: error)))
                return
            }
            
            let successRange = 200...299
            if successRange.contains(httpUrlResponse.statusCode) {
                do {
                    let response = try NetworkResponse<T>(data: data, httpUrlResponse: httpUrlResponse)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(error))
                }
            } else {
                completionHandler(.failure(NetworkError(data: data, httpUrlResponse: httpUrlResponse)))
            }
        }).resume()
    }
}

enum HttpMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
