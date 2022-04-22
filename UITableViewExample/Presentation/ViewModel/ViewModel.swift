//
//  Parser.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation

final class ViewModel {
    private let getContactsUseCase: GetContactsUseCase
    
    private var contacts: [Contact] = []
    
    init(getContactsUseCase: GetContactsUseCase){
        self.getContactsUseCase = getContactsUseCase
    }
    
    func getContacts(completionHandler : @escaping ([Contact]) -> ()) {
        getContactsUseCase.getContacts(completionHandler: { result in
            do {
                switch result {
                case .success:
                    completionHandler(try result.get())
                case .failure:
                    print("Failure")
                }
            } catch {
                print("There is an error")
            }
            
        })
    }
}
