//
//  MovieDetailViewModel.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import Foundation

final class MovieDetailViewModel {
    var setDataDone = { () -> Void in }
    
    var movieItems = [MovieDetailCellItem]()
    
    private var movie: Movie?
    init(movie: Movie?) {
        self.movie = movie
    }
    
    func setData() {
        guard let movie = self.movie else { return }
        
        movieItems.removeAll()
        
        let movieImageItem = MovieDetailCellImageItem(imageUrl: movie.imageUrl)
        movieItems.append(movieImageItem)
        
        let movieInfosItem = MovieDetailCellInfosItem(name: movie.name,
                                                      description: movie.description,
                                                      year: movie.year,
                                                      genre: movie.genre,
                                                      imdbScore: movie.imdbScore)
        movieItems.append(movieInfosItem)
        
        let movieActionsItem = MoviewDetailCellActionsItem(isFavorited: movie.isFavorited)
        movieItems.append(movieActionsItem)
        
        self.setDataDone()
    }
}
