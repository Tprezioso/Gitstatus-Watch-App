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
            if response.result.isFailure{
                print(response.result.error!)
            }
        }
    }

    // TODO: - Need to work out how to get data from request below
    
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

    func maintenancesStatus(completion: @escaping WebServiceResponse) {
        Alamofire.request(upcomingScheduledMaintenancesURL, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let statusData = response.result.value! as! [String: AnyObject]
                if let componentsData = statusData["components"] as? [[String : Any]] {
                    completion(componentsData)
                }
            }
            if response.result.isFailure{
                print(response.result.error!)
            }
        }
    }

}
