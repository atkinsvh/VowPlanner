import SwiftUI

@available(iOS 17.0, *)
struct ProgressBarView: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geo in
            Rectangle().fill(Color.blue).frame(width: geo.size.width * progress)
        }
    }
}