//
//  MovieListViewModel.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import Foundation
import Resolver
import Combine

final class MovieListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Injected private var getMoviesUseCase: GetMoviesUseCase

    private var subscriptions: [AnyCancellable] = []

    // MARK: - Init
    init() {
        fetchMovies()
    }
}

// MARK: - Private
private extension MovieListViewModel {
    func fetchMovies() {
        isLoading = true

        getMoviesUseCase.execute()
            .sink(
                receiveCompletion: { [weak self] result in
                    guard case .failure(let error) = result else { return }
                    self?.isLoading = false
                    self?.errorMessage = error.localizedDescription
                },
                receiveValue: { [weak self] movies in
                    self?.movies = movies
                    self?.isLoading = false
                }
            )
            .store(in: &subscriptions)
    }
}
