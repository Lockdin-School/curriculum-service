use crate::core::topics::models::Topic::Topic;
use crate::core::topics::repository::TopicRepository::TopicRepository;
use std::io::Error;
use std::sync::Arc;
use uuid::Uuid;

pub struct TopicService {
    pub repo: Arc<dyn TopicRepository + Send + Sync>,
}

impl TopicService {
    pub async fn get_topics_subject_id(&self, id: Uuid) -> Result<Vec<Topic>, Error> {
        log::info!(
            "topics.fetch.start | service | get_topics | started | \"Getting topics by subject id\" |"
        );
        match self.repo.get_topics_by_subject_id(id).await {
            Ok(topics) => {
                log::info!(
                    "topics.get.success | service | get_topics | success | \"Got topics by subject id successfully\" |"
                );
                Ok(topics)
            }
            Err(e) => {
                log::info!(
                    "topics.get.failed | service | get_topics | failed | \"Failed to get topics by subject id\" | error=\"{e}\""
                );
                Err(Error::other(e.to_string()))
            }
        }
    }
}
