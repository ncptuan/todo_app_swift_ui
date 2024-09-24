//
//  AppEnvironment.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation

final public class AppEnvironment{
    let env: AppEnvironmentEnum
    
    private init(env: AppEnvironmentEnum) {
        self.env = env
    }
    public static let shared = AppEnvironment(env: AppEnvironmentEnum.dev);
    
    func getAPILink() -> String {
        switch(self.env){
        case .dev:
            return "http://localhost:3000";
        case .staging:
            return "http://localhost:3000";
        case .production:
            return "http://localhost:3000";
       
        }
       
        
    }
}

//final public class ThemeSettings: ObservableObject {
//  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
//    didSet {
//      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
//    }
//  }
//  
//  private init() {}
//  public static let shared = ThemeSettings()
//}


