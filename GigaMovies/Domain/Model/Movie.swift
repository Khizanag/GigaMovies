//
//  Movie.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Foundation

// MARK: - Movie
struct Movie: Identifiable, Hashable, Equatable {
    let id: UUID
    let title: String
    let description: String
    let year: Int
    let genre: Genre
}

// MARK: - Genre
extension Movie {
    enum Genre: String, CaseIterable {
        case action = "Action"
        case adventure = "Adventure"
        case comedy = "Comedy"
        case drama = "Drama"
        case horror = "Horror"
        case mystery = "Mystery"
        case romance = "Romance"
        case sciFi = "Science Fiction"
        case thriller = "Thriller"
        case fantasy = "Fantasy"
    }
}
