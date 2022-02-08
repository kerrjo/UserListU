//
//  UsersViewModel.swift
//
//  Created by JOSEPH KERR on 2/4/22.
//

import Foundation

protocol UsersViewable {
    func load(_ completion: @escaping () -> ())
    var count: Int { get }
    subscript (_ index: Int) -> UserElement? { get }
}

class UsersViewModel: UsersViewable {

    private var service: ServiceHandling
    func load(_ completion: @escaping () -> ()) {
        service.fetch {
            switch $0 {
            case .success(let users):
                self.users = users
            case .failure(let error):
                print(error)
            }
            
            completion()
        }
    }
    private var users: Users = []
    var count: Int { users.count }
    
    subscript (_ index: Int) -> UserElement? {
        guard index < count else { return nil }
        return users[index]
    }
    
    init(service: ServiceHandling? = nil) {
        self.service = service ??  UsersService()
    }
}

