//
//  NotificationsView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-27.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0...30, id: \.self) { num in
                    if num % 2 == 0 {
                        NotificationFollowView()
                    }else {
                        NotificationLikeView()
                    }
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

//the notification layout for if someone likes your post
struct NotificationLikeView: View {
    var body: some View {
        HStack{
            //user image
            let userImageName = "user\(Int.random(in: 1...5))"
            Image(userImageName) //Choose a random user from 1 - 5
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            //text, date
            VStack(alignment: .leading) {
                Text("TimCook liked your post")
                Text("\(Int.random(in:3...59)) minutes ago")
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            //post
            let imageName = "image\(Int.random(in:1...5))"
            let image = Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:44, height: 44, alignment: .center)
            
            NavigationLink(
                destination: PostView(userImageName: userImageName, imageName: imageName),
                label: {
                    Spacer()
                    image
                }
            )
            .frame(width: 44, height: 44, alignment: .center)
        }
    }
}

//the notification layout for if someone follow you
struct NotificationFollowView: View {
    var body: some View {
        //This works by making a horizontal stack of the image, then the text from the notification, then the button.
        HStack{
            //user image
            Image("user\(Int.random(in: 1...5))") //Choose a random user from 1 - 5
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            //text, date
            VStack(alignment: .leading) {
                Text("Johnappleseed started following you")
                Text("\(Int.random(in:3...59)) minutes ago")
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            //follow button
            Button(action: {
                //do nothing
            }, label: {
                Text("Follow")
                    .frame(width:100, height: 30, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(.link))
                    .cornerRadius(8)
            })
        }
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
