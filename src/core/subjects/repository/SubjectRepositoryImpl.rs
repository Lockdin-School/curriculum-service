use crate::core::subjects::models::Subject::Subject;
use crate::core::subjects::repository::SubjectRepository::SubjectRepository;
use sqlx::{Error, PgPool};

pub struct PostgresSubjectRepository {
    pub pool: PgPool,
}

#[async_trait::async_trait]
impl SubjectRepository for PostgresSubjectRepository {
    async fn get_subjects(&self, grade: Option<i16>) -> sqlx::Result<Vec<Subject>, Error> {
        let subjects = sqlx::query_as::<_, Subject>(
            r#"
            SELECT s.*
            FROM subjects s
            JOIN grades g
                ON g.id = s.grade_id
            WHERE ($1::SMALLINT IS NULL OR g.grade = $1)
            ORDER BY s.display_order ASC
            "#,
        )
            .bind(grade)
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
