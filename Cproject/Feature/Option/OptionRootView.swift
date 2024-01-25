//
//  OptionRootView.swift
//  Cproject
//
//  Created by 최안용 on 1/25/24.
//

import SwiftUI

struct OptionRootView: View {
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text("옵션 화면!!")
    }
}

#Preview {
    OptionRootView(viewModel: OptionViewModel())
}
