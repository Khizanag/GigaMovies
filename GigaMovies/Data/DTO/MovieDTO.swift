//
//  MovieDTO.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Foundation

struct MovieDTO: Decodable {
    let id: UUID
    let title: String
    let year: String
    let genre: String
    let description: String
}
