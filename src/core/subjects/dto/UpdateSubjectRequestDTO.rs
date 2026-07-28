use crate::core::subjects::models::SubjectStatus::SubjectStatus;
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct UpdateSubjectRequestDTO {
    pub code: Option<String>,
    pub slug: Option<String>,
    pub title: Option<String>,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub curriculum_id: Option<Uuid>,
    pub grade_id: Option<Uuid>,
    pub category_id: Option<Uuid>,
    pub language_code: Option<String>,

    pub cover_image_url: Option<String>,
    pub icon_url: Option<String>,
    pub theme_color: Option<String>,
    pub display_order: Option<i32>,

    pub estimated_hours: Option<i16>,

    pub status: Option<SubjectStatus>,
    pub is_featured: Option<bool>,
    pub is_free: Option<bool>,

    pub published_at: Option<DateTime<Utc>>,
    pub archived_at: Option<DateTime<Utc>>,
}
