//
//  EmployeesService.swift
//  Demo
//
//  Created by Nethra on 01/05/24.
//

import Foundation

protocol EmployeesServiceProtocol {
    func getEmployees(completion: @escaping (_ success: Bool, _ results: Employees?, _ error: String?) -> ())
}

class EmployeesService: EmployeesServiceProtocol {
   
   func getEmployees(completion: @escaping (Bool, Employees?, String?) -> ()) {
       guard let path = Bundle.main.path(forResource: "demo", ofType: "json") else{ return}
               debugPrint(path)
               let url = URL(fileURLWithPath: path)
               do{
                   let data = try Data(contentsOf: url)
                   let response = try JSONDecoder().decode(Employees.self, from: data)
                   completion(true, response, nil)
               }catch{
                   completion(false, nil, "Error: Trying to parse Employees to model")
               }
       /* HttpRequestHelper().GET(url: "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Employees.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Employees to model")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }*/
    }
}
