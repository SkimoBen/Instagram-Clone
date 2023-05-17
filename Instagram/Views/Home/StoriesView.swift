//
//  StoriesView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-27.
//

import SwiftUI

//Structure for the stories area
struct StoriesView: View {
    let data = (1...5).map({ "user\($0)" })
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data, id: \.self) { imageName in
                    StoryView(imageName: imageName)
                }
                
            }
        }
    }
}

//defines the look of the story bubbles
struct StoryView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:90, height:90, alignment: .center)
            .background(Color.blue)
            .cornerRadius(45)
            .padding(3)
    }
}
