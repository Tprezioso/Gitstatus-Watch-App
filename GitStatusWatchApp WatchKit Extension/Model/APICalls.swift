//
//  APICalls.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/7/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation
import Alamofire

class APICALL {
    let statusSummaryForGitHub = "https://kctbh9vrtdwd.statuspage.io/api/v2/summary.json"
    typealias WebServiceResponse = ([[String: Any]]?) -> Void
    
    func summaryStatus(completion: @escaping WebServiceResponse) {
        Alamofire.request(statusSummaryForGitHub, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let statusData = response.result.value! as! [String: AnyObject]
                
                if let componentsData = statusData["components"] as? [[String : Any]] {
                    completion(componentsData)
                    print(componentsData[1]["name"]!)
                    print(componentsData[1]["status"]!)
                }
            }
            
            if response.result.isFailure{
                print(response.result.error!)
            }
        }
        
    }
    
    func apiCall() {
        let urlString = statusSummaryForGitHub
        guard let requestUrl = URL(string:urlString) else { return }
        let request = URLRequest(url:requestUrl)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if error == nil,let usableData = data {
                print(usableData) //JSONSerialization
            }
        }
        task.resume()
    }

}
