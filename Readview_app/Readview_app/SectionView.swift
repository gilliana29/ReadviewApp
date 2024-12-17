//
//  SectionView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var books: [Book] // Una lista de libros
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .accessibilityLabel("Section title: \(title)") // Etiqueta accesible para el título de la sección
                Spacer()
                NavigationLink(destination: BooksListView(title: title, books: books)) {
                    Text("See all")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color("AccentColor"))
                        .accessibilityLabel("See all books in the \(title) section") // Descripción accesible del enlace "See all"
                }
            }
            
        }
        .padding(.bottom, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(books) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
                        VStack {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 200)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                                .accessibilityLabel("Cover image of \(book.title)") // Etiqueta accesible para la imagen de cada libro
                            
                            Text(book.title)
                                .font(.footnote)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 100)
                                .accessibilityLabel(book.title) // Etiqueta accesible para el título
                                .accessibilityHint("Tap to view the details of \(book.title).") // Hint sobre qué hace al tocar el libro
                        }
                    }
                }
            }
        }
    }
}

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var author: String?
    var synopsis: String?
    let year: String
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(
            title: "Sample Title",
            books: [
                Book(title: "Sample Book 1", imageName: "book1", year: "2003"),
            ]
        )
    }
}
