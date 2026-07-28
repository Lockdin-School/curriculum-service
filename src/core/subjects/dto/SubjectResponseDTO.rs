use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::core::subjects::models::Subject::Subject;
use crate::core::subjects::models::SubjectStatus::SubjectStatus;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SubjectResponseDTO {
    pub id: Uuid,

    pub code: String,
    pub slug: String,
    pub title: String,
    pub short_description: Option<String>,
    pub description: Option<String>,

    pub curriculum_id: Uuid,
    pub grade_id: Uuid,
    pub category_id: Uuid,
    pub language_code: String,

    pub cover_image_url: Option<String>,
    pub icon_url: Option<String>,
    pub theme_color: Option<String>,
    pub display_order: i32,

    pub estimated_hours: Option<i16>,

    pub total_modules: i32,
    pub total_topics: i32,
    pub total_lessons: i32,
    pub total_resources: i32,
    pub total_quizzes: i32,
    pub total_assignments: i32,
    pub total_exams: i32,

    pub status: SubjectStatus,
    pub is_featured: bool,
    pub is_free: bool,

    pub version: i32,

    pub created_at: DateTime<Utc>,
    pub updated_at: DateTime<Utc>,
    pub published_at: Option<DateTime<Utc>>,
    pub archived_at: Option<DateTime<Utc>>,
}

impl From<Subject> for SubjectResponseDTO {
    fn from(subject: Subject) -> Self {
        Self {
            id: subject.id,

            code: subject.code,
            slug: subject.slug,
            title: subject.title,
            short_description: subject.short_description,
            description: subject.description,

            curriculum_id: subject.curriculum_id,
            grade_id: subject.grade_id,
            category_id: subject.category_id,
            language_code: subject.language_code,

            cover_image_url: subject.cover_image_url,
            icon_url: subject.icon_url,
            theme_color: subject.theme_color,
            display_order: subject.display_order,

            estimated_hours: subject.estimated_hours,

            total_modules: subject.total_modules,
            total_topics: subject.total_topics,
            total_lessons: subject.total_lessons,
            total_resources: subject.total_resources,
            total_quizzes: subject.total_quizzes,
            total_assignments: subject.total_assignments,
            total_exams: subject.total_exams,

            status: subject.status,
            is_featured: subject.is_featured,
            is_free: subject.is_free,

            version: subject.version,

            created_at: subject.created_at,
            updated_at: subject.updated_at,
            published_at: subject.published_at,
            archived_at: subject.archived_at,
        }
    }
}