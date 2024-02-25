//
//  DefaultGetMoviesUseCase.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import Combine
import Resolver

struct DefaultGetMoviesUseCase: GetMoviesUseCase {
    @Injected private var repository: MovieRepository

    func execute() -> AnyPublisher<[Movie], Error> {
        repository
            .getAllMovies()
            .map { movies in
                movies.sorted(by: {
                    ($0.year, $0.title) > ($1.year, $1.title)
                })
            }
            .eraseToAnyPublisher()
    }
}
