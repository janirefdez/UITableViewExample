//
//  AppDIContainer.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 22/4/22.
//

import Foundation

final class AppDIContainer {
    
    // MARK: - Use Cases
    func makeContactsUseCase() -> GetContactsUseCase {
        return GetContactsUseCase(repository: makeRepository())
    }
    
    // MARK: - Repositories
    func makeRepository() -> Repository {
        return Repository(apiService: makeApiService())
    }
    
    // MARK: - API Service
    func makeApiService() -> ApiService {
        return ApiService(networkService: makeNetworkService())
    }
    
    // MARK: - Network Service
    func makeNetworkService() -> NetworkService {
        return NetworkService()
    }
}
