use crate::core::subjects::repository::SubjectRepositoryImpl::PostgresSubjectRepository;
use crate::core::subjects::service::SubjectService::SubjectService;
use crate::infrastructure::db::database::{init_postgres, run_migrations};
use actix_web::web::Data;
use sqlx::PgPool;
use std::sync::Arc;

#[derive(Clone)]
pub struct AppState {
    pub subject_service: Data<SubjectService>,
}

pub fn app_state(pg_pool: PgPool) -> AppState {
    AppState {
        subject_service: Data::new(SubjectService {
            repo: Arc::new(PostgresSubjectRepository {
                pool: pg_pool.clone(),
            }),
        }),
    }
}

pub async fn init_state() -> AppState {
    log::info!("Initializing state...");
    let pg_pool = init_postgres().await;
    // let redis = init_redis().await.expect("Failed to initialize redis");

    run_migrations(&pg_pool).await;
    app_state(pg_pool)
}
