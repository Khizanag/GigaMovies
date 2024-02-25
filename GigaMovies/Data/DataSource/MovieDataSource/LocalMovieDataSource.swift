//
//  LocalMovieDataSource.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 22.02.24.
//

import Combine
import Foundation
import Resolver

struct LocalMovieDataSource: MovieDataSource {
    private let data: [MovieDTO] = [
        MovieDTO(id: UUID(), title: "The Avengers", year: "2012", genre: "Action", description: "Superheroes assemble to stop an alien invasion."),
        MovieDTO(id: UUID(), title: "The Lord of the Rings: The Return of the King", year: "2003", genre: "Fantasy", description: "The epic conclusion to Frodo's quest to destroy the One Ring."),
        MovieDTO(id: UUID(), title: "The Shawshank Redemption", year: "1994", genre: "Drama", description: "A man wrongly imprisoned finds hope and resilience."),
        MovieDTO(id: UUID(), title: "Back to the Future", year: "1985", genre: "Science Fiction", description: "A teenager travels back in time and accidentally disrupts his parents' meeting."),
        MovieDTO(id: UUID(), title: "The Godfather", year: "1972", genre: "Drama", description: "A sprawling crime saga about a powerful mafia family."),
        MovieDTO(id: UUID(), title: "The Dark Knight", year: "2008", genre: "Action", description: "Batman faces his greatest challenge yet: the Joker."),
        MovieDTO(id: UUID(), title: "Pulp Fiction", year: "1994", genre: "Drama", description: "Intertwining stories of hitmen, criminals, and a boxer in LA."),
        MovieDTO(id: UUID(), title: "Inception", year: "2010", genre: "Science Fiction", description: "A thief who steals ideas through dream-sharing takes on a dangerous mission."),
        MovieDTO(id: UUID(), title: "Forrest Gump", year: "1994", genre: "Drama", description:  "A slow-witted but kind man leads an extraordinary life."),
        MovieDTO(id: UUID(), title: "The Matrix", year: "1999", genre: "Science Fiction", description: "A computer hacker learns the true nature of reality."),
        MovieDTO(id: UUID(), title: "The Silence of the Lambs", year: "1991", genre: "Thriller", description: "An FBI trainee seeks help from Hannibal Lecter to catch a serial killer."),
        MovieDTO(id: UUID(), title: "Spirited Away", year: "2001", genre: "Fantasy", description: "A young girl enters the spirit world and must save her parents."),
        MovieDTO(id: UUID(), title: "Parasite", year: "2019", genre: "Thriller", description: "A poor family schemes to infiltrate a wealthy household."),
        MovieDTO(id: UUID(), title: "Interstellar", year: "2014", genre: "Science Fiction", description: "Astronauts travel through a wormhole to save humanity."),
        MovieDTO(id: UUID(), title: "Gladiator", year: "2000", genre: "Action", description: "A Roman general seeks revenge against the emperor who murdered his family."),
        MovieDTO(id: UUID(), title: "Saving Private Ryan", year: "1998", genre: "Drama", description: "Soldiers embark on a dangerous mission to rescue one man during WWII."),
        MovieDTO(id: UUID(), title: "Good Will Hunting", year: "1997", genre: "Drama", description: "A troubled math genius seeks help from a therapist."),
        MovieDTO(id: UUID(), title: "The Princess Bride", year: "1987", genre: "Fantasy", description: "A classic fairy tale with sword fights, giants, and true love."),
        MovieDTO(id: UUID(), title: "The Shining", year: "1980", genre: "Horror", description: "A family heads to an isolated hotel for the winter where a sinister presence lurks."),
        MovieDTO(id: UUID(), title: "Alien", year: "1979", genre: "Science Fiction", description: "The crew of a spaceship encounters a deadly alien creature."),
        MovieDTO(id: UUID(), title: "Jurassic Park", year: "1993", genre: "Science Fiction", description: "Dinosaurs are brought back to life in a disastrous theme park."),
        MovieDTO(id: UUID(), title: "Raiders of the Lost Ark", year: "1981", genre: "Adventure", description: "Archaeologist Indiana Jones races to find the Ark of the Covenant before the Nazis."),
        MovieDTO(id: UUID(), title: "The Lion King", year: "1994", genre: "Fantasy", description: "A young lion prince must reclaim his throne."),
        MovieDTO(id: UUID(), title: "Toy Story", year: "1995", genre: "Fantasy", description: "Toys come to life when humans aren't around."),
        MovieDTO(id: UUID(), title: "Wall-E", year: "2008", genre: "Science Fiction", description: "A lonely robot on a future, abandoned Earth discovers love."),
        MovieDTO(id: UUID(), title: "E.T. the Extra-Terrestrial", year: "1982", genre: "Science Fiction", description: "A boy befriends an alien stranded on Earth."),
        MovieDTO(id: UUID(), title: "The Breakfast Club", year: "1985", genre: "Comedy", description: "Five high school students from different cliques spend a day in detention together."),
        MovieDTO(id: UUID(), title: "Ferris Bueller's Day Off", year: "1986", genre: "Comedy", description: "A high school slacker pulls off the ultimate day off."),
        MovieDTO(id: UUID(), title: "Groundhog Day", year: "1993", genre: "Comedy", description: "A weatherman relives the same day over and over."),
        MovieDTO(id: UUID(), title: "Ghostbusters", year: "1984", genre: "Comedy", description: "Paranormal investigators take on spooky cases in New York City."),
        MovieDTO(id: UUID(), title: "The Terminator", year: "1984", genre: "Science Fiction", description: "A cyborg assassin is sent back in time to kill a woman."),
        MovieDTO(id: UUID(), title: "Die Hard", year: "1988", genre: "Action", description: "An off-duty cop fights terrorists on Christmas Eve."),
        MovieDTO(id: UUID(), title: "Star Wars: Episode IV - A New Hope", year: "1977", genre: "Science Fiction", description: "Luke Skywalker joins forces with rebels to destroy the Death Star."),
        MovieDTO(id: UUID(), title: "Psycho", year: "1960", genre: "Horror", description: "A woman on the run checks into the Bates Motel."),
        MovieDTO(id: UUID(), title: "12 Angry Men", year: "1957", genre: "Drama", description: "A jury deliberates the fate of a man accused of murder."),
        MovieDTO(id: UUID(), title: "Casablanca", year: "1942", genre: "Romance", description: "A man torn between love and helping a woman escape the Nazis."),
        MovieDTO(id: UUID(), title: "Singin' in the Rain", year: "1952", genre: "Romance", description: "A silent film star transitions to the world of talkies."),
        MovieDTO(id: UUID(), title: "The Wizard of Oz", year: "1939", genre: "Fantasy", description: "Dorothy and her dog Toto are swept away to the magical Land of Oz."),
        MovieDTO(id: UUID(), title: "Citizen Kane", year: "1941", genre: "Drama", description: "The life and death of a publishing magnate."),
        MovieDTO(id: UUID(), title: "Rear Window", year: "1954", genre: "Mystery", description: "A wheelchair-bound photographer suspects his neighbour of murder."),
        MovieDTO(id: UUID(), title: "Vertigo", year: "1958", genre: "Thriller", description: "A retired detective with a fear of heights trails a mysterious woman."),
    ]

    func getAll() -> AnyPublisher<[MovieDTO], Error> {
        Just(data)
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
