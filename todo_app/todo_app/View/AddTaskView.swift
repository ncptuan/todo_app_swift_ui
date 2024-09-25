//
//  AddTaskView.swift
//  todo_app
//
//  Created by Mac on 23/09/2024.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var name: String = ""
    @State private var priority: String = "Medium"
    
    let priorities = ["Low", "Medium", "High" ]
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                
                    Button (
                        action: {
                            
                        })  {
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(themes[self.theme.themeSettings].themeColor)
                                .cornerRadius(9)
                                .foregroundColor(Color.white)
                        }
                
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                
                Spacer()
            }
            .padding(.vertical, 16)
            
            
            .navigationBarTitle("Add task", displayMode: .inline)
            .navigationBarItems( trailing: Button(action: {
            }){
                Image(systemName: "xmark")
            }
            )
        }
        
    }
}

#Preview {
    AddTaskView()
}
