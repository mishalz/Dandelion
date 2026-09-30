//
//  OpeningPromptView.swift
//  Dandelion
//
//  Created by Mishal Zulfiqar on 29/09/2026.
//

import SwiftUI

struct OpeningPromptView: View {
    let prompt: OpeningPrompt
    
    @State private var responseText = ""
    @State private var submittedResponse: String?
    
    private var canSubmit: Bool {
          !responseText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      }

    var body: some View {
         VStack(spacing: 24) {
             ScrollView {
                 VStack(spacing: 24) {
                     Text(prompt.promptText)
                         .font(.title2)
                         .multilineTextAlignment(.center)
                         .padding(.horizontal)

                     TextEditor(text: $responseText)
                         .frame(minHeight: 180)
                         .padding(8)
                         .overlay {
                             RoundedRectangle(cornerRadius: 12)
                                 .stroke(.gray.opacity(0.4), lineWidth: 1)
                         }
                         .overlay(alignment: .topLeading) {
                             if responseText.isEmpty {
                                 Text("Write whatever feels present for you...")
                                     .foregroundStyle(.secondary)
                                     .padding(.top, 16)
                                     .padding(.leading, 14)
                                     .allowsHitTesting(false)
                             }
                         }

                     Button {
                         submitResponse()
                     } label: {
                         Text("Continue")
                             .frame(maxWidth: .infinity)
                     }
                     .buttonStyle(.borderedProminent)
                     .disabled(!canSubmit)

                     if let submittedResponse {
                         VStack(alignment: .leading, spacing: 8) {
                             Text("Your response")
                                 .font(.headline)

                             Text(submittedResponse)
                                 .foregroundStyle(.secondary)
                         }
                         .frame(maxWidth: .infinity, alignment: .leading)
                     }
                 }
                 .padding()
             }
         }
         .navigationTitle("Reflect")
     }
    private func submitResponse() {
        submittedResponse = responseText.trimmingCharacters(in: .whitespacesAndNewlines)
        responseText = ""
    }
}

#Preview {
    NavigationStack {
        OpeningPromptView(prompt: OpeningPrompt(sessionId: "sess_preview", promptText: "What's been sitting with you today?"))
    }
}
