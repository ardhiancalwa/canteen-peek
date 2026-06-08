//
//  AvailabilityBadge.swift
//  canteen-peek
//
//  Reusable menu availability badge for menu rows and cards.
//

import SwiftUI

struct AvailabilityBadge: View {
    let availability: MenuAvailability
    var showsMeaning: Bool = false

    var body: some View {
        StatusBadge(
            label: availability.label,
            detail: showsMeaning ? availability.meaning : nil,
            symbolName: availability.symbolName,
            tintColor: availability.tintColor,
            accessibilityLabel: availability.accessibilityLabel
        )
    }
}

#Preview("Availability Badges") {
    VStack(alignment: .leading, spacing: AppTheme.Spacing.medium) {
        ForEach(MenuAvailability.allCases) { availability in
            AvailabilityBadge(availability: availability, showsMeaning: true)
        }
    }
    .padding()
    .background(AppTheme.Colors.background)
}
