//
//  LeaderboardView.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: LeaderboardViewModel = .init()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.records, id: \.id){ record in
                    HStack{
                        Text(record.player)
                        
                        Text("\(record.result)")
                    }
                }
            }
            .onAppear{
                viewModel.fetchResults()
            }
            .navigationTitle("Leaderboard")
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
            .onChange(of: viewModel.isDismiss, perform: { _ in
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
