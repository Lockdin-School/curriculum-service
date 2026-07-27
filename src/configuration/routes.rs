use actix_web::web;

pub fn configure(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/api/v1")
            .service(
                web::scope("/auth")
            )
            .service(
                web::scope("/subjects"),
            )
            .service(
                web::scope("/users")
            ),
    );
}