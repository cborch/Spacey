//
//  LaunchCell.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/20/21.
//

import UIKit
import SDWebImage

class LaunchCell: UITableViewCell {

    @IBOutlet weak var backgroundBoxView: UIView!
    @IBOutlet weak var providerAndVehicleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateImageView: UIImageView!
    @IBOutlet weak var launchSiteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var launchSiteImageView: UIImageView!
    @IBOutlet weak var landingSiteLabel: UILabel!
    @IBOutlet weak var landingSiteImageView: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var vehicleNameLabel: UILabel!
    @IBOutlet weak var programImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(missionName: String, providerAndVehicle: String, status: String, date: String, launchSite: String, landingSite: String, vehicleName: String, programImageURL: String) {
        missionNameLabel.text = missionName
        providerAndVehicleLabel.text = providerAndVehicle
        statusLabel.text = status
        dateLabel.text = date
        launchSiteLabel.text = launchSite
        landingSiteLabel.text = landingSite
        vehicleNameLabel.text = vehicleName
        print("configured cell")
        
        let placeholderImage = UIImage(named: "placeholder")
        let remoteImage = URL(string: programImageURL)
        
        programImageView.sd_setImage(with: remoteImage, placeholderImage: placeholderImage)
        
    }
    
    
    func configrueUIViews() {
        backgroundBoxView.layer.cornerRadius = 10
        statusLabel.layer.cornerRadius = 10
    }

}
