use serde::{Deserialize, Serialize};
use sqlx::Type;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, Type)]
#[sqlx(type_name = "subject_status", rename_all = "lowercase")]
pub enum SubjectStatus {
    Draft,
    Published,
    Archived,
}
