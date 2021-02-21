//
//  Launches.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/18/21.
//

import Foundation
import Alamofire
import SwiftyJSON

//var testCache = NSCache<NSString, Launches>()
//let jsonCacheKey = "key"

class Launches {
    var apiURL = "https://ll.thespacedevs.com/2.0.0/launch/?format=json"
    var launchArray: [Launch] = []
    var prevPageNumber = 1
    var upcomingPageNumber = 1
    let pageLimit = 20
    let apiToken = "dd6389a50d2644ed3fde0579bc2148de46692893"
    
    
    
    
    
    func getLaunches(callType: Int, completed: @escaping () -> ()) {
        
        
        switch callType {
        case 0: //Retrive 1 upcoming launch
            // Production URL
             apiURL = "https://ll.thespacedevs.com/2.0.0/launch/upcoming/?limit=1"
            //apiURL = "https://lldv.thespacedevs.com/2.0.0/launch/upcoming/?limit=1"
        case 1: //Retrieve last 20
            apiURL = "https://ll.thespacedevs.com/2.0.0/launch/previous/?limit=\(pageLimit)&offset=\(pageLimit * prevPageNumber)"
            //apiURL = "https://lldv.thespacedevs.com/2.0.0/launch/previous/?limit=\(pageLimit)&offset=\(pageLimit * prevPageNumber)"
            prevPageNumber += 1
        case 2: //Retrive upcoming 20
            apiURL = "https://ll.thespacedevs.com/2.0.0/launch/previous/?limit=\(pageLimit)&offset=\(pageLimit * upcomingPageNumber)"
            //apiURL = "https://lldv.thespacedevs.com/2.0.0/launch/previous/?limit=\(pageLimit)&offset=\(pageLimit * upcomingPageNumber)"
            upcomingPageNumber += 1
        default:
            print("Uh Oh... This should not have happened")
        }
        
        Alamofire.request(apiURL, headers: ["Authorization": apiToken, "Content-Type": "application/json"]).responseJSON { (response) in
            print("*** JSON = \(response)")
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numLaunches = json["results"].count
                print(numLaunches)
                
                
                let next = json["next"].stringValue
                let previous = json["previous"].stringValue
                
                for i in 0..<numLaunches {
                    print(json["results"][i]["program"][0]["image_url"], "****")
                    
                    
                    let name = json["results"][i]["name"].stringValue
                    let statusName = json["results"][i]["status"]["name"].stringValue
                    let expectedLaunchDate = json["results"][i]["net"].stringValue
                    let inhold = json["results"][i]["inhold"].boolValue
                    let holdReason = json["results"][i]["holdreason"].stringValue
                    let failReason = json["results"][i]["failreason"].stringValue
                    let launchProviderID = json["results"][i]["launch_service_provider"]["id"].intValue
                    let launchProviderName = json["results"][i]["launch_service_provider"]["name"].stringValue
                    let launchProviderLink = json["results"][i]["launch_service_provider"]["url"].stringValue
                    let rocketID = json["results"][i]["rocket"]["id"].intValue
                    let rocketName = json["results"][i]["rocket"]["configuration"]["name"].stringValue
                    let rocketURL = json["results"][i]["rocket"]["configuration"]["url"].stringValue
                    let missionName = json["results"][i]["mission"]["name"].stringValue
                    let missionDescription = json["results"][i]["mission"]["description"].stringValue
                    let missionType = json["results"][i]["mission"]["type"].stringValue
                    let orbitName = json["results"][i]["mission"]["orbit"]["name"].stringValue
                    let orbitAbbrev = json["results"][i]["mission"]["orbit"]["abbrev"].stringValue
                    let padName = json["results"][i]["pad"]["name"].stringValue
                    let padLink = json["results"][i]["pad"]["url"].stringValue
                    let padLatitude = json["results"][i]["pad"]["latitdue"].floatValue
                    let padLongitude = json["results"][i]["pad"]["longitude"].floatValue
                    let padLocationName = json["results"][i]["pad"]["location"]["name"].stringValue
                    
                    // CAUTION: Program stores things in an array suggesting there can be multiple program or perhaps NONE. For now I'm grabbing the [0] element and hoping there is one. This may not be true and could cause problems
                    let programName = json["results"][i]["program"][0]["name"].stringValue
                    let programDescription = json["results"][i]["program"][0]["description"].stringValue
                    let programImageURL = json["results"][i]["program"][0]["image_url"].stringValue
                    
                    
                    //print(programName, "%%%")
                    

                    
                    self.launchArray.append(Launch(next: next, previous: previous, name: name, statusName: statusName, expectedLaunchDate: expectedLaunchDate, inhold: inhold, holdReason: holdReason, failReason: failReason, launchProviderID: launchProviderID, launchProviderName: launchProviderName, launchProviderLink: launchProviderLink, rocketID: rocketID, rocketName: rocketName, rocketURL: rocketURL, missionName: missionName, missionDescription: missionDescription, missionType: missionType, orbitName: orbitName, orbitAbbrev: orbitAbbrev, padName: padName, padLink: padLink, padLatitude: padLatitude, padLongitude: padLongitude, padLocationName: padLocationName, programName: programName, programDescription: programDescription, programImageURL: programImageURL))

                }

            case.failure(let error):
                print("Error: failed to get data from url \(self.apiURL), error: \(error.localizedDescription)")
            }
            completed()
        }
        
    }
}
