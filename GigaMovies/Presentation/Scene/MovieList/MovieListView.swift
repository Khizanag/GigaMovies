//
//  MovieListView.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    @EnvironmentObject private var coordinator: Coordinator

    // MARK: - Init
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        contentView
            .onChange(of: viewModel.errorMessage) {
                guard let errorMessage = viewModel.errorMessage else { return }
                coordinator.showError(message: errorMessage)
            }
            .navigationTitle("Movies")
    }

    // MARK: - Components
    private var contentView: some View {
        if viewModel.isLoading {
            AnyView(progressView)
        } else {
            AnyView(movieListView)
        }
    }

    private var progressView: some View {
        ProgressView()
            .controlSize(.extraLarge)
    }

    private var movieListView: some View {
        List(viewModel.movies) { movie in
            Button(
                action: {
                    coordinator.push(page: .details(movie: movie))
                },
                label: {
                    MovieListItemView(movie: movie)
                }
            )
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        MovieListView(viewModel: MovieListViewModel())
    }
}
