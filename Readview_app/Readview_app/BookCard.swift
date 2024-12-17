//
//  BookCard.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct BookCard: View {
    var book: Book

    var body: some View {
        VStack {
            Image(book.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .accessibilityHidden(true) // Ocultar la imagen de VoiceOver para evitar redundancia

            Text(book.title)
                .font(.caption)
                .lineLimit(2) // Permitir un máximo de 2 líneas
                .multilineTextAlignment(.leading) // Alinear a la izquierda
                .frame(maxWidth: 100) // Limitar el ancho del texto
        }
        .frame(width: 120) // Limitar el ancho del contenedor
        .accessibilityElement(children: .combine) // Combinar todo para VoiceOver
        .accessibilityLabel("\(book.title), published in \(book.year)") // Etiqueta descriptiva para VoiceOver
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book(title: "Sample Book", imageName: "book1", year: "2003"))
    }
}



