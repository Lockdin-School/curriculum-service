use sqlx::PgPool;
use crate::infrastructure::db::database::{init_postgres, run_migrations};

#[derive(Clone)]
pub struct AppState {}

pub fn app_state(
    pg_pool: PgPool,
) -> AppState {
    // let jwt_secret =
    //     std::env::var("JWT_SECRET").expect("JWT_SECRET environment variable is required");
    AppState {}
}

pub async fn init_state() -> AppState {
    log::info!("Initializing state...");
    let pg_pool = init_postgres().await;
    // let redis = init_redis().await.expect("Failed to initialize redis");

    run_migrations(&pg_pool).await;
    let state = app_state(pg_pool);
    state
}