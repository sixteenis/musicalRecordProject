//
//  TextView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/13/24.
//

import SwiftUI

struct TextView: View {
    var int: Int?
    var body: some View {
        Text("\(int)")
    }
}

#Preview {
    TextView()
}
