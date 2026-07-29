use crate::configuration::state::AppState;
use crate::core::topics::dto::TopicResponseDTO::TopicResponseDTO;
use actix_web::web::Data;
use actix_web::{HttpResponse, get, web};
use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SubjectQueryParameters {
    pub id: String,
    pub name: String,
}

#[get("/{subject_id}/topics")]
pub async fn get_topics_by_subject(
    state: Data<AppState>,
    subject_id: web::Path<String>,
) -> actix_web::Result<HttpResponse> {
    log::info!(
        "topics.get.request.received | handler | get_topics_by_subject | started | \"Received request to get topics by subject id\" |"
    );

    match uuid::Uuid::parse_str(&subject_id) {
        Ok(id) => match state.topic_service.get_topics_subject_id(id).await {
            Ok(topics) => {
                let response: Vec<TopicResponseDTO> =
                    topics.into_iter().map(TopicResponseDTO::from).collect();
                log::info!(
                    "topics.get.response.sent | handler | get_topics_by_subject | success | \"Topics get response sent successfully\" |"
                );
                Ok(HttpResponse::Ok().json(response))
            }
            Err(e) => {
                log::error!(
                    "topics.get.request.failed | handler | get_topics_by_subject | failed | \"Failed to handle topics get request\" | \"{e}\" |"
                );
                Ok(HttpResponse::from_error(e))
            }
        },
        Err(e) => {
            log::error!(
                "topics.get.request.failed | handler | get_topics_by_subject | failed | \"Invalid subject id\" | \"{e}\" |"
            );
            Ok(HttpResponse::BadRequest().json("Invalid subject id"))
        }
    }
}
