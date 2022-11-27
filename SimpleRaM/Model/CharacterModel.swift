//
//  CharacterModel.swift
//  SimpleRaM
//
//  Created by Hakan Adanur on 27.11.2022.
//

import Foundation

struct CharacterBase : Codable {
    let results : [Character]
}

struct Character : Codable {
    let name : String
}
