//
//  TimerConcurrent.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import Foundation

class TimerConcurrent{
    
    var interval = 0
    
    private var timer: DispatchSourceTimer?
    
    private var eventHandler: ( () -> Void )!

    init(interval: Int, eventHandler: @escaping () -> Void){
        self.interval = interval == 0 ? 90 : interval
        self.eventHandler = eventHandler
    }
    
    func start(){
        
        if timer != nil{
            stop()
        }
        
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue(label: "game.com", attributes: .concurrent))
        timer?.setEventHandler { [weak self] in
            self?.eventHandler()
        }
        timer?.schedule(deadline: .now(), repeating: .seconds(Int(interval)), leeway: .milliseconds(300))
        timer?.resume()
    }
    
    func stop(){
        timer?.cancel()
        timer?.setEventHandler(handler: {})
        timer = nil
    }
}
