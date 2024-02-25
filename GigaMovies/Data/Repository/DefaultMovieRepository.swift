//
//  DefaultMovieRepository.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Resolver
import Combine

struct DefaultMovieRepository: MovieRepository {
    @Injected private var dataSource: MovieDataSource

    func getAllMovies() -> AnyPublisher<[Movie], Error> {
        let mapper = MovieDataToDomainMapper()

        return dataSource.getAll()
            .map { $0.map(mapper.map(_:)) }
            .eraseToAnyPublisher()
    }
}
