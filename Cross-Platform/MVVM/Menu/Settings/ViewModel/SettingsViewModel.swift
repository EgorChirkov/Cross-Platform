//
//  SettingsViewModel.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import Foundation

class SettingsViewModel: ObservableObject{
    
    @Published var isDismiss = false
    
    @Published var selection = 0
    
    @Published var playerName = "Player"
    
    var difficultyLevels: [String] = ["Easy", "Normal", "Hard"]
    
    func onAppear(){
        selection = UserSettingsService.shared.valueInt(for: .difficulty)
        playerName = UserSettingsService.shared.valueString(for: .playerName).isEmpty ? "Player" : UserSettingsService.shared.valueString(for: .playerName)
    }
    
    func onDisappear(){
        UserSettingsService.shared.save(value: selection, for: .difficulty)
        UserSettingsService.shared.save(value: playerName, for: .playerName)
    }
}
