//
//  Launch.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/18/21.
//

import Foundation


class Launch {
    var next: String
    var previous: String
    
    var name: String
    var statusName: String
    
    // Known as net in API. Also have access to window start and end time and whether the time and date is tbd
    // Date includes date and time in string form
    var expectedLaunchDate: String
    var inhold: Bool
    var holdReason: String
    var failReason: String
    
    var launchProviderID: Int
    var launchProviderName: String
    var launchProviderLink: String
    
    var rocketID: Int
    var rocketName: String
    var rocketURL: String
    
    var missionName: String
    var missionDescription: String
    var missionType: String
    var orbitName: String
    var orbitAbbrev: String
    
    var padName: String
    var padLink: String
    var padLatitude: Float
    var padLongitude: Float
    var padLocationName: String
    
    var programName: String
    var programDescription: String
    var programImageURL: String
    
    init(next: String, previous: String, name: String, statusName: String, expectedLaunchDate: String, inhold: Bool, holdReason: String, failReason: String, launchProviderID: Int, launchProviderName: String, launchProviderLink: String, rocketID: Int, rocketName: String, rocketURL: String, missionName: String, missionDescription: String, missionType: String, orbitName: String, orbitAbbrev: String, padName: String, padLink: String, padLatitude: Float, padLongitude: Float, padLocationName: String, programName: String, programDescription: String, programImageURL: String) {
        
        self.next = next
        self.previous = previous
        self.name = name
        self.statusName = statusName
        self.expectedLaunchDate = expectedLaunchDate
        self.inhold = inhold
        self.holdReason = holdReason
        self.failReason = failReason
        self.launchProviderID = launchProviderID
        self.launchProviderName = launchProviderName
        self.launchProviderLink = launchProviderLink
        self.rocketID = rocketID
        self.rocketName = rocketName
        self.rocketURL = rocketURL
        self.missionName = missionName
        self.missionDescription = missionDescription
        self.missionType = missionType
        self.orbitName = orbitName
        self.orbitAbbrev = orbitAbbrev
        self.padName = padName
        self.padLink = padLink
        self.padLatitude = padLatitude
        self.padLongitude = padLongitude
        self.padLocationName = padLocationName
        self.programName = programName
        self.programDescription = programDescription
        self.programImageURL = programImageURL
    }
}
