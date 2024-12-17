//
//  BookListView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 10/12/24.
//

import SwiftUI

struct BooksListView: View {
    var title: String
    var books: [Book]

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundColor(Color("AccentColor"))
                .bold()
                .padding()
                .accessibilityLabel("\(title) section") // Etiqueta descriptiva para VoiceOver

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    ForEach(books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            VStack {
                                // Imagen del libro
                                Image(book.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 180)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                                    .accessibilityLabel("\(book.title) cover image")
                                
                                // Título del libro
                                Text(book.title)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                    .accessibilityLabel(book.title)
                            }
                        }
                        .accessibilityElement(children: .combine) // Combinar elementos como uno solo
                        .accessibilityLabel("Open details for \(book.title)") // Descripción de enlace
                    }
                }
                .padding()
            }
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BooksListView(
                title: "Trending Books",
                books: [
                    Book(title: "Pride and Prejudice", imageName: "book1", year: "2002"),
                    Book(title: "Little Women", imageName: "book2", year: "2002"),
                    Book(title: "The Fellowship of the Ring", imageName: "book3", year: "2002")
                ]
            )
        }
    }
}
