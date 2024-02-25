# GigaMovies
Example SwiftUI project about movies.

## List
- on this page, there is a single list of the movies, which shows the `year` and `title` of the movie.
- We have a loader initially, that makes a simulation of a Remote service call.
- After tapping on each movie there is a `push` navigation to the details page


## Details
- We simply display all details inside the `List`
- If the user presses on any of the details, there is the possibility of coping the content

---

#### Navigation:
The project uses a Coordinator pattern for the navigation.
There are `Coordinator` and `CoordinatorView` that take all responsibilities for navigation

#### Architectural Design Pattern
The project uses a standard clean architecture approach, with three domains: `Data`, `Domain` and `Presentation`.
Each layer encapsulates appropriate data and is responsible for appropriate stuff.
For Dependency Injection out of the View, the project uses 3rd party library: `Resolver`.
