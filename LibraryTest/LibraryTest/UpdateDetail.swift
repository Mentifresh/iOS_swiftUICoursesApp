//
//  UpdateDetail.swift
//  LibraryTest
//
//  Created by Catalina Beta on 15/07/2019.
//  Copyright © 2019 Catalina Beta. All rights reserved.
//

import SwiftUI

struct UpdateDetail : View {
    var title = "SwiftUI"
    var text = "Loading..."
    var image = "Illustration1"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(text)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            }
            .padding(30)
    }
}

#if DEBUG
struct UpdateDetail_Previews : PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
#endif
