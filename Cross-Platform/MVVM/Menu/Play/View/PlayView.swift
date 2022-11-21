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
                    .font(.system(size: 52))
                    .bold()
                    .padding(.top, 40)
                
                Spacer()
                
                Text("TAP")
                    .font(.system(size: viewModel.sizeTap / 2))
                    .foregroundColor(.white)
                    .frame(width: viewModel.sizeTap, height: viewModel.sizeTap)
                    .background(viewModel.isEnabled ? Color.red : Color.gray)
                    .cornerRadius(viewModel.sizeTap / 2)
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
                viewModel.onAppear()
            }
            .navigationTitle("Play")
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

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
