//
//  main.swift
//  wmii-floyd-warshall
//
//  Created by Adrian Celczyński on 21/03/2020.
//

import Foundation

let infinity = 10000
let citiesNames = ["Poznan   ", "Wrocław  ", "Bydgoszcz", "Łódź     ", "Warszawa ", "Kraków   ", "Katowice "]
let numberOfCities = citiesNames.count

var computedDistances: [[Int]] = Array(repeating: Array(repeating: 0, count: numberOfCities), count: numberOfCities)

let citiesDistances: [[Int]] = [
    [0, 180, 140, 220, infinity, infinity, infinity],
    [180, 0, infinity, 220, infinity, infinity, 200],
    [140, infinity, 0, 220, 300, infinity, infinity],
    [220, 220, 220, infinity, 140, 0, 290, infinity],
    [infinity, infinity, 300, 140, 0, 290, infinity],
    [infinity, infinity, infinity, infinity, 290, 0, 80],
    [infinity, 200, infinity, 200, infinity, 80, 0],
]

for i in 0..<numberOfCities {
    for j in 0..<numberOfCities {
        computedDistances[i][j] = citiesDistances[i][j]
    }
}

for k in 0..<numberOfCities {
    for i in 0..<numberOfCities {
        for j in 0..<numberOfCities {
            if(computedDistances[i][k] + computedDistances[k][j] < computedDistances[i][j]){
                computedDistances[i][j] = computedDistances[i][k] + computedDistances[k][j]
            }
        }
    }
}

func printResults() -> Void {
    print("RESULTS")
    
    for i in 0..<numberOfCities {
        print(citiesNames[i], terminator: " ")
        for j in 0..<numberOfCities {
            print(computedDistances[i][j], terminator: " ")
        }
        print()
    }
}

printResults()
