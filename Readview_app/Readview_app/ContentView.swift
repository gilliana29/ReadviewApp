//
//  ContentView.swift
//  Readview_app
//
//  Created by Gillian Arce Cardenas on 09/12/24.
//

import SwiftUICore
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .accessibilityLabel("Navigate to Home") // Descripción accesible

            // Search Tab
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .accessibilityLabel("Search for books") // Descripción accesible
            
            // Bookshelf Tab
            LibraryView()
                .tabItem {
                    Label("Bookshelf", systemImage: "books.vertical")
                }
                .accessibilityLabel("Your Bookshelf") // Descripción accesible

            // Profile Tab
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .accessibilityLabel("View your Profile") // Descripción accesible
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
