//
//  ContentView.swift
//  iBeacon
//
//  Created by Alexander Römer on 21.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var detector = BeaconDecetor()
    
    var body: some View {
        if detector.lastDistance == .immediate {
            return Text("Right Here").modifier(BigText()).background(Color.red).edgesIgnoringSafeArea(.all)
        } else if detector.lastDistance == .near {
            return Text("Near").modifier(BigText()).background(Color.orange).edgesIgnoringSafeArea(.all)
        } else if detector.lastDistance == .far {
            return Text("Far").modifier(BigText()).background(Color.blue).edgesIgnoringSafeArea(.all)
        } else {
            return Text("UNKOWN").modifier(BigText()).background(Color.gray).edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
