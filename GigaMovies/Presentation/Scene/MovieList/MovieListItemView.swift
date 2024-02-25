//
//  MovieListItemView.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 23.02.24.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: Movie

    var body: some View {
        HStack {
            Text(String(movie.year))
                .tint(.black)

            Text(movie.title)
                .tint(.black)
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        MovieListItemView(
            movie: Movie(
                id: UUID(),
                title: "The Avengers",
                description: "Superheroes assemble to stop an alien invasion.",
                year: 2012,
                genre: .action
            )
        )
    }
}
