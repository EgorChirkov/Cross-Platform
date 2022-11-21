//
//  PlayViewModel.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import Foundation

enum DuficultyType: Int, CaseIterable{
    case easy = 0
    case normal = 1
    case hard = 2
}

class PlayViewModel: ObservableObject{
    
    @Published var isDismiss = false
    
    @Published var isEnabled = true{
        didSet{
            // TODO: save results
        }
    }
    
    @Published var seconds = 11
    
    @Published var score = 0
    
    private var timer: TimerConcurrent? = nil
    
    var currentDifficulty: DuficultyType = .normal
    
    var currentPlayer: String = ""
    
    var sizeTap: CGFloat{
        switch currentDifficulty {
        case .easy:
            return 120
        case .normal:
            return 90
        case .hard:
            return 45
        }
    }
    
    func onAppear(){
        currentDifficulty = DuficultyType(rawValue: UserSettingsService.shared.valueInt(for: .difficulty)) ?? .normal
        currentPlayer = UserSettingsService.shared.valueString(for: .playerName)
        start()
    }
    
    func onAction(){
        score += 1
    }
    
    private func start(){
        timer = TimerConcurrent(interval: 1, eventHandler: timerHandler)
        timer?.start()
    }
    
    private func stop(){
        timer?.stop()
        timer = nil
        DispatchQueue.main.async {
            self.isEnabled.toggle()
        }
    }
    
    private func timerHandler(){
        DispatchQueue.main.async {
            self.seconds -= 1
        }
        if seconds <= 1{
            stop()
        }
    }
}
