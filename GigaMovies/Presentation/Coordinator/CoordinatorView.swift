//
//  CoordinatorView.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 24.02.24.
//

import SwiftUI

struct CoordinatorView: View {

    @ObservedObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .list)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .alert(coordinator.errorMessage, isPresented: $coordinator.isErrorAlertPresented, actions: { })
        }
        .environmentObject(coordinator)
    }
}
