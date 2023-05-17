//
//  ContentView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //These are basically links in the tab bar to the content files
            HomeFeedView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            ExploreView()
                .tabItem{
                    Image(systemName: "safari")
                    Text("Explore")
                }
            CameraView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("Camera")
                }
            NotificationsView()
                .tabItem{
                    Image(systemName: "bell")
                    Text("Notifications")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
