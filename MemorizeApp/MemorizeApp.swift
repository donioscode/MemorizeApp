//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by doniyor normuxammedov on 31/12/23.
//

import SwiftUI

@main
struct MemorizeAppApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewmodel: game)
        }
    }
}
