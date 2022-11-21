//
//  UserSettings.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 21.11.2022.
//

import Foundation

enum UserKey: String{
    case playerName = "playerName"
    case difficulty = "difficulty"
}

class UserSettingsService{
    
    static let shared: UserSettingsService = .init()
    
    private let defaults = UserDefaults.standard
    
    private init() { }
    
    func save(value: Int, for key: UserKey){
        defaults.set(value, forKey: key.rawValue)
    }
    
    func save(value: Bool, for key: UserKey){
        defaults.set(value, forKey: key.rawValue)
    }
    
    func save(value: String, for key: UserKey){
        defaults.set(value, forKey: key.rawValue)
    }
    
    func valueInt(for key: UserKey) -> Int{
        defaults.integer(forKey: key.rawValue)
    }
    
    func valueBool(for key: UserKey) -> Bool{
        defaults.bool(forKey: key.rawValue)
    }
    
    func valueString(for key: UserKey) -> String{
        defaults.string(forKey: key.rawValue) ?? ""
    }
}
