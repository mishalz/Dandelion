//
//  SessionViewModel.swift
//  Dandelion
//
//  Created by Mishal Zulfiqar on 29/09/2026.
//

import Foundation
public import Combine


@MainActor
final class SessionViewModel: ObservableObject {
    @Published var selectedMood: Mood?
    @Published var openingPrompt: OpeningPrompt?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: SessionRepositoryProtocol

    init(repository: SessionRepositoryProtocol) {
        self.repository = repository
    }

    func selectMood(_ mood: Mood) {
        selectedMood = mood
        Task {
            await startSession(mood: mood)
        }
    }

    private func startSession(mood: Mood) async {
        isLoading = true
        errorMessage = nil
        do {
            openingPrompt = try await repository.startSession(mood: mood.name)
        } catch {
            errorMessage = "Something went wrong. Please try again."
        }
        isLoading = false
    }
}
