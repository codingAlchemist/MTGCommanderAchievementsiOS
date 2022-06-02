//
//  CommanderService.swift
//  MTGCommAchievements
//
//  Created by jason debottis on 5/31/22.
//

import Foundation
import UIKit

class AchievementService{
    
    typealias CompletionBlock<T> = (_ success:T?,_ failure: Error?) -> Void
    
    enum BASEURL:String{
        case LOCAL = "http://localhost:3000"
        case REMOTE = "http://178.62.208.138:3000"
    }
    
    enum METHOD:String{
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    static let session = URLSession.shared
    static let decoder = JSONDecoder()
    
    static func createRequest(url: String, method: METHOD)->URLRequest{
        var request = URLRequest(url: (URL(string: url) ?? URL(string: BASEURL.REMOTE.rawValue))!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        return request
    }
    
    static func getAchievements(completion:@escaping CompletionBlock<[Achievement]>){
        let request = createRequest(url: "\(BASEURL.REMOTE.rawValue)/achievement", method: .GET)
        let task = session.dataTask(with: request) { data, response, error in
            do{
                if let data = data{
                    let achievements = try decoder.decode([Achievement].self, from: data)
                    
                    completion(achievements, nil)
                }else{
                    let error = NSError(domain: "No data availble", code: 500)
                    completion(nil, error)
                }
                
            }catch{
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
