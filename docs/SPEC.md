# 🚀 Project Specification: Command Mission Control Dashboard

## 1. Technical Stack & Architecture

- **Framework**: Astro (SSR Mode enabled)
- **Database**: Supabase (PostgreSQL) with `@supabase/supabase-js`
- **Frontend Logic**:
  - **HTMX**: For seamless CRUD operations (Add/Delete/Edit) without page reloads.
  - **Alpine.js**: For client-side UI states (Modals, Theme Switching, Mobile Menu).
- **Styling**: Tailwind CSS (Neo-Brutalist / Terminal UI style).

## 2. Database Schema (Supabase)

- **Schema**: `link_dashboard` (All queries must target this schema).
- **Table: `links`**
  - `id`: UUID (Primary Key, default: `gen_random_uuid()`).
  - `user_id`: UUID (default: `'00000000-0000-0000-0000-000000000000'`).
  - `category_name`: TEXT (Used for grouping links into panels).
  - `title`: TEXT (Display name of the link).
  - `url`: TEXT (Destination URL).
  - `description`: TEXT (Short description/notes).
  - `created_at`: TIMESTAMPTZ (default: `now()`).

## 3. Visual Design & Color Palettes

Reference: `docs/DESIGN.md`

## 4. UI Components & Layout

- **Global Borders**: Thick geometric top and bottom borders (1px or 2px black lines).
- **Header**: Large bold title "COMMAND", subtitle "MISSION CONTROL", and a real-time clock.
- **Navigation**: Blocky uppercase tabs (e.g., WORK, LEARNING, NEWS). Active tab has inverted colors.
- **Category Panels**: Horizontal sections with a header containing `+ ADD` and `DEL` buttons.
- **Link Cards**: Minimalist layout with title and description.
- **Modals**: Centered overlays with sharp 1px borders and high-contrast input fields.

## 5. Development Logic (AHA Stack)

- **SSR**: `index.astro` fetches all categories and links on the server.
- **Partials**: Create `src/pages/partials/` for HTMX to fetch HTML fragments.
- **HTMX Ops**:
  - `hx-delete`: Deletes a link and removes its element from the DOM.
  - `hx-post`: Submits the "Add Link" form, inserts to Supabase, and prepends the new HTML fragment to the list.
- **Alpine.js**: Manage the `open` state of modals (`x-data="{ open: false }"`) and theme toggling.
