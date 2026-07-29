use crate::core::topics::models::Topic::Topic;
use crate::core::topics::models::TopicStatus;
use crate::core::topics::repository::TopicRepository::TopicRepository;
use crate::core::topics::service::TopicService::TopicService;
use async_trait::async_trait;
use chrono::Utc;
use sqlx::Error as SqlxError;
use std::sync::Arc;
use uuid::Uuid;

struct MockTopicRepository {
    topics: Vec<Topic>,
    should_fail: bool,
}

#[async_trait]
impl TopicRepository for MockTopicRepository {
    async fn get_topics_by_subject_id(
        &self,
        _subject_id: Uuid,
    ) -> sqlx::Result<Vec<Topic>, sqlx::Error> {
        if self.should_fail {
            Err(SqlxError::RowNotFound)
        } else {
            Ok(self.topics.clone())
        }
    }
}

fn build_topic() -> Topic {
    Topic {
        id: Uuid::new_v4(),

        code: "MAT11-T01".to_string(),
        slug: "mathematics-grade-11-functions".to_string(),
        title: "Functions".to_string(),
        short_description: Some("Introduction to functions".to_string()),
        description: Some(
            "Study of linear, quadratic, exponential, hyperbolic and inverse functions."
                .to_string(),
        ),

        subject_id: Uuid::new_v4(),
        term: 1,
        display_order: 1,

        estimated_hours: Some(0),

        total_lessons: 0,
        total_resources: 0,
        total_quizzes: 0,
        total_assignments: 0,

        status: TopicStatus::TopicStatus::Published,

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
async fn get_topics_returns_topics_when_repository_succeeds() {
    let topic = build_topic();

    let service = TopicService {
        repo: Arc::new(MockTopicRepository {
            topics: vec![topic.clone()],
            should_fail: false,
        }),
    };

    let result = service.get_topics_subject_id(topic.subject_id).await;

    assert!(result.is_ok());

    let subjects = result.unwrap();

    assert_eq!(subjects.len(), 1);
    assert_eq!(subjects[0].id, topic.id);
    assert_eq!(subjects[0].code, topic.code);
    assert_eq!(subjects[0].slug, topic.slug);
    assert_eq!(subjects[0].title, topic.title);
    assert_eq!(subjects[0].status, topic.status);
}

#[tokio::test]
async fn search_subjects_returns_empty_list_when_repository_returns_no_subjects() {
    let service = TopicService {
        repo: Arc::new(MockTopicRepository {
            topics: vec![],
            should_fail: false,
        }),
    };

    let subject_id = Uuid::new_v4();
    let result = service.get_topics_subject_id(subject_id).await;

    assert!(result.is_ok());

    let subjects = result.unwrap();

    assert!(subjects.is_empty());
}

#[tokio::test]
async fn search_subjects_returns_error_when_repository_fails() {
    let service = TopicService {
        repo: Arc::new(MockTopicRepository {
            topics: vec![],
            should_fail: true,
        }),
    };

    let subject_id = Uuid::new_v4();
    let result = service.get_topics_subject_id(subject_id).await;

    assert!(result.is_err());

    let error = result.unwrap_err();

    assert_eq!(
        error.to_string(),
        "no rows returned by a query that expected to return at least one row"
    );
}
