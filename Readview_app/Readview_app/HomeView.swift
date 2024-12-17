//
//  HomeView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Sección de libros populares
                    SectionView(title: "Trending this week", books: trendingBooks)
                        .accessibilityElement(children: .contain) // Agrupar todos los elementos de la sección bajo una etiqueta
                        .accessibilityLabel("Trending this week, a selection of popular books.") // Descripción general

                    Spacer().frame(height: 20)

                    // Sección de nuevos lanzamientos
                    SectionView(title: "New releases", books: newReleases)
                        .accessibilityElement(children: .contain) // Agrupar los elementos de la sección
                        .accessibilityLabel("New releases, recently launched books.") // Descripción general
                }
                .padding(.all)
            }
            .navigationTitle("Home")
            .padding(.vertical)
            .toolbar {
                Button(action: {
                    print("Notifications tapped")
                }) {
                    Image(systemName: "bell")
                        .accessibilityLabel("Notifications") // Etiqueta accesible para el botón de notificaciones
                        .accessibilityHint("Tap to view your notifications.") // Sugerencia para indicar la acción
                }
            }
        }
    }

    let trendingBooks = [
        Book(title: "The Marriage Portrait", imageName: "book5", author: "Maggie O'Farrell", synopsis: "A historical novel about a young girl, a Medici bride.", year: "2023"),
        Book(title: "The Vanishing Half", imageName: "book8", author: "Brit Bennett", synopsis: "Twin sisters choose divergent paths that reshape their lives.", year: "2020"),
        Book(title: "Pride and Prejudice", imageName: "book1", author: "Jane Austen", synopsis: "Elizabeth Bennet navigates love and society in Georgian England.", year: "1813"),
        Book(title: "Funny Story", imageName: "book7", author: "Emily Henry", synopsis: "Two polar opposites find themselves living together.", year: "2021"),
        Book(title: "Little Women", imageName: "book2", author: "Louisa May Alcott", synopsis: "The story of four sisters coming of age during the Civil War.", year: "1868"),
        Book(title: "Fourth Wing", imageName: "book4", author: "Rebecca Yarros", synopsis: "A tale of dragons, war, and a magical academy.", year: "2023"),
        Book(title: "The Fellowship of the Ring", imageName: "book3", author: "J.R.R. Tolkien", synopsis: "The first part of the epic journey of the One Ring.", year: "1954"),
        Book(title: "The Midnight Library", imageName: "book6", author: "Matt Haig", synopsis: "A library between life and death where infinite choices await.", year: "2020"),
        Book(title: "The Seven Year Slip", imageName: "book9", author: "Ashley Poston", synopsis: "A magical love story across time.", year: "2023"),
        Book(title: "The Illusion of Simple", imageName: "book10", synopsis: "A thrilling mystery novel uncovering hidden truths.", year: "2024")
    ]

    let newReleases = [
        Book(title: "Just for the Summer", imageName: "book11", author: "Abby Jimenez", synopsis: "Two people agree to a no-strings-attached summer romance to help break a family 'love curse' — but the lines between fun and feelings blur.", year: "2023"),
        Book(title: "First Lie Wins", imageName: "book12", author: "Ashley Elston", synopsis: "An unputdownable thriller following an enigmatic woman living many lives — and keeping deadly secrets.", year: "2023"),
        Book(title: "Intermezzo", imageName: "book14", author: "Elyse Douglas", synopsis: "A heartfelt and lyrical tale of love, loss, and second chances through the interlude of music and life.", year: "2021"),
        Book(title: "The God of the Woods", imageName: "book18", author: "Liz Moore", synopsis: "A mystery surrounding a family estate and dark secrets hidden deep in the woods, mixing suspense and lyrical writing.", year: "2022"),
        Book(title: "The Teacher", imageName: "book13", author: "Freida McFadden", synopsis: "A psychological thriller where the secrets of a teacher’s past threaten to tear apart her carefully built life.", year: "2021"),
        Book(title: "House of Flame and Shadow (Crescent City, #3)", imageName: "book17", author: "Sarah J. Maas", synopsis: "In the epic Crescent City series, Bryce faces her greatest trials as chaos and war loom on the horizon.", year: "2023"),
        Book(title: "The Woman in the Window", imageName: "book16", author: "A. J. Finn", synopsis: "An agoraphobic woman believes she’s witnessed a crime in her neighbor’s house — but nothing is as it seems.", year: "2018"),
        Book(title: "When the Moon Hatched (Moonfall, #1)", imageName: "book19", author: "Sarah A. Parker", synopsis: "An interstellar sci-fi adventure where ancient prophecies, war, and moon magic collide in a dramatic saga.", year: "2022"),
        Book(title: "The Women", imageName: "book15", author: "Kristin Hannah", synopsis: "A gripping and emotional novel about women’s roles during wartime and their struggles for recognition.", year: "2020"),
        Book(title: "All the Colors of the Dark", imageName: "book20", author: "Chris Whitaker", synopsis: "An atmospheric and haunting thriller about a small-town mystery and the secrets that bind its people together.", year: "2022")
    ]
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

