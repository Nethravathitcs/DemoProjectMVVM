//
//  EmployeesViewModel.swift
//  Demo
//
//  Created by Nethra on 01/05/24.
//

import Foundation

class EmployeesViewModel: NSObject {
    private var employeeService: EmployeesServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var employees = Employees()
    
    var employeeCellViewModels = [EmployeeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(employeeService: EmployeesServiceProtocol = EmployeesService()) {
        self.employeeService = employeeService
    }
    
    func getEmployees() {
        employeeService.getEmployees { success, model, error in
            if success, let employees = model {
                self.fetchData(employees: employees)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(employees: Employees) {
        self.employees = employees // Cache
        var vms = [EmployeeCellViewModel]()
        for employee in employees {
            vms.append(createCellModel(employee: employee))
        }
        employeeCellViewModels = vms
    }
    
    func createCellModel(employee: Employee) -> EmployeeCellViewModel {
        let id = String(employee.id)
        let title = employee.user_title
        let body =  employee.user_body
        let it = String(employee.uniqueId)
        
        return EmployeeCellViewModel(userId: id, it: it, title: title, body: body)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> EmployeeCellViewModel {
        return employeeCellViewModels[indexPath.row]
    }
}
