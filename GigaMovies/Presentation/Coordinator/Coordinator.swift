//
//  Coordinator.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 24.02.24.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    // MARK: - Error
    var errorMessage: String = ""
    @State var isErrorAlertPresented = false

    private lazy var movieListViewModel = MovieListViewModel()

    // MARK: - Build
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .list:
            MovieListView(viewModel: movieListViewModel)
        case .details(let movie):
            DetailsView(movie: movie)
        }
    }

    func push(page: Page) {
        path.append(page)
    }

    // MARK: - ShowError
    func showError(message: String) {
        errorMessage = message
        isErrorAlertPresented = true
    }
}
