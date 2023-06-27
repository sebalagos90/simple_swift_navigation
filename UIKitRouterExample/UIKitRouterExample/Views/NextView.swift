//
//  NextView.swift
//  UIKitRouterExample
//
//  Created by Sebastian Lagos Gutierrez on 27-06-23.
//

import SwiftUI

struct NextView: View {
    @EnvironmentObject var router: Router<AppRoute>
    var body: some View {
        VStack {
            Text("This is the second view")
            Button(action: {
                router.pop()
            }, label: {Text("go back")})
            Button(action: {
                router.push(.NextView)
            }, label: {
                Text("Go to another view")
            })
            Button(action: {
                router.goRoot()
            }, label: {
                Text("Go to root view")
            })
            Button(action: {
                router.pop(count: 3)
            }, label: {
                Text("Pop 3 times")
            })
        }
        .navigationTitle("Some title here")
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
