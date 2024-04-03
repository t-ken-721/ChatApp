//
//  SwiftUIView.swift
//  chatapp
//
//  Created by 戸沢健治 on 2024/03/29.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var textFeildText: String = ""
    
    let vm: ChatViewModel = ChatViewModel()
    
    var body: some View {
        VStack (spacing: 0){
            // Message Area
            MessageArea
            
         // Navigation Area
          .overlay(NavigationArea, alignment: .top)
            
            //Input Area
            InputArea
        }
    }
}

#Preview {
    SwiftUIView()
}

extension SwiftUIView {
    
    private var MessageArea: some View {
        ScrollView {
            VStack(spacing: 0){
                ForEach(vm.messages) { message in
                    Messagerow(message: message)
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(Color("Background"))
    }
    
    private var InputArea: some View {
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            TextField("Aa",text: $textFeildText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    
                    , alignment: .trailing
                )
            onSubmit {
            }
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color (uiColor: .systemBackground))
    }
    private var NavigationArea: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.title2)
            Text("Title")
                .font(.title2.bold())
            Spacer()
            HStack(spacing: 16) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
        .foregroundColor(.white)
        .padding()
        .background(Color("Bakground").opacity(0.9))
    }
    
    private func sendMessage() {
        vm.addMessage(text: textFeildText)
    }
    
}
