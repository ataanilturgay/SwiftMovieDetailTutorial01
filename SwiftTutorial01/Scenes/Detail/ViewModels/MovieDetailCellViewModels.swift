//
//  MovieDetailCellViewModels.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import Foundation

public enum MovieDetailCellItemType {
    case image, infos, actions
}

protocol MovieDetailCellItem {
    var rowCount: Int { get }
    var type: MovieDetailCellItemType { get }
}

struct MovieDetailCellImageItem: MovieDetailCellItem {
    var rowCount: Int {
        return 1
    }
    var type: MovieDetailCellItemType {
        return .image
    }
    let imageUrl: String
}

struct MovieDetailCellInfosItem: MovieDetailCellItem {
    var rowCount: Int {
        return 1
    }
    var type: MovieDetailCellItemType {
        return .infos
    }
    let name: String
    let description: String
    let year: String
    let genre: String
    let imdbScore: String
}

struct MoviewDetailCellActionsItem: MovieDetailCellItem {
    var rowCount: Int {
        return 1
    }
    var type: MovieDetailCellItemType {
        return .actions
    }
    let isFavorited: Bool
}
