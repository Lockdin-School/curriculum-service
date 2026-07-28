use crate::core::subjects::models::Subject::Subject;
use crate::core::subjects::repository::SubjectRepository::SubjectRepository;
use std::io::Error;
use std::sync::Arc;

pub struct SubjectService {
    pub repo: Arc<dyn SubjectRepository + Send + Sync>,
}

impl SubjectService {
    pub async fn search_subjects(&self) -> Result<Vec<Subject>, Error> {
        log::info!(
            "subjects.search.start | service | search_subjects | started | \"Searching subjects\" |"
        );
        match self.repo.get_subjects().await {
            Ok(subjects) => {
                log::info!(
                    "subjects.search.success | service | search_subjects | success | \"Searched subjects successfully\" | count={}",
                    subjects.len()
                );
                Ok(subjects)
            }
            Err(e) => {
                log::error!(
                    "subjects.search.failed | service | search_subjects | failed | \"Failed to search subjects\" | error=\"{e}\""
                );
                Err(Error::other(e.to_string()))
            }
        }
    }
}
