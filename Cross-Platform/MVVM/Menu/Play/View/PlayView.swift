//
//  PlayView.swift
//  Cross-Platform
//
//  Created by Егор Чирков on 20.11.2022.
//

import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: PlayViewModel = .init()
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text("\(viewModel.score)")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("TAP")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
                    .background(viewModel.isEnabled ? Color.red : Color.gray)
                    .cornerRadius(45)
                    .onTapGesture {
                        if viewModel.isEnabled{
                            viewModel.onAction()
                        }
                    }
                
                Spacer()
                
                Text("\(viewModel.seconds) sec.")
                    .font(.title)
            }
            .padding()
            .onAppear{
                viewModel.start()
            }
            .navigationTitle("Play")
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
            .onChange(of: viewModel.isDismiss, perform: { _ in
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
