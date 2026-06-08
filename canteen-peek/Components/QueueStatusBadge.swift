//
//  QueueStatusBadge.swift
//  canteen-peek
//
//  Reusable queue status badge for card-based SwiftUI layouts.
//

import SwiftUI

struct QueueStatusBadge: View {
    let status: QueueStatus
    var showsMeaning: Bool = false

    var body: some View {
        StatusBadge(
            label: status.label,
            detail: showsMeaning ? status.meaning : nil,
            symbolName: status.symbolName,
            tintColor: status.tintColor,
            accessibilityLabel: status.accessibilityLabel
        )
    }
}

#Preview("Queue Status Badges") {
    VStack(alignment: .leading, spacing: AppTheme.Spacing.medium) {
        ForEach(QueueStatus.allCases) { status in
            QueueStatusBadge(status: status, showsMeaning: true)
        }
    }
    .padding()
    .background(AppTheme.Colors.background)
}
