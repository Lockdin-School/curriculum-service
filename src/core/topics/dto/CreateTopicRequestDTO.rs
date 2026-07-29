use crate::core::topics::models::TopicStatus::TopicStatus;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateTopicRequestDTO {
    pub code: String,
    pub slug: String,

    pub title: String,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub subject_id: Uuid,

    pub term: i16,

    pub display_order: i32,

    pub estimated_hours: Option<i16>,

    pub status: Option<TopicStatus>,
    pub is_featured: bool,
    pub is_free: bool,
}
