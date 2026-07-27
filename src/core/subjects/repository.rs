use crate::core::subjects::models::subject::Subject;

#[async_trait::async_trait]
pub trait SubjectRepository {
    async fn get_subjects(&self) -> sqlx::Result<Vec<Subject>, sqlx::Error>;
}