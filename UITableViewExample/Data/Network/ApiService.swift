//
//  ApiService.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation

class ApiService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getContacts(completionHandler: @escaping(Result<[Contact]>) ->()) {
        networkService.request(Constants.baseUrl, httpMethod: HttpMethod.get) { (result: Result<NetworkResponse<ContactApiResponse>>) in
            switch result {
            case let .success(response):
                let contacts = response.entity.contacts
                completionHandler(.success(contacts))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
