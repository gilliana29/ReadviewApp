//
//  BookDetailView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    @State private var selectedStars: Int = 0 // Estado para el número de estrellas seleccionadas
    @State private var isFavorite: Bool = false // Estado para el corazón de favoritos
    
    var body: some View {
        ScrollView {
            VStack {
                // Imagen del libro
                Image(book.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 300)
                    .cornerRadius(12)
                    .padding(.top, 20)
                    .accessibilityLabel("Cover image of \(book.title)") // Descripción para VoiceOver
                
                // Título del libro
                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .accessibilityLabel("Title: \(book.title)")

                // Autor
                Text(book.author ?? "No author available")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                    .accessibilityLabel("Author: \(book.author ?? "Author not available")")
                
                // Año de publicación
                Text(book.year)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 1)
                    .accessibilityLabel("Published in \(book.year)")
                
                // Sinopsis
                Text(book.synopsis ?? "No synopsis available")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
                    .accessibilityLabel("Synopsis: \(book.synopsis ?? "No synopsis available")")
                
                // Calificación con estrellas
                HStack(spacing: 8) {
                    ForEach(0..<5) { star in
                        Image(systemName: star < selectedStars ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                selectedStars = star + 1
                            }
                            .accessibilityLabel("Rate this book")
                            .accessibilityHint("Select \(star + 1) stars")
                    }

                    // Botón de favorito
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .onTapGesture {
                            isFavorite.toggle()
                        }
                        .accessibilityLabel(isFavorite ? "Unmark as favorite" : "Mark as favorite")
                }
                .padding(.top, 10)
                
                // Botón "Add to list"
                Button(action: {
                    print("Add to list tapped")
                }) {
                    Text("Add to list")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                .accessibilityLabel("Add this book to your reading list")
                
                // Sección de reseñas
                VStack(alignment: .leading, spacing: 10) {
                    Text("Reviews")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                        .accessibilityLabel("Reviews section")

                    VStack(alignment: .leading, spacing: 8) {
                        ReviewCard(username: "Ana", reviewText: "I absolutely loved this book! The plot and characters were so touching.")
                        ReviewCard(username: "John", reviewText: "Great story, though I found the ending a bit predictable.")
                        ReviewCard(username: "Laura", reviewText: "Really intriguing. Loved every plot twist!!!")
                    }
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
}

// Vista de tarjeta de reseña con accesibilidad
struct ReviewCard: View {
    var username: String
    var reviewText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(username)
                .fontWeight(.bold)
            Text(reviewText)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 70) // Asegurar tamaño uniforme
        .padding()
        .background(Color.background)
        .cornerRadius(10)
        .shadow(radius: 5)
        .accessibilityElement(children: .combine) // Combinar como un solo elemento accesible
        .accessibilityLabel("Review by \(username): \(reviewText)") // Etiqueta clara
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book(
            title: "The Marriage Portrait",
            imageName: "book5",
            author: "Maggie O'Farrell",
            synopsis: "A historical novel about a young girl, a Medici bride.",
            year: "2022"
        ))
    }
}
