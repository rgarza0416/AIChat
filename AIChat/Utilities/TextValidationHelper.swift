//
//  TextValidationHelper.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/3/25.
//
import Foundation

struct TextValidationHelper {
    
    static func checkIfTextIsValid(text: String, minimumCharacterCount: Int = 4) throws {
        guard text.count >= minimumCharacterCount else {
            throw TextValidationError.notEnoughCharacters(min: minimumCharacterCount)
        }
        
        let badWords: [String] = [
            "shit", "bitch", "ass"
        ]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }

    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Please add at least \(min) characters."
            case .hasBadWords:
                return "Bad word detected. Please rephrase your message."
            }
        }
    }
}
