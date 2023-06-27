//
//  ContentView.swift
//  UIKitRouterExample
//
//  Created by Sebastian Lagos Gutierrez on 27-06-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = Router(initial: AppRoute.Home)
    var body: some View {
        RouterHost(router: router) { route in
            switch route {
            case .Home: HomeView()
            case .NextView: NextView()
            }
        }.environmentObject(router)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
