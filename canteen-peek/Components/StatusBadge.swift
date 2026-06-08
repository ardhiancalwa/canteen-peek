//
//  StatusBadge.swift
//  canteen-peek
//
//  Shared visual foundation for explicit, accessible status badges.
//

import SwiftUI

struct StatusBadge: View {
    let label: String
    let detail: String?
    let symbolName: String
    let tintColor: Color
    let accessibilityLabel: String

    init(
        label: String,
        detail: String? = nil,
        symbolName: String,
        tintColor: Color,
        accessibilityLabel: String
    ) {
        self.label = label
        self.detail = detail
        self.symbolName = symbolName
        self.tintColor = tintColor
        self.accessibilityLabel = accessibilityLabel
    }

    var body: some View {
        HStack(spacing: AppTheme.Spacing.small) {
            Image(systemName: symbolName)
                .font(.robotoCaption(12, weight: .bold))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(tintColor)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: AppTheme.Spacing.extraSmall) {
                Text(label)
                    .font(.robotoCaption(13, weight: .semibold))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .lineLimit(1)

                if let detail = detail {
                    Text(detail)
                        .font(.robotoCaption(12))
                        .foregroundStyle(AppTheme.Colors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(.horizontal, AppTheme.Spacing.medium)
        .padding(.vertical, AppTheme.Spacing.small)
        .background(tintColor.opacity(0.14), in: Capsule())
        .overlay {
            Capsule()
                .stroke(tintColor.opacity(0.35), lineWidth: 1)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(accessibilityLabel))
    }
}

#Preview("Status Badge") {
    StatusBadge(
        label: "Ramai",
        detail: "Antrean cukup panjang",
        symbolName: "person.3",
        tintColor: AppTheme.Colors.warning,
        accessibilityLabel: "Status antrean: Ramai. Antrean cukup panjang."
    )
    .padding()
    .background(AppTheme.Colors.background)
}
