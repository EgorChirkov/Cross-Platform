//
//  LeaderboardViewModel.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import Foundation

struct RecordItem: Identifiable{
    var id: UUID = .init()
    let player: String
    let result: Int
}

class LeaderboardViewModel: ObservableObject{
    
    @Published var isDismiss = false
    
    @Published var records: [RecordItem] = []
    
    func fetchResults(){
        records = [RecordItem(player: "Player", result: 0),
                   RecordItem(player: "Player", result: 34),
                   RecordItem(player: "Player", result: 45),
                   RecordItem(player: "Player", result: 25),
                   RecordItem(player: "Player", result: 57),
                   RecordItem(player: "Player", result: 48),
                   RecordItem(player: "Player", result: 12),
                   RecordItem(player: "Player", result: 30),
        ]
        
        records.sort(by: { $0.result > $1.result })
    }
}
