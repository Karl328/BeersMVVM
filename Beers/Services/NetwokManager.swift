//
//  NetwokManager.swift
//  TestBeersMVVM
//
//  Created by Линар Нигматзянов on 01/09/2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let api = ApiUrl.urlBeer.rawValue
    
    private init() {}
    
    func fetchData(completion: @escaping (_ beersElement: [BeerElement]) -> Void) {
        let decoder = JSONDecoder()
        let session = URLSession(configuration: .default)
        guard let url = URL(string: api) else { return }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            do {
                let beer = try decoder.decode([BeerElement].self, from: data )
                DispatchQueue.main.async {
                    completion(beer)
                }
            } catch let error {
                print("Error", error)
                
            }
        }.resume()
        
    }
    
}
