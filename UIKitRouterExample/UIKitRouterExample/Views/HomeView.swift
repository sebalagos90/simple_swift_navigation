//
//  HomeView.swift
//  UIKitRouterExample
//
//  Created by Sebastian Lagos Gutierrez on 27-06-23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router<AppRoute>

    var body: some View {
        VStack {
            Text("This is the home view")
            Button(action: {
                router.push(.NextView)
            }, label: {Text("next view")})
        }
        .navigationTitle("Home View title")

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
