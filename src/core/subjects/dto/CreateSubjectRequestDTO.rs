use serde::{Deserialize, Serialize};
use uuid::Uuid;
use crate::core::subjects::models::SubjectStatus::SubjectStatus;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct CreateSubjectRequestDTO {
    pub code: String,
    pub slug: String,
    pub title: String,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub curriculum_id: Uuid,
    pub grade_id: Uuid,
    pub category_id: Uuid,
    pub language_code: Option<String>,

    pub cover_image_url: Option<String>,
    pub icon_url: Option<String>,
    pub theme_color: Option<String>,
    pub display_order: Option<i32>,

    pub estimated_hours: Option<i16>,

    pub status: Option<SubjectStatus>,
    pub is_featured: Option<bool>,
    pub is_free: Option<bool>,
}