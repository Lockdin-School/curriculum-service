use crate::core::topics::models::TopicStatus::TopicStatus;
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize, FromRow)]
pub struct Topic {
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
    // Relationships
    // ---------------------------------------------------------------------
    pub subject_id: Uuid,

    // ---------------------------------------------------------------------
    // Curriculum
    // ---------------------------------------------------------------------
    pub term: i16,

    pub display_order: i32,

    pub estimated_hours: Option<i16>,

    // ---------------------------------------------------------------------
    // Cached Statistics
    // ---------------------------------------------------------------------
    pub total_lessons: i32,

    pub total_resources: i32,

    pub total_quizzes: i32,

    pub total_assignments: i32,

    // ---------------------------------------------------------------------
    // Status
    // ---------------------------------------------------------------------
    pub status: TopicStatus,

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
