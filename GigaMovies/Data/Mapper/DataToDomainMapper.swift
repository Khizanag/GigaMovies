//
//  DataToDomainMapper.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

protocol DataToDomainMapper {
    associatedtype DataModel
    associatedtype DomainModel

    func map(_ dataModel: DataModel) -> DomainModel
}
