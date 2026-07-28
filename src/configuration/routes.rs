use actix_web::web;
use crate::core::subjects::handlers::search_subjects;

pub fn configure(cfg: &mut web::ServiceConfig) {
    log::info!("Configuring routes...");
    cfg.service(
        web::scope("/api/v1")
            .service(
                web::scope("/auth")
            )
            .service(
                web::scope("/subjects")
                    .service(search_subjects)
            )
            .service(
                web::scope("/users")
            ),
    );
}