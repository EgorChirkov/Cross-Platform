//
//  PlayViewModel.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import Foundation

class PlayViewModel: ObservableObject{
    
    @Published var isDismiss = false
    
    @Published var isEnabled = true
    
    @Published var seconds = 11
    
    @Published var score = 0
    
    private var timer: TimerConcurrent? = nil
    
    func start(){
        timer = TimerConcurrent(interval: 1, eventHandler: timerHandler)
        timer?.start()
    }
    
    func stop(){
        timer?.stop()
        timer = nil
        DispatchQueue.main.async {
            self.isEnabled.toggle()
        }
    }
    
    func onAction(){
        score += 1
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
