import SwiftUI

struct KnobController: View {
    @State var value: Double = 0.5
    @State var knobSize: CGFloat = 0.1
    @State var knobColorHue: Double = 0
    @State var knobColorEnabled: Bool = true

    var body: some View {
        VStack {
            Knob(value: $value)
                .frame(width: 100, height: 100)
                .knobPointerSize(knobSize)
                .knobColor(knobColorEnabled ? Color(hue: knobColorHue, saturation: 1, brightness: 1) : nil)
            HStack {
                Text("Value")
                Slider(value: $value, in: 0...1)
            }
            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: 0...0.4)
            }
            HStack {
                Text("Knob Color")
                Slider(value: $knobColorHue, in: 0...1)
            }
            Toggle(isOn: $knobColorEnabled) {
                Text("Knob Color Enabled")
            }
            Button(action: {
                withAnimation(.default) {
                    self.value = self.value == 0 ? 1 : 0
                }
            }, label: { Text("Toggle")})
        }
    }
}

struct KnobController_Previews: PreviewProvider {
    static var previews: some View {
        KnobController()
    }
}
