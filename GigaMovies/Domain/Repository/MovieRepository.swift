//
//  Repository.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Combine

protocol MovieRepository {
    func getAllMovies() -> AnyPublisher<[Movie], Error>
}
