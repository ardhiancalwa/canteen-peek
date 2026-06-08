//
//  CanteenHomeView.swift
//  canteen-peek
//
//  Primary single-tenant dashboard for CanteenPeek.
//

import SwiftUI
import Foundation

struct CanteenHomeView: View {
    @StateObject private var viewModel: CanteenHomeViewModel

    init(viewModel: CanteenHomeViewModel = CanteenHomeViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AppTheme.Spacing.large) {
                TenantHeaderCard(tenant: viewModel.tenant)
                QueueSummaryCard(tenant: viewModel.tenant, estimatedWaitText: viewModel.estimatedWaitText)
                MenuHighlightsCard(menuItems: viewModel.menuHighlights)
                HomeActionsCard()
            }
            .padding(AppTheme.Spacing.medium)
        }
        .background(AppTheme.Colors.background)
        .navigationTitle("CanteenPeek")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct TenantHeaderCard: View {
    let tenant: Tenant

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.medium) {
            HStack(alignment: .top, spacing: AppTheme.Spacing.medium) {
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 42, weight: .semibold))
                    .foregroundStyle(AppTheme.Colors.primary)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: AppTheme.Spacing.extraSmall) {
                    Text(tenant.name)
                        .font(.robotoTitle(28))
                        .foregroundStyle(AppTheme.Colors.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)

                    Label(tenant.location, systemImage: "mappin.and.ellipse")
                        .font(.robotoBody(15, weight: .medium))
                        .foregroundStyle(AppTheme.Colors.textSecondary)
                }

                Spacer(minLength: AppTheme.Spacing.small)
            }

            HStack(spacing: AppTheme.Spacing.small) {
                StatusDot(isActive: tenant.isOpen)

                Text(tenant.isOpen ? "Buka" : "Tutup")
                    .font(.robotoHeadline(15))
                    .foregroundStyle(AppTheme.Colors.textPrimary)

                Text(tenant.openingHours)
                    .font(.robotoBody(14))
                    .foregroundStyle(AppTheme.Colors.textSecondary)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(tenant.isOpen ? "Tenant buka sampai \(tenant.openingHours)" : "Tenant tutup"))
        }
        .cardStyle()
    }
}

private struct QueueSummaryCard: View {
    let tenant: Tenant
    let estimatedWaitText: String

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.medium) {
            SectionTitle(title: "Kondisi Antrean", symbolName: "person.3.sequence.fill")

            HStack(alignment: .center, spacing: AppTheme.Spacing.medium) {
                QueueStatusBadge(status: tenant.queueStatus, showsMeaning: true)

                Spacer(minLength: AppTheme.Spacing.small)

                VStack(alignment: .trailing, spacing: AppTheme.Spacing.extraSmall) {
                    Label("Estimasi", systemImage: "clock")
                        .font(.robotoCaption(12))
                        .foregroundStyle(AppTheme.Colors.textSecondary)

                    Text(estimatedWaitText)
                        .font(.robotoHeadline(22, weight: .bold))
                        .foregroundStyle(AppTheme.Colors.primary)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Estimasi waktu tunggu \(tenant.estimatedWaitTime) menit"))
            }
        }
        .cardStyle()
    }
}

private struct MenuHighlightsCard: View {
    let menuItems: [MenuItem]

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.medium) {
            SectionTitle(title: "Menu Highlights", symbolName: "menucard.fill")

            VStack(spacing: AppTheme.Spacing.small) {
                ForEach(menuItems) { item in
                    MenuHighlightRow(item: item)

                    if item.id != menuItems.last?.id {
                        Divider()
                    }
                }
            }
        }
        .cardStyle()
    }
}

private struct MenuHighlightRow: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .center, spacing: AppTheme.Spacing.medium) {
            VStack(alignment: .leading, spacing: AppTheme.Spacing.extraSmall) {
                Text(item.name)
                    .font(.robotoHeadline(16))
                    .foregroundStyle(AppTheme.Colors.textPrimary)

                Text("\(item.category) - \(formattedPrice)")
                    .font(.robotoCaption(13))
                    .foregroundStyle(AppTheme.Colors.textSecondary)
            }

            Spacer(minLength: AppTheme.Spacing.medium)

            AvailabilityBadge(availability: item.availability)
        }
        .padding(.vertical, AppTheme.Spacing.small)
        .accessibilityElement(children: .combine)
    }

    private var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp "
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        return formatter.string(from: NSNumber(value: item.price)) ?? "Rp \(item.price)"
    }
}

private struct HomeActionsCard: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack(spacing: AppTheme.Spacing.medium) {
                HomeActionButton(
                    title: "Quick Report",
                    symbolName: "square.and.pencil",
                    style: .primary
                )

                HomeActionButton(
                    title: "Insight",
                    symbolName: "chart.bar.xaxis",
                    style: .secondary
                )
            }

            VStack(spacing: AppTheme.Spacing.small) {
                HomeActionButton(
                    title: "Quick Report",
                    symbolName: "square.and.pencil",
                    style: .primary
                )

                HomeActionButton(
                    title: "Insight",
                    symbolName: "chart.bar.xaxis",
                    style: .secondary
                )
            }
        }
        .cardStyle()
    }
}

private struct HomeActionButton: View {
    enum Style {
        case primary
        case secondary
    }

    let title: String
    let symbolName: String
    let style: Style

    var body: some View {
        Button {
            // Navigation destinations will be connected when Report and Insight screens exist.
        } label: {
            Label(title, systemImage: symbolName)
                .font(.robotoHeadline(16))
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.horizontal, AppTheme.Spacing.medium)
        }
        .buttonStyle(.plain)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: AppTheme.Radius.small, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: AppTheme.Radius.small, style: .continuous)
                .stroke(borderColor, lineWidth: 1)
        }
        .accessibilityLabel(Text(title))
    }

    private var foregroundColor: Color {
        switch style {
        case .primary:
            return .white
        case .secondary:
            return AppTheme.Colors.primary
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .primary:
            return AppTheme.Colors.primary
        case .secondary:
            return AppTheme.Colors.primary.opacity(0.12)
        }
    }

    private var borderColor: Color {
        switch style {
        case .primary:
            return AppTheme.Colors.primary
        case .secondary:
            return AppTheme.Colors.primary.opacity(0.28)
        }
    }
}

private struct SectionTitle: View {
    let title: String
    let symbolName: String

    var body: some View {
        Label(title, systemImage: symbolName)
            .font(.robotoHeadline(17))
            .foregroundStyle(AppTheme.Colors.textPrimary)
    }
}

private struct StatusDot: View {
    let isActive: Bool

    var body: some View {
        Circle()
            .fill(isActive ? AppTheme.Colors.success : AppTheme.Colors.neutral)
            .frame(width: 9, height: 9)
            .accessibilityHidden(true)
    }
}

private extension View {
    func cardStyle() -> some View {
        self
            .padding(AppTheme.Spacing.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppTheme.Colors.secondaryBackground, in: RoundedRectangle(cornerRadius: AppTheme.Radius.medium, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: AppTheme.Radius.medium, style: .continuous)
                    .stroke(AppTheme.Colors.separator.opacity(0.28), lineWidth: 1)
            }
    }
}

#Preview {
    NavigationStack {
        CanteenHomeView()
    }
}
