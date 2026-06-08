//
//  Tenant.swift
//  canteen-peek
//
//  Core tenant model based on PRD Section 11.
//

import Foundation

struct Tenant: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let category: String
    let location: String
    let queueStatus: QueueStatus
    let estimatedWaitTime: Int
    let openingHours: String
    let isOpen: Bool
    let isFavorite: Bool
}
