//
//  FocusView.swift
//  NPLGGD
//
//  Created by Charlie Weismann on 2/20/23.
//

import SwiftUI
import Combine
//import UITouch

struct FocusView: View {
    @Binding var isPresentingFocusView: Bool
    @Environment(\.dismiss) private var dismiss
    @StateObject var focusTimer = FocusTimer()
    
    var body: some View {
        VStack {
            Text("FOCUS")
                .font(.system(size: 50, weight: .light, design: .monospaced))
                .foregroundColor(.white)
            Spacer()
//            Text(timerInterval: Date.now...Date(timeInterval: 12*60, since: .now), countsDown: false, showsHours: true)
//                .font(.system(size: 80, weight: .light, design: .monospaced))
//                .foregroundColor(.white)
            Divider()
//            Button(action: {})
            HStack {
                Text("\(focusTimer.count)")
                    .font(.system(size: 50, weight: .light, design: .monospaced))
                    .foregroundColor(.white)

            }
            Spacer()
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "xmark")
                        .font(.system(size: 30, weight: .light, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(.black)
        .navigationBarBackButtonHidden(true)
    }
}

class FocusTimer: ObservableObject {
    @Published var count: Int = 0
    var timer: AnyCancellable?
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                if false {
                    self.timer?.cancel()
                }
                
            }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView(isPresentingFocusView: .constant(false))
    }
}
