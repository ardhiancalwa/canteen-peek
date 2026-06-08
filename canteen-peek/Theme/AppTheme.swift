//
//  AppTheme.swift
//  canteen-peek
//
//  Centralized design tokens for CanteenPeek.
//

import SwiftUI
import UIKit

enum AppTheme {
    enum Colors {
        static let primary = Color(uiColor: .systemRed)
        static let background = Color(uiColor: .systemBackground)
        static let secondaryBackground = Color(uiColor: .secondarySystemBackground)
        static let cardBackground = Color(uiColor: .tertiarySystemBackground)
        static let textPrimary = Color(uiColor: .label)
        static let textSecondary = Color(uiColor: .secondaryLabel)
        static let separator = Color(uiColor: .separator)

        static let success = Color(uiColor: .systemGreen)
        static let warning = Color(uiColor: .systemOrange)
        static let danger = Color(uiColor: .systemRed)
        static let neutral = Color(uiColor: .systemGray)
        static let info = Color(uiColor: .systemBlue)
    }

    enum Spacing {
        static let extraSmall: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let extraLarge: CGFloat = 32
    }

    enum Radius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let pill: CGFloat = 999
    }
}

extension Font {
    static func robotoTitle(_ size: CGFloat = 28, weight: Weight = .bold) -> Font {
        roboto(size: size, relativeTo: .title, weight: weight)
    }

    static func robotoHeadline(_ size: CGFloat = 17, weight: Weight = .semibold) -> Font {
        roboto(size: size, relativeTo: .headline, weight: weight)
    }

    static func robotoBody(_ size: CGFloat = 16, weight: Weight = .regular) -> Font {
        roboto(size: size, relativeTo: .body, weight: weight)
    }

    static func robotoCaption(_ size: CGFloat = 13, weight: Weight = .medium) -> Font {
        roboto(size: size, relativeTo: .caption, weight: weight)
    }

    private static func roboto(size: CGFloat, relativeTo textStyle: TextStyle, weight: Weight) -> Font {
        guard UIFont(name: "Roboto", size: size) != nil else {
            return .system(textStyle, design: .default, weight: weight)
        }

        return .custom("Roboto", size: size, relativeTo: textStyle).weight(weight)
    }
}
