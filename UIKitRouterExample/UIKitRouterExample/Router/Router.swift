//
//  Router.swift
//  UIKitRouterExample
//
//  Created by Sebastian Lagos Gutierrez on 27-06-23.
//

import Foundation

class Router<Route: Equatable>: ObservableObject {

    var routes = [Route]()
    var onPush: ((Route) -> Void)?
    var onPop: (() -> Void)?
    var onPopTimes: ((Int) -> Void)?
    var onRoot: (() -> Void)?

    init(initial: Route? = nil) {
        if let initial = initial {
            routes.append(initial)
        }
    }

    func push(_ route: Route) {
        routes.append(route)
        onPush?(route)
    }
    
    func pop() {
        routes.removeLast()
        onPop?()
    }

    func pop(count: Int) {
        routes = routes.dropLast(count)
        onPopTimes?(count)
    }

    func goRoot() {
        routes = routes.dropLast(routes.count - 1)
        print(routes.count)
        onRoot?()
    }
}
