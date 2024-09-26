//
//  RowTaskView.swift
//  todo_app
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct RowTaskView: View {
    
    var icon: String?;
    var title: String?;
    var subTitle: String?;
    
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .fill(Color.gray)
                Image(systemName: icon ?? "gear")
                  .foregroundColor(Color.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text(title ?? "")
                .foregroundColor(Color.gray)
            Spacer()
            Text(subTitle ?? "")
        }
       
    }
}

#Preview {
    RowTaskView(icon: "gear", title: "Application", subTitle: "Todo")
        .padding(.horizontal, 8)
}
