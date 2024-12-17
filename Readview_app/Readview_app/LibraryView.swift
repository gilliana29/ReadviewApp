//
//  BookshelfView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Sección de lectura actual
                        SectionView(title: "Reading", books: readingBooks)
                            .accessibilityElement(children: .contain) // Agrupar todos los elementos de la sección bajo una etiqueta
                            .accessibilityLabel("Currently reading, books that are in progress.") // Descripción general de la sección

                        Spacer().frame(height: 20)

                        // Sección de libros por leer
                        SectionView(title: "Want to read", books: wantToRead)
                            .accessibilityElement(children: .contain)
                            .accessibilityLabel("Books on wish list, books that are yet to be read.") // Descripción general

                        Spacer().frame(height: 20)
                        
                        // Sección de libros terminados
                        SectionView(title: "Finished", books: finished)
                            .accessibilityElement(children: .contain)
                            .accessibilityLabel("Finished books, books that have been completed.") // Descripción general
                    }
                    .padding(.all)
                }
                .navigationTitle("Library")
                .padding(.vertical)
                .toolbar {
                    Button(action: {
                        print("Plus tapped")
                    }) {
                        Image(systemName: "plus")
                            .accessibilityLabel("Add new book") // Etiqueta accesible para el botón de agregar libro
                            .accessibilityHint("Tap to add a new book to your library.") // Sugerencia para el botón
                    }
                }
            }
        }
    }
    
    let readingBooks = [
        Book(title: "Normal People", imageName: "reading1", author: "Sally Rooney", synopsis: "A tender story of connection and love as two young people navigate their complex relationship from school to adulthood.", year: "2018"),
        Book(title: "The Bell Jar", imageName: "reading2", author: "Sylvia Plath", synopsis: "A semi-autobiographical novel about a young woman's descent into mental illness as she struggles with societal expectations.", year: "1963"),
        Book(title: "The Perks of Being a Wallflower", imageName: "reading3", author: "Stephen Chbosky", synopsis: "An introspective coming-of-age tale about friendship, love, and finding oneself while confronting deep personal challenges.", year: "1999")
    ]

    let wantToRead = [
        Book(title: "The Secret Life of Dorothy Soames", imageName: "wtr1", author: "Justine Cowan", synopsis: "A gripping memoir uncovering the shocking truth behind a mother’s troubled past and the notorious Foundling Hospital in London.", year: "2020"),
        Book(title: "The Seven Husbands of Evelyn Hugo", imageName: "wtr2", author: "Taylor Jenkins Reid", synopsis: "The glamorous and scandalous life of Hollywood icon Evelyn Hugo is revealed, from her rise to fame to her seven marriages and ultimate love story.", year: "2017"),
        Book(title: "Happy Place", imageName: "wtr3", author: "Emily Henry", synopsis: "A heartfelt romantic comedy about exes who pretend to still be together during an annual friend group vacation, full of tension, laughter, and second chances.", year: "2023"),
        Book(title: "Daisy Jones & the Six", imageName: "wtr4", author: "Taylor Jenkins Reid", synopsis: "An oral history of the rise and fall of a fictional 1970s rock band, showcasing their triumphs, heartbreak, and the mystery of their breakup.", year: "2019")
    ]
    
    let finished = [
        Book(title: "Into the Wild", imageName: "fin1", author: "Jon Krakauer", synopsis: "The story of Christopher McCandless, a young man who gave up everything to venture into the Alaskan wilderness, seeking a deeper meaning in life.", year: "1996"),
        Book(title: "A Court of Thorns and Roses", imageName: "fin2", author: "Sarah J. Maas", synopsis: "A captivating fantasy novel where Feyre, a mortal huntress, is drawn into a faerie kingdom after killing a wolf, discovering dark secrets and a surprising love.", year: "2015"),
        Book(title: "The Cruel Prince", imageName: "fin3", author: "Holly Black", synopsis: "Jude, a mortal girl, fights for power and a place in the Faerie Court, where she faces cruel betrayals, deadly challenges, and unexpected alliances.", year: "2018"),
        Book(title: "Warcross", imageName: "fin4", author: "Marie Lu", synopsis: "A thrilling sci-fi story about Emika Chen, a hacker and bounty hunter who is pulled into a virtual world competition and uncovers a dark conspiracy.", year: "2017"),
        Book(title: "The Great Gatsby", imageName: "fin5", author: "F. Scott Fitzgerald", synopsis: "Set in the Roaring Twenties, this classic novel tells the story of Jay Gatsby's unrelenting love and tragic pursuit of wealth and happiness.", year: "1925")
    ]
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
