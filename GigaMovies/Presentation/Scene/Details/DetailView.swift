//
//  DetailView.swift
//  GigaMovies
//
//  Created by Giga Khizanishvili on 26.02.24.
//

import SwiftUI

struct DetailView: View {
    let detail: Detail
    private let pasteboard = UIPasteboard.general

    var body: some View {
        Section(detail.key) {
            Text(detail.value)
                .contextMenu {
                    Button {
                        copyValueToClipboard()
                    } label: {
                        Text("Copy")
                        Image(systemName: "doc.on.doc")
                    }
                }
        }
    }

    private func copyValueToClipboard() {
        pasteboard.string = detail.value
    }
}

// MARK: - Preview
#Preview {
    DetailView(
        detail: Detail(
            key: "Description",
            value: "A little bit long description of the movie"
        )
    )
}
