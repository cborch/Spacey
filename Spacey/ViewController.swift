//
//  ViewController.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    var launches = Launches()
    var events = Events()
    
    @IBOutlet weak var launchTableView: UITableView!
    @IBOutlet weak var eventTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        launchTableView.delegate = self
        launchTableView.dataSource = self
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        launches.getLaunches(callType: 1) {
            print("Done")
            print(self.launches.launchArray[0].name, "array element")
            self.launchTableView.reloadData()
        }
        
        events.getEvents(callType: 1) {
            self.eventTableView.reloadData()
       }
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == launchTableView {
            return launches.launchArray.count
        } else {
            return events.eventArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == launchTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCell", for: indexPath) as! LaunchCell
            cell.setCell(missionName: "\(launches.launchArray[indexPath.row].missionName)", providerAndVehicle: "\(launches.launchArray[indexPath.row].launchProviderName)", status: "\(launches.launchArray[indexPath.row].statusName)", date: "\(launches.launchArray[indexPath.row].expectedLaunchDate)", launchSite: "\(launches.launchArray[indexPath.row].padName)", landingSite: "Landing Data Pending", vehicleName: "\(launches.launchArray[indexPath.row].rocketName)", programImageURL: "\(launches.launchArray[indexPath.row].programImageURL)")
            
            
            // CAUTION: I'm not certain that "" is what the next value will be if there are no further results. Additionally, the launches object should really have the next property not each individual launch object inside the launches array property. Additionally, The call type here is 1 to get previous results. This will have to change based on whether we are going for 1 upcoming, previous, or multiple upcoming
            if indexPath.row == launches.launchArray.count - 2 && launches.launchArray[indexPath.row].next != "" {
                launches.getLaunches(callType: 1) {
                    self.launchTableView.reloadData()
                }
            }
            
            // CUATION: This does not seem to be working
            cell.configrueUIViews()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
            cell.setCell(eventName: "\(events.eventArray[indexPath.row].eventName)", eventType: "\(events.eventArray[indexPath.row].eventType)", date: "\(events.eventArray[indexPath.row].date)", description: "\(events.eventArray[indexPath.row].description)", imageURL: "\(events.eventArray[indexPath.row].eventImageURL)")
            
            // CAUTION: I'm not certain that "" is what the next value will be if there are no further results. Additionally, the events object should really have the next property not each individual event object inside the events array property. Additionally, The call type here is 1 to get previous results. This will have to change based on whether we are going for 1 upcoming, previous, or multiple upcoming
            if indexPath.row == events.eventArray.count - 2 && events.eventArray[0].next != "" {
                events.getEvents(callType: 1) {
                    self.eventTableView.reloadData()
                }
            }
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
