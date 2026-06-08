//
//  CanteenHomeViewModel.swift
//  canteen-peek
//
//  State source for the single-tenant Canteen Home screen.
//

import Combine
import Foundation

@MainActor
final class CanteenHomeViewModel: ObservableObject {
    @Published private(set) var tenant: Tenant
    @Published private(set) var menuHighlights: [MenuItem]

    init() {
        let tenantID = UUID(uuidString: "00000000-0000-0000-0000-000000000001")!

        tenant = Tenant(
            id: tenantID,
            name: "Warung Nasi Bu Rini",
            category: "Rice / Local Food",
            location: "Kantin Lantai 1",
            queueStatus: .crowded,
            estimatedWaitTime: 15,
            openingHours: "08.00–15.00",
            isOpen: true,
            isFavorite: false
        )

        menuHighlights = [
            MenuItem(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000101")!,
                tenantId: tenantID,
                name: "Ayam Geprek",
                price: 15_000,
                availability: .almostSoldOut,
                category: "Main Course",
                imageName: "ayam_geprek"
            ),
            MenuItem(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000102")!,
                tenantId: tenantID,
                name: "Nasi Uduk",
                price: 12_000,
                availability: .available,
                category: "Main Course",
                imageName: "nasi_uduk"
            ),
            MenuItem(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000103")!,
                tenantId: tenantID,
                name: "Tempe Orek",
                price: 8_000,
                availability: .available,
                category: "Side Dish",
                imageName: "tempe_orek"
            ),
            MenuItem(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000104")!,
                tenantId: tenantID,
                name: "Es Teh Manis",
                price: 5_000,
                availability: .available,
                category: "Drink",
                imageName: "es_teh_manis"
            ),
            MenuItem(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000105")!,
                tenantId: tenantID,
                name: "Kerupuk",
                price: 2_000,
                availability: .soldOut,
                category: "Snack",
                imageName: "kerupuk"
            )
        ]
    }

    var estimatedWaitText: String {
        "\(tenant.estimatedWaitTime) min"
    }

    var operatingStatusText: String {
        tenant.isOpen ? "Buka sampai \(tenant.openingHours)" : "Tutup"
    }
}
