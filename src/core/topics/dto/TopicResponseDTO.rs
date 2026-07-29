use crate::core::topics::models::Topic::Topic;
use crate::core::topics::models::TopicStatus::TopicStatus;
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicResponseDTO {
    pub id: Uuid,

    pub code: String,
    pub slug: String,

    pub title: String,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub subject_id: Uuid,

    pub term: i16,

    pub display_order: i32,

    pub estimated_hours: Option<i16>,

    pub total_lessons: i32,
    pub total_resources: i32,
    pub total_quizzes: i32,
    pub total_assignments: i32,

    pub status: TopicStatus,

    pub is_featured: bool,
    pub is_free: bool,

    pub version: i32,

    pub created_at: DateTime<Utc>,
    pub updated_at: DateTime<Utc>,
    pub published_at: Option<DateTime<Utc>>,
    pub archived_at: Option<DateTime<Utc>>,
}

impl From<Topic> for TopicResponseDTO {
    fn from(t: Topic) -> Self {
        Self {
            id: t.id,
            code: t.code,
            slug: t.slug,
            title: t.title,
            short_description: t.short_description,
            description: t.description,
            subject_id: t.subject_id,
            term: t.term,
            display_order: t.display_order,
            estimated_hours: t.estimated_hours,
            total_lessons: t.total_lessons,
            total_resources: t.total_resources,
            total_quizzes: t.total_quizzes,
            total_assignments: t.total_assignments,
            status: t.status,
            is_featured: t.is_featured,
            is_free: t.is_free,
            version: t.version,
            created_at: t.created_at,
            updated_at: t.updated_at,
            published_at: t.published_at,
            archived_at: t.archived_at,
        }
    }
}
