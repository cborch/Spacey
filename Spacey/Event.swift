//
//  Event.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/18/21.
//

import Foundation

class Event {
    
    var next: String
    var previous: String
    
    var eventName: String
    var eventType: String
    var eventLocation: String
    var eventNewsURL: String
    var eventVideoURL: String
    var eventImageURL: String
    var date: String
    var description: String
    
    
    init(next: String, previous: String, eventName: String, eventType: String, eventLocation: String, eventNewsURL: String, eventVideoURL: String, eventImageURL: String, date: String, description: String) {
        self.next = next
        self.previous = previous
        
        self.eventName = eventName
        self.eventType = eventType
        self.eventLocation = eventLocation
        self.eventNewsURL = eventNewsURL
        self.eventVideoURL = eventVideoURL
        self.eventImageURL = eventImageURL
        self.date = date
        self.description = description
    }
    
}
