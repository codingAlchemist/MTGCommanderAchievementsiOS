//
//  AchievementsViewModel.swift
//  MTGCommAchievements
//
//  Created by jason debottis on 5/31/22.
//

import UIKit
import Combine
class AchievementsViewModel: ObservableObject {
    
    @Published var achievements:[Achievement] = [Achievement]()
    
    func getAllAchievements(){
        AchievementService.getAchievements { [self] items, failure in
            items?.forEach({ achievement in
                achievements.append(achievement)
                
            })
        }
    }
    
    init(){
        self.getAllAchievements()
    }
}
