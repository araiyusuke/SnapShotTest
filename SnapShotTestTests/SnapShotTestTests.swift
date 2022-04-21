//
//  SnapShotTestTests.swift
//  SnapShotTestTests
//
//  Created by 名前なし on 2022/04/21.
//

import XCTest
import SwiftUI
import SnapshotTesting // 追加
@testable import SnapShotTest

class SnapShotTestTests: XCTestCase {
    let record = false
    func testDefaultAppearance() {
        let presenter = ContentView.Presenter()
        let contentView = ContentView(presenter: presenter)
        // A
        assertSnapshot(matching: contentView, as: .image, record: record)
        presenter.onTap() // Bに切り替え
        // B
        assertSnapshot(matching: contentView, as: .image, record: record)
        presenter.onTap()
        // A
        assertSnapshot(matching: contentView, as: .image, record: record)
    }
}
