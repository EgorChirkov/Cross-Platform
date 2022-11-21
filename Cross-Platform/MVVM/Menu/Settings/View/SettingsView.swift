//
//  SettingsView.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: SettingsViewModel = .init()
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text("Enter player name")
                
                TextField("Player", text: $viewModel.playerName)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke().foregroundColor(Color.gray.opacity(0.5))
                    )
                
                Text("Select difficulty")
                
                Picker("", selection: $viewModel.selection) {
                    ForEach(0..<viewModel.difficultyLevels.count) { index in
                        Text(viewModel.difficultyLevels[index])
                            .foregroundColor(.blue)
                            .tag(index)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
            }
            .padding()
            
            .navigationTitle("Settings")
#if os(iOS)
            .navigationBarItems(trailing:
                Button {
                    viewModel.isDismiss.toggle()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray).opacity(0.5)
                }
            )
#endif
            .onAppear{
                viewModel.onAppear()
            }
            .onDisappear{
                viewModel.onDisappear()
            }
            .onChange(of: viewModel.isDismiss, perform: { _ in
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
