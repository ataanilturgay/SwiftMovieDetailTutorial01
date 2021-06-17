//
//  MovieActionsTableViewCell.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import UIKit

class MovieActionsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var downloadButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0.114, green: 0.157, blue: 0.259, alpha: 1)
        applyStyling()
    }
    
    private func applyStyling() {
        playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        shareButton.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        downloadButton.setImage(#imageLiteral(resourceName: "download"), for: .normal)
        favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
