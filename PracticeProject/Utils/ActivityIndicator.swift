//
//  ActivityIndicatorView.swift
//  PracticeProject
//
//  Created by Gnanavel on 01/04/22.
//

import SwiftUI


/// ActivityIndicator  is a loader for Api calls
struct ActivityIndicator: View {
    // MARK: - Variables
    @State private var degress = 0.0
    let color: Color
    let size: CGFloat
    // MARK: - Body
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degress))
            .onAppear{ self.start()}
    }
    /// Start the indicator
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}
// MARK: - Preview
struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(color: .black, size: 50)
    }
}
