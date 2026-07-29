use crate::core::topics::models::TopicStatus::TopicStatus;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct UpdateTopicRequestDTO {
    pub code: Option<String>,
    pub slug: Option<String>,

    pub title: Option<String>,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub term: Option<i16>,

    pub display_order: Option<i32>,

    pub estimated_hours: Option<i16>,

    pub status: Option<TopicStatus>,

    pub is_featured: Option<bool>,
    pub is_free: Option<bool>,
}
