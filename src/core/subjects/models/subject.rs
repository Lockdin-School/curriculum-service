use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use uuid::Uuid;
use crate::core::subjects::models::SubjectStatus;

#[derive(Debug, Clone, Serialize, Deserialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Subject {
    // ---------------------------------------------------------------------
    // Identity
    // ---------------------------------------------------------------------
    pub id: Uuid,

    pub code: String,

    pub slug: String,

    pub title: String,

    pub short_description: Option<String>,

    pub description: Option<String>,

    // ---------------------------------------------------------------------
    // Classification
    // ---------------------------------------------------------------------

    pub curriculum_id: Uuid,

    pub grade_id: Uuid,

    pub category_id: Uuid,

    pub language_code: String,

    // ---------------------------------------------------------------------
    // Presentation
    // ---------------------------------------------------------------------

    pub cover_image_url: Option<String>,

    pub icon_url: Option<String>,

    pub theme_color: Option<String>,

    pub display_order: i32,

    // ---------------------------------------------------------------------
    // Metadata
    // ---------------------------------------------------------------------

    pub estimated_hours: Option<i16>,

    // ---------------------------------------------------------------------
    // Cached Statistics
    // ---------------------------------------------------------------------

    pub total_modules: i32,

    pub total_topics: i32,

    pub total_lessons: i32,

    pub total_resources: i32,

    pub total_quizzes: i32,

    pub total_assignments: i32,

    pub total_exams: i32,

    // ---------------------------------------------------------------------
    // Status
    // ---------------------------------------------------------------------

    pub status: SubjectStatus,

    pub is_featured: bool,

    pub is_free: bool,

    // ---------------------------------------------------------------------
    // Versioning
    // ---------------------------------------------------------------------

    pub version: i32,

    // ---------------------------------------------------------------------
    // Audit
    // ---------------------------------------------------------------------

    pub created_at: DateTime<Utc>,

    pub updated_at: DateTime<Utc>,

    pub published_at: Option<DateTime<Utc>>,

    pub archived_at: Option<DateTime<Utc>>,

    pub deleted_at: Option<DateTime<Utc>>,
}