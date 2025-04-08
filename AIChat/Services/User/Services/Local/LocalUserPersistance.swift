//
//  LocalUserPersistance.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/8/25.
//

protocol LocalUserPersistance {
    func getCurrentUser() -> UserModel?
    func saveCurrentUser(user: UserModel?) throws
}
