//
//  UsersService.swift
//  FidelityU
//
//  Created by JOSEPH KERR on 2/4/22.
//

import Foundation

enum ServiceError: Error {
    case err
    case errError(Error)
}

protocol ServiceHandling: AnyObject {
    func fetch(completion: @escaping (Result<Users,ServiceError>) -> ())
    func foo()
}

extension ServiceHandling {
    func foo() { }
}

class UsersService: ServiceHandling {
    func fetch(completion: @escaping (Result<Users, ServiceError>) -> ()) {
        
        // https://jsonplaceholder.typicode.com/users
        let url = URL(string: "https://bit.ly/39f0prN")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(ServiceError.errError(error)))
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      return completion(.failure(ServiceError.err))
                  }
            
            let decoder = JSONDecoder()
            guard let jsonData = data,
                  let users = try? decoder.decode(Users.self, from: jsonData) else {
                      return completion(.failure(ServiceError.err))
                  }
            
            completion(.success(users))
            
        }.resume()
    }
}
