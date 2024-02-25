//
//  MovieDataSource.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Combine

protocol MovieDataSource {
    func getAll() -> AnyPublisher<[MovieDTO], Error>
}
