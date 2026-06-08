//
//  StatusSystems.swift
//  canteen-peek
//
//  PRD Section 12 status systems used across queue and menu UI.
//

import SwiftUI

enum QueueStatus: String, CaseIterable, Identifiable, Codable, Hashable {
    case quiet
    case normal
    case crowded
    case veryCrowded

    var id: String { rawValue }

    var label: String {
        switch self {
        case .quiet:
            return "Sepi"
        case .normal:
            return "Normal"
        case .crowded:
            return "Ramai"
        case .veryCrowded:
            return "Sangat Ramai"
        }
    }

    var meaning: String {
        switch self {
        case .quiet:
            return "Hampir tidak ada antrean"
        case .normal:
            return "Antrean masih wajar"
        case .crowded:
            return "Antrean cukup panjang"
        case .veryCrowded:
            return "Antrean panjang dan waktu tunggu tinggi"
        }
    }

    var symbolName: String {
        switch self {
        case .quiet:
            return "person"
        case .normal:
            return "person.2"
        case .crowded:
            return "person.3"
        case .veryCrowded:
            return "clock.badge.exclamationmark"
        }
    }

    var tintColor: Color {
        switch self {
        case .quiet:
            return AppTheme.Colors.success
        case .normal:
            return AppTheme.Colors.info
        case .crowded:
            return AppTheme.Colors.warning
        case .veryCrowded:
            return AppTheme.Colors.danger
        }
    }

    var accessibilityLabel: String {
        "Status antrean: \(label). \(meaning)."
    }
}

enum MenuAvailability: String, CaseIterable, Identifiable, Codable, Hashable {
    case available
    case almostSoldOut
    case soldOut

    var id: String { rawValue }

    var label: String {
        switch self {
        case .available:
            return "Tersedia"
        case .almostSoldOut:
            return "Hampir Habis"
        case .soldOut:
            return "Habis"
        }
    }

    var meaning: String {
        switch self {
        case .available:
            return "Menu masih aman"
        case .almostSoldOut:
            return "Stok terbatas"
        case .soldOut:
            return "Menu tidak tersedia"
        }
    }

    var symbolName: String {
        switch self {
        case .available:
            return "checkmark.circle.fill"
        case .almostSoldOut:
            return "exclamationmark.triangle.fill"
        case .soldOut:
            return "xmark.circle.fill"
        }
    }

    var tintColor: Color {
        switch self {
        case .available:
            return AppTheme.Colors.success
        case .almostSoldOut:
            return AppTheme.Colors.warning
        case .soldOut:
            return AppTheme.Colors.neutral
        }
    }

    var accessibilityLabel: String {
        "Ketersediaan menu: \(label). \(meaning)."
    }
}
