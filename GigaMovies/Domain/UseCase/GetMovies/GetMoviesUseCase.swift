//
//  GetMoviesUseCase.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import Combine

protocol GetMoviesUseCase {
    func execute() -> AnyPublisher<[Movie], Error>
}
