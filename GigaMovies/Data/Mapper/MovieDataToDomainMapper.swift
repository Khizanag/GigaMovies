//
//  MovieDataToDomainMapper.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

struct MovieDataToDomainMapper: DataToDomainMapper {
    typealias DataModel = MovieDTO
    typealias DomainModel = Movie

    func map(_ dataModel: MovieDTO) -> Movie {
        Movie(
            id: dataModel.id,
            title: dataModel.title,
            description: dataModel.description,
            // Might avoid force unwrapping and use different approach,
            // but in this case we can consider we are sure we have appropriate data
            year: Int(dataModel.year)!,
            genre: Movie.Genre(rawValue: dataModel.genre)!
        )
    }
}
