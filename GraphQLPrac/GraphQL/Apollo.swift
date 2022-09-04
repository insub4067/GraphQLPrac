//
//  Apollo.swift
//  GraphQLPrac
//
//  Created by Kim Insub on 2022/09/04.
//

import Foundation
import Apollo

class Network {

    static let shared = Network()

    private init()  {

    }

    lazy var apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}
