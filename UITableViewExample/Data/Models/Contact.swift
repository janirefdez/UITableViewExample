//
//  User.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import Foundation

struct ContactApiResponse: Codable {
    let contacts : [Contact]
}

struct Contact: Codable {
    let id, name, email : String
}
