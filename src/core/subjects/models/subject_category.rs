use uuid::Uuid;

pub struct SubjectCategory {
    pub id: Uuid,
    
    pub code: String,
    
    pub name: String,
    
    pub slug: String,
    
    pub description: Option<String>,
    
    pub icon_url: Option<String>,
    
    pub theme_color: Option<String>,
    
    pub display_order: i32,
    
    pub is_active: bool,
    
    pub created_at: chrono::DateTime<chrono::Utc>,
    
    pub updated_at: chrono::DateTime<chrono::Utc>,
}