//
//  ContentView.swift
//  GraphQLPrac
//
//  Created by Kim Insub on 2022/09/04.
//

import SwiftUI
import Apollo

struct ContentView: View {

    @State private var movies: [GetAllMoviesQuery.Data.AllFilm.Film] = []

    var body: some View {

        NavigationView {
            VStack {
                List(movies, id: \.title) { movie in
                    Text(movie.title ?? "")
                }
            }
            .navigationTitle("Starwars Movies")
            .onAppear {
                Network.shared.apollo.fetch(query: GetAllMoviesQuery()) {
                    result in
                    switch result {
                    case .success(let graphQLResult):

                        DispatchQueue.main.async {
                            if let movies = graphQLResult.data?.allFilms?.films {
                                self.movies = movies.map({ movie in
                                    movie!
                                })
                            }
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
