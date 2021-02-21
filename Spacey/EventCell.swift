//
//  EventCell.swift
//  Spacey
//
//  Created by Carter Borchetta on 2/20/21.
//

import UIKit
import SDWebImage

class EventCell: UITableViewCell {
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(eventName: String, eventType: String, date: String, description: String, imageURL: String) {
        eventNameLabel.text = eventName
        eventTypeLabel.text = eventType
        dateLabel.text = date
        descriptionLabel.text = description
        
        
        
        
        let placeholderImage = UIImage(named: "placeholder")
        let remoteImage = URL(string: imageURL)
        
        eventImageView.sd_setImage(with: remoteImage, placeholderImage: placeholderImage)
        /*
        let placeholderImage = UIImage(named: "placeholder")
        let remoteImageURL = URL(string: imageURL)
        eventImageView.sd_setImage(with: remoteImageURL , placeholderImage: placeholderImage) { downloadedImage, downloadException, cacheType, downloadURL in
            
            if let downloadException = downloadException {
                print("Problem downloading the image \(downloadException.localizedDescription)")
            } else {
                print("Success")
            }
            
        }
 */
    }
    
    
        
    
        
    

}
