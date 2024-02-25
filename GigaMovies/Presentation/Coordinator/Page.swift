//
//  Page.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 24.02.24.
//

enum Page: Hashable {
    case list
    case details(movie: Movie)
}
