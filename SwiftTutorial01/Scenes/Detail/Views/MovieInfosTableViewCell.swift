//
//  MovieInfosTableViewCell.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import UIKit

class MovieInfosTableViewCell: UITableViewCell {
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieInfosLabel: UILabel!
    @IBOutlet private weak var movieDescLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0.114, green: 0.157, blue: 0.259, alpha: 1)
    }
    
    func configure(with model: MovieDetailCellItem?) {
        guard let movieItem = model as? MovieDetailCellInfosItem else { return }
        movieNameLabel.text = movieItem.name
        movieInfosLabel.text = "\(movieItem.year) - \(movieItem.imdbScore) - \(movieItem.genre)"
        movieDescLabel.text = movieItem.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
