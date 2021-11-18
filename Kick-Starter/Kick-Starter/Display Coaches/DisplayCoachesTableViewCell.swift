//
//  DisplayCoachesTableViewCell.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/11/16.
//

import UIKit

class DisplayCoachesTableViewCell: UITableViewCell {

    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var coachPhotoImageView: UIImageView!
    @IBOutlet weak var coachNationalityLabel: UILabel!
    @IBOutlet weak var coachAgeLabel: UILabel!
    @IBOutlet weak var imageStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCellStyling()
    }
    
    private func applyCellStyling() {
        backgroundColor = .clearBackgroundColor
        selectionStyle = .none
        
        imageStackView.applyStackViewStyling()
        coachPhotoImageView.applyImageStyling()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(coach: Coach?) {
        coachNameLabel.text = "\(coach?.firstname ?? "") \(coach?.lastname ?? "")"
        coachPhotoImageView.loadImage(urlString: coach?.photo ?? "")
        coachNationalityLabel.text = "Nationality: \(coach?.nationality ?? "")"
        coachAgeLabel.text = "Age: " + String(coach?.age ?? 0)
    }
}