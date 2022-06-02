//
//  Achievements.swift
//  MTGCommAchievements
//
//  Created by jason debottis on 5/31/22.
//

import SwiftUI
import Combine


struct Achievements: View {
    @StateObject var vm = AchievementsViewModel()
    var body: some View {
        if vm.achievements.count > 0 {
            VStack(alignment: .leading, spacing: 5.0) {
                NavigationView{
                    List{
                        ForEach(vm.achievements) { item in
                            AchievementRow(achievement: item)
                        }
                    }
                    
                }.toolbar {
                    Text("Achievements")
                }
                
            }

        }else{
            Text("No data available")
        }
        
    }
}

struct AchievementRow:View{
    var achievement:Achievement
    let rowLeading = CGFloat(10)
    let topEdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0)
    let middleEdgeInsets = EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
    let bottomEdgeInsets = EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)
    var body:some View{
        ZStack{
            
            VStack(alignment: .leading, spacing: 1.0, content: {
                if let ach = achievement.achievement{
                    Text("Achievement:\(ach)").padding(topEdgeInsets)
                }else{
                    Text("Achievement: No achievement name given").padding(topEdgeInsets)
                }
                if let desc = achievement.description{
                    Text("Description:\(desc)").padding(middleEdgeInsets)
                }else{
                    Text("Description: No Desc given").padding(middleEdgeInsets)
                }
                if let points = achievement.points{
                    Text("Points:\(points)").padding(bottomEdgeInsets)
                }else{
                    Text("Points: None set").padding(bottomEdgeInsets)
                }
            }).frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .topLeading)
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.blue, lineWidth: 2.0).padding(5))
        }
        
    }
}
struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
    }
}
