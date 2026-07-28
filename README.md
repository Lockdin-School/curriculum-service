# Lockdin School Server

Backend server for the Lockdin School platform.

This project is a Rust-based HTTP API server built with **Actix Web**, **SQLx**, **Tokio**, and **PostgreSQL**. It provides a modular backend foundation for managing school-related domain data such as subjects, curriculums, grades, and subject categories.

---

## Table of Contents

- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Project Status](#project-status)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Core Domain](#core-domain)
- [Database](#database)
- [Migrations](#migrations)
- [Seed Data](#seed-data)
- [API Routes](#api-routes)
- [Logging Standard](#logging-standard)
- [Environment Variables](#environment-variables)
- [Running Locally](#running-locally)
- [Running with Docker Compose](#running-with-docker-compose)
- [Development Workflow](#development-workflow)
- [DTO Strategy](#dto-strategy)
- [Repository Pattern](#repository-pattern)
- [Error Handling](#error-handling)
- [CORS](#cors)
- [Dependencies](#dependencies)
- [Useful Commands](#useful-commands)
- [Future Improvements](#future-improvements)

---

## Overview

`lockdinschoolserver` is the backend API for a school learning/content platform.

The current implementation focuses on the **Subjects** domain and includes:

- PostgreSQL database connection
- Database migrations with `sqlx::migrate!`
- Subject schema and model definitions
- Subject repository abstraction
- PostgreSQL repository implementation
- Subject service layer
- Subject HTTP handler
- Subject response DTO mapping
- Structured log formatting
- Docker-based local development setup

The backend follows a layered structure:
```
HTTP/API Layer
↓
Handler Layer
↓
Service Layer
↓
Repository Layer
↓
Database Layer
```
---

## Tech Stack

| Area | Technology |
|---|---|
| Language | Rust |
| Web Framework | Actix Web |
| Async Runtime | Tokio |
| Database | PostgreSQL |
| Database Driver | SQLx |
| Serialization | Serde |
| Logging | log + env_logger |
| Environment Config | dotenv |
| CORS | actix-cors |
| UUID Support | uuid |
| Date/Time | chrono |
| Containerization | Docker + Docker Compose |

---

## Project Status

The project is in active development.

Currently implemented:

- Application bootstrap
- Environment variable loading
- PostgreSQL connection pool
- Database migrations
- Subject search/list endpoint
- Subject model
- Subject DTOs
- Subject repository trait
- PostgreSQL subject repository implementation
- Subject service
- Structured logs

Partially implemented or planned:

- Subject create/update/delete endpoints
- Authentication routes
- User routes
- Curriculum handlers/services/repositories
- Grade handlers/services/repositories
- Request validation
- Application-wide error response model
- Pagination and filtering
- Authorization
- Redis support

---

## Architecture

The backend is organized around a layered architecture.

### 1. Configuration Layer

Responsible for application setup:

- Server startup
- Route registration
- CORS configuration
- Application state initialization

Located in:
```
src/configuration
```
### 2. Core Layer

Contains domain-specific logic.

Located in:
```
src/core
```
Current core modules:
```
curriculums
grades
subjects
```
The most developed module currently is:
```
src/core/subjects
```
### 3. Infrastructure Layer

Contains external infrastructure integrations:

- Database connection
- Environment variable parsing

Located in:
```
src/infrastructure
```
---

## Project Structure
```
lockdinschoolserver
├── migrations
│   ├── 20260727104934_init_db_schemas.sql
│   ├── 20260727121541_seed_curriculums.sql
│   ├── 20260727123006_seed_grades.sql
│   ├── 20260727123816_seed_subject_categories.sql
│   └── 20260727124959_seed_subjects.sql
├── src
│   ├── configuration
│   │   ├── cors.rs
│   │   ├── mod.rs
│   │   ├── routes.rs
│   │   ├── server.rs
│   │   └── state.rs
│   ├── core
│   │   ├── curriculums
│   │   ├── grades
│   │   ├── mod.rs
│   │   └── subjects
│   │       ├── dto
│   │       │   ├── CreateSubjectRequestDTO.rs
│   │       │   ├── mod.rs
│   │       │   ├── SubjectResponseDTO.rs
│   │       │   └── UpdateSubjectRequestDTO.rs
│   │       ├── handlers.rs
│   │       ├── mod.rs
│   │       ├── models
│   │       │   ├── mod.rs
│   │       │   ├── Subject.rs
│   │       │   ├── SubjectCategory.rs
│   │       │   └── SubjectStatus.rs
│   │       ├── repository
│   │       │   ├── mod.rs
│   │       │   ├── SubjectRepository.rs
│   │       │   └── SubjectRepositoryImpl.rs
│   │       └── service.rs
│   ├── infrastructure
│   │   ├── db
│   │   ├── environment_variables.rs
│   │   └── mod.rs
│   └── main.rs
├── Cargo.toml
├── Cargo.lock
├── compose.yaml
├── Dockerfile.dev
├── .dockerignore
└── .env
```
---

## Core Domain

The backend currently defines the following core database entities:

### Subject Categories

Subject categories group subjects into broad areas.

Examples:

| Code | Name | Description |
|---|---|---|
| STEM | STEM | Science, Technology, Engineering and Mathematics |
| LANG | Languages | Language subjects |
| HUM | Humanities | Humanities subjects |
| COMM | Commerce | Commerce subjects |
| ART | Arts | Creative and Performing Arts |
| TECH | Technology | Technology subjects |
| LIFE | Life Orientation | Life Orientation |

### Curriculums

Curriculums represent education systems or curriculum versions.

The schema supports:

- Code
- Name
- Short name
- Slug
- Country code
- Version
- Status
- Display ordering

Supported curriculum statuses:
```
draft
active
retired
```
### Grades

Grades represent school grades.

The current schema validates grades between:
```
8 and 12
```
### Subjects

Subjects are the main educational content grouping.

A subject contains:

- Identity fields
- Classification fields
- Presentation fields
- Learning metadata
- Cached statistics
- Visibility/status fields
- Versioning
- Audit timestamps
- Soft-delete timestamp

Supported subject statuses:
```
draft
published
archived
```
---

## Database

The project uses PostgreSQL.

Database access is handled through:
```
sqlx
```
Connection pooling is handled with:
```
PgPoolOptions
```
The application reads the database URL from:
```
DATABASE_URL_INTERNAL
```
The database connection pool currently uses:
```
max_connections = 10
```
---

## Migrations

Database migrations are stored in:
```
migrations/
```
Migrations are run automatically during application state initialization using:
```
sqlx::migrate!("./migrations")
```
The initial schema migration creates:

- `subject_categories`
- `curriculums`
- `grades`
- `subject_status` enum
- `subjects`

It also creates indexes for common queries, including:

- Subject foreign key lookups
- Subject listing queries
- Display ordering
- Recently updated subjects
- Recently published subjects
- Featured subjects
- Free subjects
- Active/non-soft-deleted subjects

---

## Seed Data

The project includes SQL seed migrations for initial data.

Current seed migrations include:
```
20260727121541_seed_curriculums.sql
20260727123006_seed_grades.sql
20260727123816_seed_subject_categories.sql
20260727124959_seed_subjects.sql
```
Seed inserts use conflict-safe behavior where applicable, for example:
```
ON CONFLICT (code) DO NOTHING;
```
This allows seed migrations to avoid duplicate inserts for unique codes.

---

## API Routes

Routes are registered under:
```
/api/v1
```
Current route scopes:
```
/api/v1/auth
/api/v1/subjects
/api/v1/users
```
### Subjects

Current implemented subject endpoint:
```
GET /api/v1/subjects/
```
Purpose:
```
Search/list subjects
```
Current behavior:

- Receives HTTP request
- Calls subject service
- Service calls subject repository
- Repository fetches subjects from PostgreSQL
- Handler maps database models to response DTOs
- Returns JSON response

Example response shape:
```
[
    {
        "id": "uuid",
        "code": "MATH",
        "slug": "mathematics",
        "title": "Mathematics",
        "shortDescription": "Mathematics subject",
        "description": "Detailed subject description",
        "curriculumId": "uuid",
        "gradeId": "uuid",
        "categoryId": "uuid",
        "languageCode": "en",
        "coverImageUrl": null,
        "iconUrl": null,
        "themeColor": null,
        "displayOrder": 1,
        "estimatedHours": 120,
        "totalModules": 0,
        "totalTopics": 0,
        "totalLessons": 0,
        "totalResources": 0,
        "totalQuizzes": 0,
        "totalAssignments": 0,
        "totalExams": 0,
        "status": "Published",
        "isFeatured": false,
        "isFree": false,
        "version": 1,
        "createdAt": "2026-07-28T10:00:00Z",
        "updatedAt": "2026-07-28T10:00:00Z",
        "publishedAt": null,
        "archivedAt": null
    }
]
```
---

## Logging Standard

The project uses `log` and `env_logger`.

Logs are formatted as table-like rows.

Current logger output structure:
```
| timestamp | level | target | message |
```
Example:
```
| 2026-07-28T11:02:55.576Z | INFO  | lockdinschoolserver::core::subjects::handlers | subjects.search.request.received | handler | search_subjects | started | "Received request to search subjects" | |
```
Application log payloads use this internal column convention:
```
event | layer | action | status | message | metadata
```
Full output becomes:
```
timestamp | level | target | event | layer | action | status | message | metadata
```
### Log Event Format
```
<resource>.<action>.<stage>
```
Examples:
```
subjects.search.request.received
subjects.search.start
subjects.search.success
subjects.search.failed
subjects.search.response.sent
subjects.search.request.failed
```
### Layer Values

Use the layer that emits the log line.

Valid examples:
```
handler
service
repository
database
configuration
server
http
```
### Status Values

Recommended statuses:
```
started
success
failed
completed
skipped
retrying
```
### Example Handler Logs
```
log::info!(
"subjects.search.request.received | handler | search_subjects | started | \"Received request to search subjects\" |"
);
```

```
log::info!(
"subjects.search.response.sent | handler | search_subjects | success | \"Subjects search response sent successfully\" |"
);
```

```
log::error!(
"subjects.search.request.failed | handler | search_subjects | failed | \"Failed to handle subjects search request\" | error=\"{e}\""
);
```
### Example Service Logs
```
log::info!(
"subjects.search.start | service | search_subjects | started | \"Searching subjects\" |"
);
```

```
log::info!(
"subjects.search.success | service | search_subjects | success | \"Searched subjects successfully\" | count={}",
subjects.len()
);
```

```
log::error!(
"subjects.search.failed | service | search_subjects | failed | \"Failed to search subjects\" | error=\"{e}\""
);
```
---

## Environment Variables

The project uses `.env` through the `dotenv` crate.

Expected environment variables:

| Variable | Required | Default | Description |
|---|---:|---|---|
| `HOST` | No | `0.0.0.0` | Host address the server binds to |
| `PORT` | No | `8000` | Port the server listens on |
| `FRONTEND_ORIGIN` | No | `http://localhost:3000` | Frontend origin for CORS configuration |
| `DATABASE_URL_INTERNAL` | Yes | none | PostgreSQL connection URL used by the application |
| `RUST_LOG` | No | `info` | Logging filter level |
| `POSTGRES_USER` | Yes for Docker DB | none | PostgreSQL username |
| `POSTGRES_PASSWORD` | Yes for Docker DB | none | PostgreSQL password |
| `POSTGRES_DB` | Yes for Docker DB | none | PostgreSQL database name |

Example `.env`:
```
HOST=0.0.0.0
PORT=8080
FRONTEND_ORIGIN=http://localhost:3000

RUST_LOG=info

POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=lockdinschool

DATABASE_URL_INTERNAL=postgres://postgres:postgres@db:5433/lockdinschool
```
For local non-Docker execution, the database URL may look like:
```
DATABASE_URL_INTERNAL=postgres://postgres:postgres@localhost:5433/lockdinschool
```
---

## Running Locally

### Prerequisites

Install:

- Rust
- Cargo
- PostgreSQL
- Docker and Docker Compose, if using containers

Check Rust installation:
```
rustc --version
cargo --version
```
### Install dependencies

Cargo resolves dependencies automatically:
```
cargo build
```
### Run the server locally

Make sure PostgreSQL is running and `.env` is configured.

Then run:
```
cargo run
```
The server will:

1. Load `.env`
2. Initialize logging
3. Initialize application state
4. Connect to PostgreSQL
5. Run migrations
6. Start the HTTP server

---

## Running with Docker Compose

The project includes:
```
compose.yaml
Dockerfile.dev
```
### Start services
```
docker compose up --build
```
This starts:

- Rust application container
- PostgreSQL container

The app container is named:
```
web-server
```
The database container is named:
```
postgresdb
```
### Ports

App container:
```
8080:8080
```
Database container:
```
5433:5433
```
### Stop services
```
docker compose down
```
### Stop services and remove volumes
```
docker compose down -v
```
Use this when you want to reset the database volume.

---

## Development Workflow

Recommended development cycle:
```
cargo fmt
cargo check
cargo build
cargo run
```
### Formatting
```
cargo fmt
```
### Type checking
```
cargo check
```
### Build
```
cargo build
```
### Run
```
cargo run
```
### Run with logs
```
RUST_LOG=debug cargo run
```
Or set in `.env`:
```
RUST_LOG=debug
```
---

## DTO Strategy

Database models should not be returned directly from API handlers.

The project uses DTOs for API boundaries.

Current subject DTOs:
```
CreateSubjectRequestDTO
SubjectResponseDTO
UpdateSubjectRequestDTO
```
### SubjectResponseDTO

Used for API responses.

It intentionally excludes some internal database fields, such as:
```
deleted_at
```
This prevents exposing internal soft-delete state to regular clients.

### CreateSubjectRequestDTO

Used for subject creation payloads.

This DTO should contain fields that clients are allowed to provide when creating a subject.

### UpdateSubjectRequestDTO

Used for subject update payloads.

Most fields should be optional to support partial updates.

---

## Repository Pattern

The project uses a repository trait to separate domain/service logic from database implementation details.

Subject repository abstraction:
```
SubjectRepository
```
PostgreSQL implementation:
```
PostgresSubjectRepository
```
Current implemented method:
```
get_subjects
```
Planned repository methods:
```
get_subject
create_subject
update_subject
delete_subject
```
This pattern allows the service layer to depend on an abstraction instead of directly depending on SQLx queries.

---

## Service Layer

The service layer contains business logic.

Subject service:
```
SubjectService
```
Current method:
```
search_subjects
```
Responsibilities:

- Emit service-level logs
- Call repository methods
- Convert infrastructure/database errors into service-level errors
- Return domain results to handlers

---

## Handler Layer

Handlers are the HTTP/API entrypoint.

Subject handler:
```
search_subjects
```
Responsibilities:

- Receive HTTP request
- Emit handler-level logs
- Call service methods
- Map models to DTOs
- Return HTTP responses

Current endpoint:

[//]: # (http) 
```
GET /api/v1/subjects/
```
---

## Error Handling

Current error handling is minimal and still evolving.

Current behavior:

- Repository returns `sqlx::Error`
- Service maps database errors into `std::io::Error`
- Handler converts errors into Actix HTTP responses

Current example:

[//]: # (rust)
```
Err(Error::other(e.to_string()))
```
Recommended future direction:

- Create a custom application error enum
- Implement `ResponseError` for API errors
- Standardize error response bodies
- Avoid leaking raw internal database errors to clients

Recommended future API error shape:

[//]: # (json)
```
{
    "error": 
        {
            "code": "SUBJECTS_SEARCH_FAILED",
            "message": "Failed to search subjects",
            "requestId": "optional-request-id"
        }
}
```
---

## CORS

CORS is configured in:
```
src/configuration/cors.rs
```
Current behavior:

- Allows any origin
- Allows methods:
  - `GET`
  - `POST`
  - `DELETE`
  - `PUT`
- Allows headers:
  - `Authorization`
  - `Content-Type`
- Supports credentials
- Sets max age to `3600`

Current development behavior is permissive.

For production, replace `allow_any_origin()` with an explicit allowed origin based on:
```
FRONTEND_ORIGIN
```
---

## Dependencies

Current dependencies include:

| Dependency | Purpose |
|---|---|
| `actix-web` | HTTP server and routing |
| `actix-cors` | CORS middleware |
| `tokio` | Async runtime |
| `sqlx` | PostgreSQL access and migrations |
| `serde` | Serialization/deserialization |
| `serde_json` | JSON support |
| `uuid` | UUID support |
| `chrono` | Date/time handling |
| `dotenv` | `.env` file loading |
| `log` | Logging facade |
| `env_logger` | Logger implementation |
| `async-trait` | Async trait support |
| `rand` | Random utilities |

SQLx features enabled:
```
runtime-tokio
chrono
tls-rustls
postgres
uuid
```
These are required for:

- Tokio runtime support
- PostgreSQL support
- UUID database decoding/encoding
- Chrono timestamp decoding/encoding
- Rustls TLS support

---

## Useful Commands

### Build
```
cargo build
```
### Run
```
cargo run
```
### Check
```
cargo check
```
### Format
```
cargo fmt
```
### Clean build artifacts
```
cargo clean
```
### Start Docker services
```
docker compose up --build
```
### Stop Docker services
```
docker compose down
```
### Reset Docker database volume
```
docker compose down -v
```
### View running containers
```
docker ps
```
### View app logs
```
docker logs web-server
```
### View database logs
```
docker logs postgresdb
```
---

## API Testing

### List subjects
```
curl http://localhost:8080/api/v1/subjects/
```
If running locally on the default non-Docker port:
```
curl http://localhost:8000/api/v1/subjects/
```
---

## Database Schema Summary

### subject_categories

Stores subject grouping categories.

Important fields:
```
id
code
name
slug
description
icon_url
theme_color
display_order
is_active
created_at
updated_at
```
### curriculums

Stores curriculum definitions.

Important fields:
```
id
code
name
short_name
slug
description
country_code
version
status
display_order
created_at
updated_at
```
### grades

Stores school grades.

Important fields:
```
id
grade
name
display_order
is_active
created_at
updated_at
```
### subjects

Stores school subjects.

Important fields:
```
id
code
slug
title
short_description
description
curriculum_id
grade_id
category_id
language_code
cover_image_url
icon_url
theme_color
display_order
estimated_hours
total_modules
total_topics
total_lessons
total_resources
total_quizzes
total_assignments
total_exams
status
is_featured
is_free
version
created_at
updated_at
published_at
archived_at
deleted_at
```
---

## Naming Conventions

Current project naming uses PascalCase module filenames such as:
```
Subject.rs
SubjectStatus.rs
SubjectRepository.rs
SubjectRepositoryImpl.rs
```
The project currently allows non-snake-case module names using:
```
#![allow(non_snake_case)]
```
Rust convention usually prefers snake_case filenames and modules.

---

## Current Known Considerations

### 1. CORS is permissive

Current CORS uses:
```
allow_any_origin
```
This is convenient for development but should be restricted in production.

### 2. Error handling is basic

The project currently converts service errors into generic HTTP responses.

A custom application error type is recommended.

### 3. Repository methods are incomplete

Only subject listing is currently implemented.

Remaining methods should be completed:
```
text
get_subject
create_subject
update_subject
delete_subject
```
### 4. Request validation is not yet implemented

DTOs currently deserialize request bodies, but validation rules should be added.

### 5. Pagination is not yet implemented

Subject listing currently fetches all subjects.

Production endpoints should support:
```
text
limit
offset
page
pageSize
sort
filters
```
### 6. Authentication routes are scoped but not implemented

The `/api/v1/auth` route scope exists but currently has no registered handlers.

### 7. User routes are scoped but not implemented

The `/api/v1/users` route scope exists but currently has no registered handlers.

---

## Recommended Next Steps

### Subjects

- Implement `GET /api/v1/subjects/{id}`
- Implement `POST /api/v1/subjects`
- Implement `PUT /api/v1/subjects/{id}`
- Implement `DELETE /api/v1/subjects/{id}`
- Add pagination to subject search
- Add filters:
  - curriculum
  - grade
  - category
  - status
  - featured
  - free
  - language

### Errors

- Add custom `AppError`
- Implement `ResponseError`
- Standardize error JSON output
- Add error codes

### Logging

- Add request IDs
- Include request IDs in handler/service/repository logs
- Consider migrating to `tracing` for span-based request logging

### Security

- Implement authentication
- Add authorization guards
- Restrict CORS in production
- Avoid logging sensitive secrets

### Database

- Add update triggers for `updated_at`
- Add more seed data
- Add test database setup
- Add indexes based on real query patterns

### Testing

- Add unit tests for services
- Add repository integration tests
- Add handler/API tests
- Add migration verification in CI

---

## License

License information has not yet been specified.

Add the project license here before public distribution.

---

## Maintainers

1. Somelele Quse - quse@mergenti.com

```
