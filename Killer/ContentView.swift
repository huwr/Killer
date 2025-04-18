//
//  ContentView.swift
//  Killer
//
//  Created by Huw Rowlands on 18/4/2025.
//

import SwiftUI

struct ContentView: View {

    @State private var list: [NSRunningApplication] = {
        NSWorkspace.shared.runningApplications
    }()

    var body: some View {
        List(list, id: \.processIdentifier) { app in
            HStack {
                app.icon.map { Image(nsImage: $0) }
                Text(app.localizedName ?? "Unknown")
                Spacer()
                Button("Terminate", action: {
//                    kill(app.processIdentifier, SIGTERM) //this also works apparently
                    app.terminate()
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
