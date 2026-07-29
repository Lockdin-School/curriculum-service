use crate::core::subjects::handlers::search_subjects;
use crate::core::topics::handlers::get_topics_by_subject;
use actix_web::web;

pub fn configure(cfg: &mut web::ServiceConfig) {
    log::info!("Configuring routes...");
    cfg.service(
        web::scope("/api/v1")
            .service(web::scope("/auth"))
            .service(
                web::scope("/subjects")
                    .service(search_subjects)
                    .service(get_topics_by_subject),
            )
            .service(web::scope("/users")),
    );
}
