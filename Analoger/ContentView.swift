//
//  ContentView.swift
//  Analoger
//
//  Created by Егор Бадмаев on 29.06.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Analoger")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
