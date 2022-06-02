//
//  AchievementDTO.swift
//  MTGCommAchievements
//
//  Created by jason debottis on 5/31/22.
//

import Foundation
import UIKit

class Achievement:Codable, Identifiable{
    var id:Int
    var achievement: String?
    var description: String?
    var points:Int?
}
