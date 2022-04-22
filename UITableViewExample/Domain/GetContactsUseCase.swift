//
//  GetContactsUseCase.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation

class GetContactsUseCase {
    
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getContacts(completionHandler : @escaping(Result<[Contact]>) ->()) {
        repository.getContacts() { result in
            completionHandler(result)
        }
    }
}
