//
//  SearchView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = "" // Texto del buscador
    
    let books = [
        Book(title: "The Marriage Portrait", imageName: "book5", author: "Maggie O'Farrell", synopsis: "A historical novel about a young girl, a Medici bride.", year: "2023"),
        Book(title: "The Vanishing Half", imageName: "book8", author: "Brit Bennett", synopsis: "Twin sisters choose divergent paths that reshape their lives.", year: "2020"),
        Book(title: "Pride and Prejudice", imageName: "book1", author: "Jane Austen", synopsis: "Elizabeth Bennet navigates love and society in Georgian England.", year: "1813"),
        Book(title: "Funny Story", imageName: "book7", author: "Emily Henry", synopsis: "Two polar opposites find themselves living together.", year: "2021"),
        Book(title: "Little Women", imageName: "book2", author: "Louisa May Alcott", synopsis: "The story of four sisters coming of age during the Civil War.", year: "1868"),
        Book(title: "Fourth Wing", imageName: "book4", author: "Rebecca Yarros", synopsis: "A tale of dragons, war, and a magical academy.", year: "2023"),
        Book(title: "The Fellowship of the Ring", imageName: "book3", author: "J.R.R. Tolkien", synopsis: "The first part of the epic journey of the One Ring.", year: "1954"),
        Book(title: "The Midnight Library", imageName: "book6", author: "Matt Haig", synopsis: "A library between life and death where infinite choices await.", year: "2020"),
        Book(title: "The Seven Year Slip", imageName: "book9", author: "Ashley Poston", synopsis: "A magical love story across time.", year: "2023"),
        Book(title: "The Illusion of Simple", imageName: "book10", synopsis: "A thrilling mystery novel uncovering hidden truths.", year: "2024"),
        Book(title: "Just for the Summer", imageName: "book11", author: "Abby Jimenez", synopsis: "Two people agree to a no-strings-attached summer romance to help break a family 'love curse' — but the lines between fun and feelings blur.", year: "2023"),
        Book(title: "First Lie Wins", imageName: "book12", author: "Ashley Elston", synopsis: "An unputdownable thriller following an enigmatic woman living many lives — and keeping deadly secrets.", year: "2023"),
        Book(title: "Twilight", imageName: "fav1", author: "Stephenie Meyer", synopsis: "A love story between a human and a vampire set in Forks.", year: "2005"),
        Book(title: "A Room of One's Own", imageName: "fav2", author: "Virginia Woolf", synopsis: "An extended essay exploring women in literature and society.", year: "1929"),
        Book(title: "Misery", imageName: "fav3", author: "Stephen King", synopsis: "A famous author is held captive by his 'number one fan.'", year: "1987"),
        Book(title: "The Help", imageName: "fav4", author: "Kathryn Stockett", synopsis: "A group of women confront the realities of racism in 1960s Mississippi.", year: "2009"),
        Book(title: "The Handmaid's Tale", imageName: "rec0", author: "Margaret Atwood", synopsis: "A dystopian story of a theocratic regime that oppresses women.", year: "1985"),
        Book(title: "The Goldfinch", imageName: "rec1", author: "Donna Tartt", synopsis: "A young man’s life is shaped by tragedy, art, and love.", year: "2013"),
        Book(title: "Animal Farm", imageName: "rec2", author: "George Orwell", synopsis: "An allegory about a dystopian farm society and political corruption.", year: "1945"),
        Book(title: "Bunny", imageName: "rec3", author: "Mona Awad", synopsis: "A darkly comedic tale about friendship and twisted imagination.", year: "2019"),
        Book(title: "The Last Great Road Bum", imageName: "rec4", author: "Héctor Tobar", synopsis: "A story of an American adventurer traveling the world.", year: "2020")
    ]
    
    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        } else {
            return books.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredBooks, id: \.title) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    HStack {
                        Image(book.imageName) // Imagen del libro
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 75)
                            .accessibilityLabel("Cover image of \(book.title)") // Descripción accesible para la imagen del libro
                        
                        Text(book.title)
                            .font(.headline)
                            .accessibilityLabel(book.title) // Etiqueta accesible para el título del libro
                            .accessibilityHint("Double-tap to view details of the book.") // Sugerencia de interacción
                    }
                }
                .accessibilityElement(children: .combine) // Agrupar la imagen y el texto como un solo elemento de accesibilidad
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, placement: .automatic, prompt: "Search books")
            .accessibilityLabel("Search for books by title") // Etiqueta accesible para el campo de búsqueda
            .accessibilityHint("Enter text to filter the list of books.") // Sugerencia de búsqueda
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
