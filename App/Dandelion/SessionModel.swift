//
//  SessionModel.swift
//  Dandelion
//
//  Created by Mishal Zulfiqar on 29/09/2026.
//

import Foundation

struct OpeningPrompt: Hashable {
    let sessionId: String
    let promptText: String
}

struct Mood{
    let name: String
    let emoji: String
}

let availableMoods = [
    Mood(name: "Joyful", emoji: ""),
    Mood(name: "Excited", emoji: "🙂"),
    Mood(name: "Sad", emoji: "🌧️"),
    Mood(name: "Angry", emoji: "🌿"),
    Mood(name: "Anxious", emoji: "🌿"),
    Mood(name: "Numb", emoji: ""),
    Mood(name: "Not sure", emoji: "")
]

