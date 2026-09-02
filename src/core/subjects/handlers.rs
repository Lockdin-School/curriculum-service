use crate::configuration::state::AppState;
use crate::core::subjects::dto::SubjectResponseDTO::SubjectResponseDTO;
use actix_web::web::{Data, Query};
use actix_web::{HttpResponse, get};
use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SubjectQueryParameters {
    pub grade: Option<i16>,
}

#[get("")]
pub async fn search_subjects(
    state: Data<AppState>,
    query: Query<SubjectQueryParameters>,
) -> actix_web::Result<HttpResponse> {
    log::info!(
        "subjects.search.request.received | handler | search_subjects | started | \"Received request to search subjects\" | grade={:?}",
        query.grade
    );
    match state.subject_service.search_subjects(query.grade).await {
        Ok(subjects) => {
            let response: Vec<SubjectResponseDTO> =
                subjects.into_iter().map(SubjectResponseDTO::from).collect();
            log::info!(
                "subjects.search.response.sent | handler | search_subjects | success | \"Subjects search response sent successfully\" |"
            );
            Ok(HttpResponse::Ok().json(response))
        }
        Err(e) => {
            log::error!(
                "subjects.search.request.failed | handler | search_subjects | failed | \"Failed to handle subjects search request\" | \"{e}\" |"
            );
            Ok(HttpResponse::from_error(e))
        }
    }
}
