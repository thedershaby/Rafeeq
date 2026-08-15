# Rafeeq 🐾

A peer-to-peer pet boarding platform ("Airbnb for pets"), built for the Egyptian market as a university project for the Business Informatics & Data Analysis program at Université Française d'Égypte (UFE).

## Overview

Rafeeq connects pet owners with local pet sitters. Owners can book trusted sitters for their pets while traveling, sitters build a profile and accept bookings, and the platform handles payments and reviews after each stay.

## Tech Stack

- **Database:** SQL Server (T-SQL)
- **Design:** ERD modeled in Chen notation

## Database Design

The schema is built around 6 entities:

| Entity | Purpose |
|---|---|
| `Users` | Shared table for owners and sitters, distinguished by a `role` field |
| `Sitter_Profile` | Sitter-specific data (1-to-1 with Users) |
| `Pet` | Pets belonging to an owner (1-to-many with Users) |
| `Booking` | Links a Pet to a Sitter_Profile for a date range |
| `Payment` | One payment per Booking (1-to-1) |
| `Review` | One review per Booking (1-to-1) |

See [`docs/erd.html`](docs/erd.html) for the full entity-relationship diagram.

### Key design decisions

- Single `Users` table with a `role` column (`owner` / `sitter`) instead of separate tables
- One pet per booking (no many-to-many)
- Boolean species-filter columns on `Sitter_Profile` (`accepts_dogs`, `accepts_cats`, etc.) instead of a junction table
- Payments are scoped only to bookings — no general e-commerce functionality
- Platform commission is handled as a constant in application code, not a database column

## Project Structure

```
rafeeq/
├── README.md
├── .gitignore
├── db/
│   ├── schema.sql              -- CREATE TABLE statements
│   ├── seed_data.sql           -- sample data (10+ rows per table)
└── docs/
    ├── Handwritten ERD.jpeg    -- Handwritten ERD
    └── erd.html                -- entity-relationship diagram
```

## Status

- [x] ERD designed and finalized
- [x] SQL Server schema created
- [x] Sample seed data

## Author

Mohamed — Data Science student, UFE Cairo
