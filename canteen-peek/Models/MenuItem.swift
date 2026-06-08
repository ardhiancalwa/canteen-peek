//
//  MenuItem.swift
//  canteen-peek
//
//  Menu item model based on PRD Section 11.
//

import Foundation

struct MenuItem: Identifiable, Codable, Hashable {
    let id: UUID
    let tenantId: UUID
    let name: String
    let price: Int
    let availability: MenuAvailability
    let category: String
    let imageName: String
}
