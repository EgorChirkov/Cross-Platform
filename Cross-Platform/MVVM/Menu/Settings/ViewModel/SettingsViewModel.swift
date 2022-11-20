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
    
    var difficultyLevels: [String] = ["Easy", "Normal", "Hard"]
}
