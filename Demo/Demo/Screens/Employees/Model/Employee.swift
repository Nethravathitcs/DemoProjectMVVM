//
//  Employee.swift
//  Demo
//
//  Created by Nethra on 01/05/24.
//

import Foundation

typealias Employees = [Employee]

// MARK: - Employee
struct Employee: Codable {
    let id: Int
    let uniqueId: Int
    let user_title: String
    let user_body: String

    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case uniqueId = "it"
        case user_title = "title"
        case user_body = "body"
    }
}
