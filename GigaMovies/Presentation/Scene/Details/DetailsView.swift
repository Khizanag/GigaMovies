//
//  DetailsView.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject private var coordinator: Coordinator

    private let title: String
    private let details: [Detail]

    // MARK: - Init
    init(movie: Movie) {
        title = movie.title

        details = [
            Detail(key: "Title", value: movie.title),
            Detail(key: "Description", value: movie.description),
            Detail(key: "Genre", value: movie.genre.rawValue),
            Detail(key: "Year", value: String(movie.year)),
            // Detail(key: "ID", value: movie.id.uuidString), // Hidden by default
        ]
    }

    // MARK: - Body
    var body: some View {
        List {
            ForEach(details, id: \.key) { detail in
                DetailView(detail: detail)
            }
        }
        .navigationTitle(title)
    }
}

// MARK: - Preview
#Preview {
    DetailsView(
        movie: Movie(
            id: UUID(),
            title: "Movie Title",
            description: "Movie description a little bit longer than the name",
            year: 1999,
            genre: .adventure
        )
    )
}
