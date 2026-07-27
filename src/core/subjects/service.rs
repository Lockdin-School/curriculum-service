use std::io::Error;
use std::sync::Arc;
use crate::core::subjects::models::subject::Subject;
use crate::core::subjects::repository::SubjectRepository;

pub struct SubjectService {
    pub repo: Arc<dyn SubjectRepository + Send + Sync>
}

impl SubjectService {
    pub async fn search_subjects(
        &self,
        // all the possible search params
        
    ) -> Result<Vec<Subject>, Error> {
        Ok(vec![])
    }
}