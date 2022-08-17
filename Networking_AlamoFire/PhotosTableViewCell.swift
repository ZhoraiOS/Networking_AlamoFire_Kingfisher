//
//  PhotosTableViewCell.swift
//  Networking_AlamoFire
//
//  Created by Zhora Babakhanyan on 8/16/22.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
  
    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photosTitleLabel: UITextView!
    
    var photo: Photo! {
        didSet {
            self.photosTitleLabel.text = self.photo.title
            self.photosImageView.setImage(imageURL: self.photo.url)
        }
    }
}
