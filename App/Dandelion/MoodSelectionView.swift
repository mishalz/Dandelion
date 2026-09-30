import SwiftUI

struct MoodSelectionView: View {
    @StateObject private var viewModel = SessionViewModel(repository: MockSessionRepository())

    var body: some View {
        VStack(spacing: 16) {
            Text("How are you arriving tonight?")
                .font(.title2)

            ForEach(availableMoods, id: \.name) { mood in
                Button("\(mood.emoji) \(mood.name)") {
                    viewModel.selectMood(mood)
                }
            }

            if viewModel.isLoading {
                ProgressView()
            }

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .navigationDestination(item: $viewModel.openingPrompt) { prompt in
            OpeningPromptView(prompt: prompt)
        }
    }
}

#Preview {
    NavigationStack {
        MoodSelectionView()
    }
}
