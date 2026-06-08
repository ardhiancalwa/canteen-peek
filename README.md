# CanteenPeek

**CanteenPeek** is a SwiftUI-based iOS prototype that helps students check canteen queue conditions, menu availability, and crowd reports before deciding whether to visit the campus canteen.

> Check the queue before you take the walk.

This project is designed as an iOS portfolio mini project. The MVP focuses on one canteen tenant and solves one clear problem: students often do not know the canteen condition before they go.

## Overview

CanteenPeek is not a food ordering app. It is a decision-support app that gives students quick visibility into the current canteen situation.

Campus canteens often become crowded during peak hours, especially in the morning and around lunch time. Students may waste their limited break time because they have to physically visit the canteen just to check the queue, food availability, or waiting time.

CanteenPeek helps reduce that uncertainty by showing:

- Current queue status
- Estimated waiting time
- Menu availability
- Peak hour insight
- Simple crowd report submission

## Problem

Students often visit the campus canteen during peak hours without knowing the queue condition, food availability, or estimated waiting time.

The core problem is not ordering food. The real problem is the lack of canteen visibility before students decide where and when to eat.

Key pain points:

- Long queues during busy hours
- Students must go downstairs just to check the canteen condition
- Favorite menu items may be sold out before students arrive
- No real-time visibility into crowd level
- No simple way for students to share canteen condition updates

## Solution

CanteenPeek provides a focused SwiftUI prototype for one canteen tenant. The app gives students the information they need before walking to the canteen.

The product helps students answer simple but important questions:

- Is the canteen quiet or crowded right now?
- Is my menu still available?
- How long might I need to wait?
- Is this a good time to go?
- Can I report the current condition after visiting?

## MVP Features

- **Onboarding**: Introduces the app's purpose and the core problem.
- **Canteen Home**: Shows tenant name, location, open status, queue status, estimated wait time, and menu highlights.
- **Queue Status**: Displays queue condition using clear labels such as `Sepi`, `Normal`, `Ramai`, and `Sangat Ramai`.
- **Menu Availability**: Displays menu stock status using `Tersedia`, `Hampir Habis`, and `Habis`.
- **Menu List**: Shows menu items, prices, categories, and availability.
- **Quick Report**: Allows students to submit a simple canteen condition report.
- **Peak Hour Insight**: Shows dummy/historical crowd insight to help students choose a better time to visit.

## Current Scope

The MVP intentionally focuses on one tenant only. This keeps the project focused on the visibility problem instead of expanding too early into ordering, payment, cashier systems, or tenant dashboards.

Out of scope for the MVP:

- Multi-tenant discovery
- Food ordering
- Payment system
- Full cashier system
- Tenant dashboard
- Real-time backend
- Delivery
- Full inventory management

## Status Systems

### Queue Status

| Enum | Label | Meaning |
|---|---|---|
| `quiet` | Sepi | Hampir tidak ada antrean |
| `normal` | Normal | Antrean masih wajar |
| `crowded` | Ramai | Antrean cukup panjang |
| `veryCrowded` | Sangat Ramai | Antrean panjang dan waktu tunggu tinggi |

### Menu Availability

| Enum | Label | Meaning |
|---|---|---|
| `available` | Tersedia | Menu masih aman |
| `almostSoldOut` | Hampir Habis | Stok terbatas |
| `soldOut` | Habis | Menu tidak tersedia |

## Tech Stack

- **Swift**
- **SwiftUI**
- **MVVM**
- **SwiftData** for future local persistence
- **Swift Charts** for peak hour insight
- **Local JSON** for dummy tenant and menu data
- **SF Symbols** for native iOS iconography
- **UserDefaults** for simple preferences
- **Local Notification** for future lunch reminder concept
- **Accessibility Labels** for VoiceOver support

## Architecture Plan

```text
CanteenPeek
+-- App
|   +-- CanteenPeekApp.swift
+-- Theme
|   +-- AppTheme.swift
+-- Models
|   +-- StatusSystems.swift
|   +-- Tenant.swift
|   +-- MenuItem.swift
|   +-- CrowdReport.swift
|   +-- PeakHourData.swift
+-- ViewModels
|   +-- CanteenHomeViewModel.swift
|   +-- MenuListViewModel.swift
|   +-- ReportViewModel.swift
|   +-- InsightViewModel.swift
+-- Views
|   +-- OnboardingView.swift
|   +-- CanteenHomeView.swift
|   +-- MenuListView.swift
|   +-- ReportView.swift
|   +-- InsightView.swift
+-- Components
|   +-- QueueStatusBadge.swift
|   +-- AvailabilityBadge.swift
|   +-- MenuItemRow.swift
|   +-- SectionHeader.swift
+-- Services
|   +-- LocalDataService.swift
|   +-- ReportService.swift
|   +-- NotificationService.swift
+-- Resources
    +-- tenant.json
    +-- menus.json
```

## Design Direction

CanteenPeek follows a clean, modern, native iOS visual direction with a warm food-related feel.

Design principles:

- Clear status at a glance
- Low-friction reporting
- Decision-focused information
- Native SwiftUI interaction patterns
- Card-based layout
- Accessible status indicators that do not rely on color alone

## Accessibility

Accessibility is part of the product requirements, not an afterthought.

The app aims to support:

- Dynamic Type
- VoiceOver labels for queue and menu status
- Clear text labels for every status
- Sufficient color contrast
- Large enough touch targets
- Simple and understandable language
- Clear feedback for report success or failure

## Getting Started

### Requirements

- macOS with Xcode installed
- Xcode command line tools
- iOS Simulator
- Swift 5 or later

### Run the Project

1. Open `canteen-peek.xcodeproj` in Xcode.
2. Select an iOS Simulator.
3. Build and run the app with `Cmd + R`.

From terminal on macOS:

```bash
xcodebuild -project canteen-peek.xcodeproj -scheme canteen-peek -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## Development Status

This project is currently in progress.

Current foundation:

- Xcode SwiftUI project initialized
- Design system structure started
- Status system enums defined
- Reusable queue and availability badges started

Next planned work:

- Build core data models
- Add dummy local JSON data
- Implement Canteen Home screen
- Implement Menu List screen
- Implement Quick Report flow
- Add Peak Hour Insight screen

## Product Impact

CanteenPeek is designed to reduce uncertainty before students visit the canteen. By giving visibility into queue conditions and food availability, the app helps students make faster food decisions, avoid wasted trips, and use their break time more efficiently.

## Future Development

Potential future features:

- Multi-tenant support
- Real-time crowd report aggregation
- Tenant-side menu updates
- Digital queue estimation
- Peak hour prediction
- Tenant dashboard
- Expired date reminder
- Admin monitoring dashboard
- Pre-order system

## Reflection

The first step to improving the campus canteen experience is not necessarily building a full ordering system. The more focused starting point is reducing uncertainty before students go to the canteen.

The real problem is visibility.
