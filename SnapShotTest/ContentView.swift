//
//  ContentView.swift
//  SnapShotTest
//
//  Created by 名前なし on 2022/04/21.
//
// File -> Add Packages ->
// https://github.com/pointfreeco/swift-snapshot-testing.git
// Add To Target(Targetをテストにする)


import SwiftUI

protocol ContentViewPresenter {
   func onTap()
}

extension ContentView {
    
    class Presenter: ObservableObject, ContentViewPresenter {
          
        @Published private(set) var isChangeMessage: Bool = true
        public var message: String {
            if isChangeMessage {
                return "A"
            } else {
                return "B"
            }
        }

        public func onTap() {
            isChangeMessage.toggle()
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            Text(presenter.message)
                .padding()
                .accessibility(identifier: "TestButton")
                .onTapGesture {
                    presenter.onTap()
                }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(appState: AppState.shared)
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//    }
//}
