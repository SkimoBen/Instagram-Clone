//
//  ProfileView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-27.
//

import SwiftUI

struct ProfileView: View {
    //defining the grid used for the users images. its an array of grid items
    var columns: [GridItem] = [
        GridItem(.fixed((UIScreen.main.bounds.width)/3)),
        GridItem(.fixed((UIScreen.main.bounds.width)/3)),
        GridItem(.fixed((UIScreen.main.bounds.width)/3))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                ProfileHeaderView()
                    .padding()
                //Photo grid view
                LazyVGrid(columns: columns, alignment: .center, spacing: 2, content: {
                    //loop that displays the photos.
                    ForEach(0...90, id: \.self) { num in
                        let imageName = "image\(Int.random(in: 1...5))"
                        NavigationLink(
                            destination: PostView(userImageName: "user2", imageName: imageName)
                                .navigationTitle("Photo"),
                            label: {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .clipped()
                            })
                    }
                }
                )
                
            }
            .navigationTitle("Kanye South")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //avatar image, counts
            HStack {
                Image("user2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .padding(.trailing, 5)
                
                VStack {
                    HeaderCountButtonsView()
                    
                    //edit profile button
                    Button(action: {
                        
                    }, label: {
                        Text("Edit Profile")
                            .foregroundColor(Color(.label))
                            .frame(width: 280, height: 35, alignment: .center)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(6)
                    })
                }
            }
            
            HStack {
                //user bio
                Text("Ay yo im going death con 5 on the jews \nHitler was a good person")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    
                Spacer()
            }
            
        }
        .padding()
    }
}

//structure for the header labels
struct HeaderCountButtonsView: View {
    var body: some View {
        HStack{
            // posts
            Button(action: {
                //no operation
            }, label: {
                Text("3\nPosts")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 50, height: 50, alignment: .center)
            
            
            //followers
            Button(action: {
                //no operation
            }, label: {
                Text("12k\nFollowers")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 80, height: 50, alignment: .center)
            .padding()
            
            //following
            Button(action: {
                //no operation
            }, label: {
                Text("300\nFollowing")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 80, height: 50, alignment: .center)
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
