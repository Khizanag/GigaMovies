//
//  Resolver+Injection.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 25.02.24.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { DefaultGetMoviesUseCase() as GetMoviesUseCase }
        register { DefaultMovieRepository() as MovieRepository }
        register { LocalMovieDataSource() as MovieDataSource }
    }
}
