//
//  SessionRepository.swift
//  Dandelion
//
//  Created by Mishal Zulfiqar on 29/09/2026.
//

import Foundation

protocol SessionRepositoryProtocol {
    func startSession(mood: String) async throws -> OpeningPrompt
}
@MainActor
final class MockSessionRepository: SessionRepositoryProtocol {
    func startSession(mood: String) async throws -> OpeningPrompt {
        try await Task.sleep(nanoseconds: 500_000_000)  // simulate network delay
        return OpeningPrompt(
            sessionId: UUID().uuidString,
            promptText: "Given how \(mood) things feel tonight, what feels most important to sit with right now?"
        )
    }
}
