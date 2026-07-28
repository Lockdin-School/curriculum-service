use crate::core::subjects::models::Subject::Subject;

#[async_trait::async_trait]
pub trait SubjectRepository {
    async fn get_subjects(&self) -> sqlx::Result<Vec<Subject>, sqlx::Error>;
    // async fn get_subject(&self, id: Uuid) -> sqlx::Result<Subject, sqlx::Error>;
    // async fn create_subject(&self, subject: Subject) -> sqlx::Result<Subject, sqlx::Error>;
    // async fn update_subject(&self, subject: Subject) -> sqlx::Result<Subject, sqlx::Error>;
    // async fn delete_subject(&self, id: Uuid) -> sqlx::Result<Subject, sqlx::Error>;
}
