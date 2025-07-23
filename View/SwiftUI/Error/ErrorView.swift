//
//  ErrorView.swift
//  Countries
//
//  Created by Patrick Moscova on 7/23/25.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let onRetry: () -> Void
    
    var body: some View {
        VStack {
            Text("Error: \(error.localizedDescription)")
            Button("Retry", action: onRetry)
        }
    }
}
