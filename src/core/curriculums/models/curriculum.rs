// CREATE TABLE curriculums (
//
//                              id UUID PRIMARY KEY,
//
//                              code VARCHAR(20) NOT NULL UNIQUE,
//                              name VARCHAR(100) NOT NULL,
//
//                              short_name VARCHAR(20),
//
//                              slug VARCHAR(100) NOT NULL UNIQUE,
//
//                              description TEXT,
//
//                              country_code CHAR(2) NOT NULL,
//
//                              version VARCHAR(20),
//
//                              status curriculum_status
//                                  NOT NULL DEFAULT 'active',
//
//                              display_order INTEGER NOT NULL DEFAULT 0,
//
//                              created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
//                              updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
//
//                              CONSTRAINT chk_curriculum_display_order
//                                  CHECK (display_order >= 0)
// );

use uuid::Uuid;

pub struct Curriculum {
    pub id: Uuid,

    pub code: String,

    pub name: String,

    pub short_name: Option<String>,

    pub slug: String,

    pub description: Option<String>,

    pub country_code: String,

    pub version: Option<String>,

    pub status: String,

    pub display_order: i32,

    pub created_at: chrono::DateTime<chrono::Utc>,

    pub updated_at: chrono::DateTime<chrono::Utc>,
}
