//
//  MainView.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel = .init()
    
    var body: some View {
#if os(iOS)
        NavigationView{
            List{
                Button {
                    viewModel.isShowPlay.toggle()
                } label: {
                    Text("Play")
                }
                
                Button {
                    viewModel.isShowLeaderboard.toggle()
                } label: {
                    Text("Leaderboard")
                }
                
                Button {
                    viewModel.isShowSettings.toggle()
                } label: {
                    Text("Settings")
                }

            }
            .fullScreenCover(isPresented: $viewModel.isShowPlay, content: {
                PlayView()
            })
            .fullScreenCover(isPresented: $viewModel.isShowLeaderboard, content: {
                LeaderboardView()
            })
            .fullScreenCover(isPresented: $viewModel.isShowSettings, content: {
                SettingsView()
            })
            .navigationTitle("Main Menu")
        }
#endif
        
#if os(macOS)
            TabView {
                PlayView()
                    .tabItem {
                        Text("Play")
                    }
                
                LeaderboardView()
                    .tabItem {
                        Text("Leaderboard")
                    }
                
                SettingsView()
                    .tabItem {
                        Text("Settings")
                    }
            }
            .frame(width: 300, height: 600)
#endif
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
