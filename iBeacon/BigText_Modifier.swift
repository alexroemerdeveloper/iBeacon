//
//  BigText_Modifier.swift
//  iBeacon
//
//  Created by Alexander Römer on 21.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import SwiftUI

struct BigText: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.system(size: 72, design: .rounded)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(Color.gray).edgesIgnoringSafeArea(.all)
    }
}
