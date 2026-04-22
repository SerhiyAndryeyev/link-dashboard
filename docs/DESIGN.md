# Design Specification: "Command Mission Control" Style

## 1. Visual Philosophy (Neo-Brutalism)

Based on references `image_1.png` through `image_5.png`.

- **Core Concept**: Functional, high-contrast, grid-based layout. Looks like a terminal or terminal-based UI (TUI).

- **Typography**: Strictly Monospace fonts (e.g., JetBrains Mono, Fira Code, or System Mono).
- **Borders**: Sharp corners (no border-radius), thin consistent geometric borders (1px).
- **No Shadows**: All elements are flat. Contrast is achieved through color blocks, not depth.

## 2. Layout & Structure

- **Global**: Page should have a thick top and bottom border (black/dark geometric line) like in `image_4.png`.
- **Header**: Large, bold, uppercase site title ("COMMAND", "LINKS", etc.) and subtitle ("MISSION CONTROL"). Include date/time on the right.
- **Navigation (Tabs)**: Use uppercase text in blocky "tabs". Active tab has reversed colors (dark background, light text). Look at `image_3.png`.
- **Categories**: Each category is a distinct horizontal panel with a 1px border.
- **Link Items**: Minimalist list. Optional drag-handle icon (6 dots) on the left. Hover state should provide clear feedback (slight background change).

## 3. UI Elements (Alpine.js Modals)

Based on `image_1.png` and `image_2.png`.

- **Modals**: Centered overlay. Sharp 1px borders. White/Very light background in Light mode.
- **Form Inputs**: Flat, sharp corners. Contrast border (1px). Text in Monospace.
- **Buttons**:
- **Cancel**: Reverse/Outline style (white bg, dark text, dark border).
- **Action (Add/Rename)**: Solid "Orange" background. Uppercase text.

## 4. Color Palettes (Tailwind CSS)

_Note: The user requested a slightly lighter orange accent for better visibility._

### A. Theme: Light (Default)

Based on `image_4.png` (warm beige aesthetic).

| Element              | CSS Value | Note                                      |
| :------------------- | :-------- | :---------------------------------------- |
| **Page Background**  | `#F3F0E8` | Warm, off-white/beige                     |
| **Card/Panel BG**    | `#F3F0E8` | Same as background                        |
| **Text (Primary)**   | `#111111` | Almost black                              |
| **Text (Secondary)** | `#555555` | Gray for descriptions                     |
| **Borders/Lines**    | `#111111` | Thin, sharp black lines                   |
| **Active Tab BG**    | `#111111` | Black block                               |
| **Active Tab Text**  | `#F3F0E8` | Light text on black                       |
| **Accent (Orange)**  | `#FF6B35` | _Lighter/Vibrant_ orange (Action buttons) |

### B. Theme: Dark

Based on `image_3.png` (classic terminal look).

| Element              | CSS Value | Note                                  |
| :------------------- | :-------- | :------------------------------------ |
| **Page Background**  | `#080808` | Almost pure black                     |
| **Card/Panel BG**    | `#080808` | Same as background                    |
| **Text (Primary)**   | `#EEEEEE` | Off-white                             |
| **Text (Secondary)** | `#AAAAAA` | Light gray                            |
| **Borders/Lines**    | `#333333` | Dark gray geometric lines             |
| **Active Tab BG**    | `#EEEEEE` | Light block                           |
| **Active Tab Text**  | `#080808` | Black text on light                   |
| **Accent (Orange)**  | `#FF8C61` | _Lighter/Softer_ orange for Dark mode |
