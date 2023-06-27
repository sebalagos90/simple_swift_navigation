//
//  RouterHost.swift
//  UIKitRouterExample
//
//  Created by Sebastian Lagos Gutierrez on 27-06-23.
//

import Foundation
import SwiftUI

struct RouterHost<Route: Equatable, Screen: View>: UIViewControllerRepresentable {

    let router: Router<Route>

    @ViewBuilder
    let builder: (Route) -> Screen

    func makeUIViewController(context: Context) -> UINavigationController {
        let navigation = UINavigationController()

        for route in router.routes {
            navigation.pushViewController(
                UIHostingController(rootView: builder(route)), animated: false
            )
        }

        router.onPush = { route in
            navigation.pushViewController(
                UIHostingController(rootView: builder(route)), animated: true
            )
        }

        router.onPop = {
            navigation.popViewController(animated: true)
        }

        router.onPopTimes = { count in
            let lastIndex = navigation.viewControllers.count - 1
            if count >= lastIndex {
                router.onRoot?()
            } else {
                let controller = navigation.viewControllers[lastIndex - count]
                navigation.popToViewController(controller, animated: true)
            }
        }

        router.onRoot = {
            navigation.popToRootViewController(animated: true)
        }

        return navigation
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }

    typealias UIViewControllerType = UINavigationController
}
