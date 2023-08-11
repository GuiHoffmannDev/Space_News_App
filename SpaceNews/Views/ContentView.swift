//
//  ContentView.swift
//  SpaceNews
//
//  Created by Guilher Hoffmann on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    
    var body: some View {
        NavigationView {
            VStack  {
                NewsView()
                    .opacity(opac)
            }
            .navigationTitle("Space news")
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
