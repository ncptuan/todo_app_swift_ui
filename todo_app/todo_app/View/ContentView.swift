//
//  ContentView.swift
//  todo_app
//
//  Created by Mac on 23/09/2024.
//

import SwiftUI



struct ContentView: View {
    
    // THEME
    
    @ObservedObject var theme = ThemeSettings.shared
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var themes: [Theme] = themeData
    var dataList: [String] = [
    
    ];
    @State private var showingAddTodoView: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                // Background color
                Color(UIColor.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Navigation bar with Edit button and title
                    HStack {
                        Button("Edit") {
                            // Action for Edit button
                        }
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.red)
                        .padding(.leading)
                        
                        Spacer()
                        
                        Text("Todo")
                            .font(.system(size: 18, weight: .semibold))
                        
                        Spacer()
                        
                        // Placeholder for an icon (replace with actual image if available)
                        Image(systemName: "paintbrush")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding(.trailing)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    EmptyListView()
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddTaskView().environment(\.managedObjectContext, self.managedObjectContext)
              }
            .overlay(
              ZStack {
                Group {
                  Circle()
                    .fill(themes[self.theme.themeSettings].themeColor)
                    .opacity( 0.2 )
                    //.scaleEffect(self.animatingButton ? 1 : 0)
                    .frame(width: 68, height: 68, alignment: .center)
                  Circle()
                    .fill(themes[self.theme.themeSettings].themeColor)
                    .opacity( 0)
                    //.scaleEffect(self.animatingButton ? 1 : 0)
                    .frame(width: 88, height: 88, alignment: .center)
                }
                //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Button(action: {
                  self.showingAddTodoView.toggle()
                }) {
                  Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .background(Circle().fill(Color("ColorBase")))
                    .frame(width: 48, height: 48, alignment: .center)
                } //: BUTTON
                  .accentColor(themes[self.theme.themeSettings].themeColor)
                  .onAppear(perform: {
//                     self.animatingButton.toggle()
                  })
              } //: ZSTACK
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        }

    }
}

#Preview {
    ContentView()
}


