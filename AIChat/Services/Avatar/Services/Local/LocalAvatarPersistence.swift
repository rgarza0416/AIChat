//
//  LocalAvatarPersistence.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/8/25.
//

@MainActor
protocol LocalAvatarPersistence {
    func addRecentAvatar(avatar: AvatarModel) throws
    func getRecentAvatars() throws -> [AvatarModel]
}
