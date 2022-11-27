//
//  HomeViewModel.swift
//  SimpleRaM
//
//  Created by Hakan Adanur on 27.11.2022.
//

import Foundation

protocol HomeVMDelegate {
    func fetchCharactersOnSuccess()
    func fetchCharactersOnUnsuccess()
}

class HomeVM {
    let service = WebService.shared
    var characters = [Character]()
    var delegate: HomeVMDelegate?
    
    func fetchCharacters() {
        service.downloadCharacters { result in
            if let result = result {
                self.characters = result.results
                self.delegate?.fetchCharactersOnSuccess()
            } else {
                self.delegate?.fetchCharactersOnUnsuccess()
            }
        }
    }
}
