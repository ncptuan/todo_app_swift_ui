//
//  EmptyContentView.swift
//  todo_app
//
//  Created by Mac on 23/09/2024.
//

import Foundation
import SwiftUI


struct EmptyListView: View {
    
    var screenPadding: EdgeInsets?;
    
    let images: [String] = [
      "illustration-no1",
      "illustration-no2",
      "illustration-no3"
    ]
    
    let tips: [String] = [
      "Use your time wisely.",
      "Slow and steady wins the race.",
      "Keep it short and sweet.",
      "Put hard tasks first.",
      "Reward yourself after work.",
      "Collect tasks ahead of time.",
      "Each night schedule for tomorrow."
    ]
    
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    var body: some View {
        ZStack{
            VStack{
                Image("\(images.randomElement() ?? images[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                Text("\(tips.randomElement() ?? tips[0])")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
            }
            .padding(screenPadding ?? EdgeInsets())
           
        }
    }
}

#Preview {
    EmptyListView(screenPadding: EdgeInsets())
}
