use crate::core::topics::models::Topic::Topic;
use crate::core::topics::repository::TopicRepository::TopicRepository;

pub struct PostgresTopicRepository {
    pub pool: sqlx::PgPool,
}

#[async_trait::async_trait]
impl TopicRepository for PostgresTopicRepository {
    async fn get_topics_by_subject_id(
        &self,
        subject_id: uuid::Uuid,
    ) -> sqlx::Result<Vec<Topic>, sqlx::Error> {
        let topics = sqlx::query_as::<_, Topic>("SELECT * FROM topics WHERE subject_id = $1")
            .bind(subject_id)
            .fetch_all(&self.pool)
            .await?;

        Ok(topics)
    }
}
