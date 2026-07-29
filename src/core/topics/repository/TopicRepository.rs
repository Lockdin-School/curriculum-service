use crate::core::topics::models::Topic::Topic;

#[async_trait::async_trait]
pub trait TopicRepository {
    async fn get_topics_by_subject_id(
        &self,
        subject_id: uuid::Uuid,
    ) -> sqlx::Result<Vec<Topic>, sqlx::Error>;
}
