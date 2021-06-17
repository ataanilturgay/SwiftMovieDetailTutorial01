//
//  MovieImageTableViewCell.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import UIKit

class MovieImageTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0.114, green: 0.157, blue: 0.259, alpha: 1)
    }
    
    func configure(with model: MovieDetailCellItem?) {
        guard let movieItem = model as? MovieDetailCellImageItem else { return }
        movieImageView.image = UIImage(named: movieItem.imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
