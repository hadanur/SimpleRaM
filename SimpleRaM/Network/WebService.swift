//
//  WebService.swift
//  SimpleRaM
//
//  Created by Hakan Adanur on 27.11.2022.
//

import Foundation

class WebService {
    
    static let shared = WebService()
    
    private init() { }
    
    func downloadCharacters(completion : @escaping (CharacterBase?) -> ()) {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let characterList = try JSONDecoder().decode(CharacterBase.self, from: data)
                    completion(characterList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
    
}

