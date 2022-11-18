//
//  UserRepository.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 18/11/22.
//

import Foundation

protocol UserRepository {
    func isUserLogged() -> Bool
    func getLoggedUser() -> User?
}
