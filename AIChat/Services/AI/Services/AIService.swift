//
//  AIService.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/8/25.
//

import SwiftUI

protocol AIService: Sendable {
    func generateImage(input: String) async throws -> UIImage
    func generateText(chats: [AIChatModel]) async throws -> AIChatModel
}
