// Created by Igor Uglev on 17.10.24.

import SwiftUI

protocol Route: Hashable {
    associatedtype TheView: View
    @ViewBuilder func view() -> TheView
}
