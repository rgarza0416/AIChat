//
//  FileManagerUserPersistance.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/8/25.
//

import SwiftUI

struct FileManagerUserPersistance: LocalUserPersistance {
    private let userDocumentKey = "current_user"
    
    func getCurrentUser() -> UserModel? {
        try? FileManager.getDocument(key: userDocumentKey)
    }
    
    func saveCurrentUser(user: UserModel?) throws {
        try FileManager.saveDocument(key: userDocumentKey, value: user)
    }
}
