import SwiftUI

struct Knob: View {
    @Binding var value: Double // should be between 0 and 1
    var pointerSize: CGFloat? = nil
    @Environment(\.knobPointerSize) var envPointerSize
    @Environment(\.knobColor) var color
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
         KnobShape(pointerSize: pointerSize ?? envPointerSize)
            .fill(color ?? (colorScheme == .dark ? Color.white : Color.black))
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}
