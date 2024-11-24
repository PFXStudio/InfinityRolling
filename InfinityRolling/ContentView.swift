//
//  ContentView.swift
//  RollingNumbers
//
//  Created by nyon on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue: Double = 99999
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var formattedNumber: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: NSNumber(value: targetValue / 1000)) ?? "0"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                RollingNumbersView(number: formattedNumber)
                    .onReceive(timer) { _ in
                        targetValue = Double(Int.random(in: 10000...9050030))
                    }
                Text("만원")
                    .font(.system(size: 24, weight: .bold))
                    .frame(height: 50)
            }
        }
        .onAppear(perform: {
            targetValue = Double(Int.random(in: 10000...9050030))
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
