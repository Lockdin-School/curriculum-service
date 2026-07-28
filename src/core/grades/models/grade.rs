use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize, FromRow)]
pub struct Grade {
    // ---------------------------------------------------------------------
    // Identity
    // ---------------------------------------------------------------------
    pub id: Uuid,

    pub grade: i16,
    pub name: String,

    pub display_order: i16,

    pub is_active: bool,

    pub created_at: DateTime<Utc>,
    pub updated_at: DateTime<Utc>,
}
