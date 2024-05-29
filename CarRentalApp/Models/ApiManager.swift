//
//  ApiManager.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 26.05.24.
//

import Foundation


protocol ApiManagerService {
    func fetchData(completion: @escaping ([Categories]?, Error?) -> Void)
}

class ApiManager: ApiManagerService {
    func fetchData(completion: @escaping ([Categories]?, Error?) -> Void) {
        let url = URL(string: "https://66533d90813d78e6d6d7ad07.mockapi.io/carRent/app/cars")!

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            do {
                let fetchedPosts = try JSONDecoder().decode([Categories].self, from: data)
                DispatchQueue.main.async {
                    completion(fetchedPosts, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
