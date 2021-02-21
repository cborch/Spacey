//
//  Events.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/19/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class Events {
    var apiURL = "https://ll.thespacedevs.com/2.0.0/event/?format=json"
    var eventArray: [Event] = []
    var prevPageNumber = 1
    var upcomingPageNumber = 1
    let pageLimit = 20
    let apiToken = "dd6389a50d2644ed3fde0579bc2148de46692893"
    
    
    func getEvents(callType: Int, completed: @escaping () -> ()) {
        
        switch callType {
        case 0: //Retrive 1 upcoming launch
            apiURL = "https://ll.thespacedevs.com/2.0.0/event/upcoming/?limit=1"
        case 1: //Retrieve last 20
            apiURL = "https://ll.thespacedevs.com/2.0.0/event/previous/?limit=\(pageLimit)&offset=\(pageLimit * prevPageNumber)"
            prevPageNumber += 1
        case 2: //Retrive upcoming 20
            apiURL = "https://ll.thespacedevs.com/2.0.0/event/previous/?limit=\(pageLimit)&offset=\(pageLimit * upcomingPageNumber)"
            upcomingPageNumber += 1
        default:
            print("Uh Oh... This should not have happened")
        }
        
        Alamofire.request(apiURL, headers: ["Authorization": apiToken, "Content-Type": "application/json"]).responseJSON { (response) in
            //print("*** JSON = \(response)")
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numEvents = json["results"].count
                print(numEvents)
                
                
                
                let next = json["next"].stringValue
                let previous = json["previous"].stringValue
                
                for i in 0..<numEvents {
                    print(json[i])
                    
                    
                    
                    let eventName = json["results"][i]["name"].stringValue
                    let eventType = json["results"][i]["type"]["name"].stringValue
                    let eventLocation = json["results"][i]["location"].stringValue
                    let eventNewsURL = json["results"][i]["new_url"].stringValue
                    let eventVideoURL = json["results"][i]["video_url"].stringValue
                    let eventImageURL = json["results"][i]["feature_image"].stringValue
                    let date = json["results"][i]["date"].stringValue
                    let description = json["results"][i]["description"].stringValue
                    
                    

                    
                    self.eventArray.append(Event(next: next, previous: previous, eventName: eventName, eventType: eventType, eventLocation: eventLocation, eventNewsURL: eventNewsURL, eventVideoURL: eventVideoURL, eventImageURL: eventImageURL, date: date, description: description))

                }

            case.failure(let error):
                print("Error: failed to get data from url \(self.apiURL), error: \(error.localizedDescription)")
            }
            completed()
        }
        
    }
}
