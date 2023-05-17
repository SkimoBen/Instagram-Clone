//
//  ExploreView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-27.
//

import SwiftUI

struct ExploreView: View {
    @State var text = " " //this is the state bind that fills the search field
    
    var imageNames = (1...5).map({ "image\($0)"}) //this is what the foreach uses to find the images
    
    //this is the column for the grid display. 2 grid items creates 2 columns
    var columns: [GridItem] = [
        GridItem(.flexible(minimum:200)),
        GridItem(.flexible(minimum:200))
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    TextField("Search...", text: $text) //search bar
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        .padding()
                    
                    LazyVGrid(columns: columns, content: { //lazy loads as its scrolled
                        ForEach(0...20, id: \.self) {num in
                        //forEach is hard coded for 20 images. the images are chosen randomly using the .randomElement method.
                            let name = imageNames.randomElement() ?? "image1"
                            //this chooses a random image and if it returns nil it uses image1. then it assigns that name to the name variable.
                            
                            //this is what lets the image go full size when tapped.
                            NavigationLink(
                                destination: PostView(userImageName: "user1", imageName: name),
                                label: {
                                    Image(name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:200, height:200,alignment: .center)
                                        .clipped()
                                })
                        }
                    })
                }
            }
            .navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
