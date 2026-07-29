use crate::core::subjects::models::Subject::Subject;
use crate::core::subjects::models::SubjectStatus::SubjectStatus;
use crate::core::subjects::repository::SubjectRepository::SubjectRepository;

use crate::core::subjects::service::SubjectService::SubjectService;
use async_trait::async_trait;
use chrono::Utc;
use sqlx::Error as SqlxError;
use std::sync::Arc;
use uuid::Uuid;

struct MockSubjectRepository {
    subjects: Vec<Subject>,
    should_fail: bool,
}

#[async_trait]
impl SubjectRepository for MockSubjectRepository {
    async fn get_subjects(&self) -> sqlx::Result<Vec<Subject>, sqlx::Error> {
        if self.should_fail {
            Err(SqlxError::RowNotFound)
        } else {
            Ok(self.subjects.clone())
        }
    }
}

fn build_subject() -> Subject {
    Subject {
        id: Uuid::new_v4(),

        code: "MAT11".to_string(),
        slug: "mathematics-grade-11".to_string(),
        title: "Mathematics".to_string(),
        short_description: Some("Grade 11 Mathematics".to_string()),
        description: Some("CAPS Grade 11 Mathematics.".to_string()),

        curriculum_id: Uuid::new_v4(),
        grade_id: Uuid::new_v4(),
        category_id: Uuid::new_v4(),
        language_code: "en".to_string(),

        cover_image_url: None,
        icon_url: None,
        theme_color: None,
        display_order: 1,

        estimated_hours: Some(0),

        total_modules: 0,
        total_topics: 0,
        total_lessons: 0,
        total_resources: 0,
        total_quizzes: 0,
        total_assignments: 0,
        total_exams: 0,

        status: SubjectStatus::Published,

        is_featured: false,
        is_free: false,

        version: 1,

        created_at: Utc::now(),
        updated_at: Utc::now(),
        published_at: None,
        archived_at: None,
        deleted_at: None,
    }
}

#[tokio::test]
async fn search_subjects_returns_subjects_when_repository_succeeds() {
    let subject = build_subject();

    let service = SubjectService {
        repo: Arc::new(MockSubjectRepository {
            subjects: vec![subject.clone()],
            should_fail: false,
        }),
    };

    let result = service.search_subjects().await;

    assert!(result.is_ok());

    let subjects = result.unwrap();

    assert_eq!(subjects.len(), 1);
    assert_eq!(subjects[0].id, subject.id);
    assert_eq!(subjects[0].code, subject.code);
    assert_eq!(subjects[0].slug, subject.slug);
    assert_eq!(subjects[0].title, subject.title);
    assert_eq!(subjects[0].status, subject.status);
}

#[tokio::test]
async fn search_subjects_returns_empty_list_when_repository_returns_no_subjects() {
    let service = SubjectService {
        repo: Arc::new(MockSubjectRepository {
            subjects: vec![],
            should_fail: false,
        }),
    };

    let result = service.search_subjects().await;

    assert!(result.is_ok());

    let subjects = result.unwrap();

    assert!(subjects.is_empty());
}

#[tokio::test]
async fn search_subjects_returns_error_when_repository_fails() {
    let service = SubjectService {
        repo: Arc::new(MockSubjectRepository {
            subjects: vec![],
            should_fail: true,
        }),
    };

    let result = service.search_subjects().await;

    assert!(result.is_err());

    let error = result.unwrap_err();

    assert_eq!(
        error.to_string(),
        "no rows returned by a query that expected to return at least one row"
    );
}
