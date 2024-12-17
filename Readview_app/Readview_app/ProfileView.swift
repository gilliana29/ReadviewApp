//
//  ProfileView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUI

struct ProfileView: View {
    let userName = "gigi"
    let userBio = "book enthusiast."
    let profileImageName = "profile"

    @State private var isProfileImagePresented = false // Estado para mostrar la imagen ampliada

    let favoriteBooks = [
        Book(title: "Twilight", imageName: "fav1", author: "Stephenie Meyer", synopsis: "A love story between a human and a vampire set in Forks.", year: "2005"),
        Book(title: "A Room of One's Own", imageName: "fav2", author: "Virginia Woolf", synopsis: "An extended essay exploring women in literature and society.", year: "1929"),
        Book(title: "Misery", imageName: "fav3", author: "Stephen King", synopsis: "A famous author is held captive by his 'number one fan.'", year: "1987"),
        Book(title: "The Help", imageName: "fav4", author: "Kathryn Stockett", synopsis: "A group of women confront the realities of racism in 1960s Mississippi.", year: "2009")
    ]

    let recentBooks = [
        Book(title: "The Handmaid's Tale", imageName: "rec0", author: "Margaret Atwood", synopsis: "A dystopian story of a theocratic regime that oppresses women.", year: "1985"),
        Book(title: "The Goldfinch", imageName: "rec1", author: "Donna Tartt", synopsis: "A young man’s life is shaped by tragedy, art, and love.", year: "2013"),
        Book(title: "Animal Farm", imageName: "rec2", author: "George Orwell", synopsis: "An allegory about a dystopian farm society and political corruption.", year: "1945"),
        Book(title: "Bunny", imageName: "rec3", author: "Mona Awad", synopsis: "A darkly comedic tale about friendship and twisted imagination.", year: "2019"),
        Book(title: "The Last Great Road Bum", imageName: "rec4", author: "Héctor Tobar", synopsis: "A story of an American adventurer traveling the world.", year: "2020")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    // Imagen de perfil (con botón para expandir)
                    Button(action: {
                        isProfileImagePresented.toggle() // Mostrar la imagen completa
                    }) {
                        Image(profileImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .accessibilityLabel("Profile picture of \(userName)") // VoiceOver
                    }
                    .buttonStyle(PlainButtonStyle()) // Estilo plano del botón

                    // Nombre y bio
                    Text(userName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Username: \(userName)")

                    Text(userBio)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .accessibilityLabel("Bio: \(userBio)")

                    Divider()
                        .padding(.horizontal, 20)

                    // Secciones con libros
                    VStack(alignment: .leading, spacing: 20) {
                        SectionView(title: "Favorites", books: favoriteBooks)
                        SectionView(title: "Recent", books: recentBooks)
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.top, 20)
                .accessibilityElement(children: .contain)
            }
            // Título y botón de Configuración en la barra de navegación
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Settings button tapped")
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel("Settings")
                            .accessibilityHint("Opens the settings screen")
                    }
                }
            }
            // Pantalla completa al hacer clic en la imagen de perfil
            .fullScreenCover(isPresented: $isProfileImagePresented) {
                ProfileImageDetailView(imageName: profileImageName)
            }
        }
    }
}

struct ProfileImageDetailView: View {
    let imageName: String
    
    @Environment(\.presentationMode) var presentationMode // Para cerrar la vista
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Fondo oscuro
            Image(imageName)
                .resizable()
                .scaledToFit()
                .accessibilityLabel("Full profile picture")
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Cerrar la vista
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .accessibilityLabel("Close")
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
