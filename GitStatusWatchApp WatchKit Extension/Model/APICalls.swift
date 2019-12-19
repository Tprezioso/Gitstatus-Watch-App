//
//  APICalls.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/7/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import Foundation
import Alamofire

class APICALL: ObservableObject {
    let statusSummaryURL = "https://kctbh9vrtdwd.statuspage.io/api/v2/summary.json"
    let incidentURL = "https://kctbh9vrtdwd.statuspage.io/api/v2/incidents.json"
    let upcomingScheduledMaintenancesURL = "https://kctbh9vrtdwd.statuspage.io/api/v2/scheduled-maintenances/upcoming.json"
    
    typealias WebServiceResponse = ([[String: Any]]?) -> Void
    
    func summaryStatus(completion: @escaping WebServiceResponse) {
        Alamofire.request(statusSummaryURL, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let statusData = response.result.value! as! [String: AnyObject]
                if let componentsData = statusData["components"] as? [[String : Any]] {
                    completion(componentsData)
                }
            }
            if response.result.isFailure {
                completion([["error":response.result.error!.localizedDescription]] as [[String: Any]])
                print(response.result.error!.localizedDescription)
            }
        }
    }
    
    func lastIncident(completion: @escaping WebServiceResponse) {
        Alamofire.request(incidentURL, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let incidentData = response.result.value! as! [String: AnyObject]
                if let componentsData = incidentData["incidents"] as? [[String : Any]] {
                    completion(componentsData)
                }
            }
            if response.result.isFailure{
                print(response.result.error!)
            }
        }
    }
    
    func upcomingMaintenancesStatus(completion: @escaping WebServiceResponse) {
        Alamofire.request(upcomingScheduledMaintenancesURL, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let maintaenancesData = response.result.value! as! [String: AnyObject]
                if let componentsData = maintaenancesData["scheduled_maintenances"] as? [[String : Any]] {
                    completion(componentsData)
                    print(componentsData)
                }
            }
            if response.result.isFailure{
                print(response.result.error!)
            }
        }
    }
    
}
