//
//  UpdateList.swift
//  LibraryTest
//
//  Created by Catalina Beta on 15/07/2019.
//  Copyright © 2019 Catalina Beta. All rights reserved.
//

import SwiftUI

struct UpdateList : View {
    var updates = updateData
    @ObjectBinding var store = UpdateStore(updates: updateData)
    
    var body: some View {
        NavigationView {
            Button(action: addUpdate, label: {
                Text("Add Update")
            })
                .padding(8)
                .background(Color("background3"))
                .cornerRadius(8)
            
            List { // This is for the navigation options
                ForEach(store.updates) { item in // This is for each option
                    NavigationButton(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        HStack(spacing: 12) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color("background"))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .frame(height: 50.0)
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .color(.gray)
                            }
                        }
                        }
                        .padding(.vertical, 8.0)
                    }
                    .onDelete { index in
                        self.store.updates.remove(at: index.first!)
                    }
                    .onMove(perform: move)
                }
                .navigationBarTitle(Text("Updates"))
                .navigationBarItems(trailing:
                    EditButton()
            )
        }
    }
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.updates.swapAt(source.first!, destination)
    }
}

#if DEBUG
struct UpdateList_Previews : PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
#endif

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(
        image: "Illustration1",
        title: "SwiftUI",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "JUN 26"
    ),
    Update(
        image: "Illustration2",
        title: "Framer X",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "JUN 11"
    ),
    Update(
        image: "Illustration3",
        title: "CSS Layout",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "May 26"
    ),
    Update(
        image: "Illustration4",
        title: "React Native Part 2",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "May 15"
    ),
    Update(
        image: "Certificate1",
        title: "Unity",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "May 19"
    ),
    Update(
        image: "Certificate2",
        title: "React Native for Designers",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "FEB 14"
    ),
    Update(
        image: "Certificate3",
        title: "Vue.js",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        date: "JAN 23"
    ),
]
