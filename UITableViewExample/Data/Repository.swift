//
//  Repository.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation


class Repository {
    
    let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    public func getContacts(completionHandler : @escaping(Result<[Contact]>) ->()){
        apiService.getContacts { (result) in
            completionHandler(result)
        }
    }
}
