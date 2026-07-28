use crate::core::subjects::models::Subject::Subject;
use crate::core::subjects::repository::SubjectRepository::SubjectRepository;
use sqlx::{Error, PgPool};

pub struct PostgresSubjectRepository {
    pub pool: PgPool,
}

#[async_trait::async_trait]
impl SubjectRepository for PostgresSubjectRepository {
    async fn get_subjects(&self) -> sqlx::Result<Vec<Subject>, Error> {
        let subjects = sqlx::query_as::<_, Subject>("SELECT * FROM subjects")
            .fetch_all(&self.pool)
            .await?;
        Ok(subjects)
    }

    // async fn get_subject(&self, id: Uuid) -> sqlx::Result<Subject, Error> {
    //     todo!()
    // }
    //
    // async fn create_subject(&self, subject: Subject) -> sqlx::Result<Subject, Error> {
    //     todo!()
    // }
    //
    // async fn update_subject(&self, subject: Subject) -> sqlx::Result<Subject, Error> {
    //     todo!()
    // }
    //
    // async fn delete_subject(&self, id: Uuid) -> sqlx::Result<Subject, Error> {
    //     todo!()
    // }
}
