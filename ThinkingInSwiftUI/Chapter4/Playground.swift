import SwiftUI

struct Playground: View {
    var body: some View {
        MeasureBehavior(content:
            HStack {
                Text("Hello, World")
                Rectangle()
                    .fill(Color.red)
                    .frame(minWidth: 200)
            }
        )
    }
}

