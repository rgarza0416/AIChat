//
//  MockChatService.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/9/25.
//

import SwiftUI

@MainActor
class MockChatService: ChatService {
    
    let chats: [ChatModel]
    @Published private var messages: [ChatMessageModel]
    let delay: Double
    let showError: Bool

    init(
        chats: [ChatModel] = ChatModel.mocks,
        messages: [ChatMessageModel] = ChatMessageModel.mocks,
        delay: Double = 0.0,
        showError: Bool = false
    ) {
        self.chats = chats
        self.messages = messages
        self.delay = delay
        self.showError = showError
    }
    
    private func tryShowError() throws {
        if showError {
            throw URLError(.unknown)
        }
    }
    
    func createNewChat(chat: ChatModel) async throws {
        
    }
    
    func getChat(userId: String, avatarId: String) async throws -> ChatModel? {
        try await Task.sleep(for: .seconds(delay))
        try tryShowError()
        
        return chats.first { chat in
            return chat.userId == userId && chat.avatarId == avatarId
        }
    }
    
    func getAllChats(userId: String) async throws -> [ChatModel] {
        try await Task.sleep(for: .seconds(delay))
        try tryShowError()

        return chats
    }
    
    func addChatMessage(chatId: String, message: ChatMessageModel) async throws {
        messages.append(message)
    }
    
    func markChatMessageAsSeen(chatId: String, messageId: String, userId: String) async throws {
        
    }
    
    func getLastChatMessage(chatId: String) async throws -> ChatMessageModel? {
        try await Task.sleep(for: .seconds(delay))
        try tryShowError()

        return ChatMessageModel.mocks.randomElement()
    }
    
    func streamChatMessages(chatId: String, onListenerConfigured: @escaping (AnyListener) -> Void) -> AsyncThrowingStream<[ChatMessageModel], Error> {
        AsyncThrowingStream { continuation in
            continuation.yield(messages)
            
            Task {
                for await value in $messages.values {
                    continuation.yield(value)
                }
            }
        }
    }
    
    func deleteChat(chatId: String) async throws {
        
    }
    
    func deleteAllChatsForUser(userId: String) async throws {
        
    }
    
    func reportChat(report: ChatReportModel) async throws {
        
    }
}
