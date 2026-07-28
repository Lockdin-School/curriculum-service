// use sqlx::PgPool;
// use uuid::Uuid;
//
// pub async fn seed_subject_categories(pool: &PgPool) -> sqlx::Result<()> {
//     let categories = [
//         (
//             "STEM",
//             "STEM",
//             "stem",
//             "Science, Technology, Engineering and Mathematics",
//             1,
//         ),
//         (
//             "LANG",
//             "Languages",
//             "languages",
//             "Language subjects",
//             2,
//         ),
//         (
//             "HUM",
//             "Humanities",
//             "humanities",
//             "Humanities subjects",
//             3,
//         ),
//         (
//             "COMM",
//             "Commerce",
//             "commerce",
//             "Commerce subjects",
//             4,
//         ),
//         (
//             "ART",
//             "Arts",
//             "arts",
//             "Creative and performing arts",
//             5,
//         ),
//         (
//             "TECH",
//             "Technology",
//             "technology",
//             "Technology subjects",
//             6,
//         ),
//         (
//             "LIFE",
//             "Life Orientation",
//             "life-orientation",
//             "Life Orientation",
//             7,
//         ),
//     ];
//
//     for category in categories {
//         let _ = sqlx::query_as(
//             "
//             INSERT INTO subject_categories (
//                 id,
//                 code,
//                 name,
//                 slug,
//                 description,
//                 display_order
//             )
//             VALUES ($1,$2,$3,$4,$5,$6)
//             ON CONFLICT (code) DO NOTHING
//             ")
//             .bind(Uuid::new_v4())
//             .bind(category.0)
//             .bind(category.1)
//             .bind(category.2)
//             .bind(category.3)
//             .bind(category.4)
//             .execute(pool)
//             .await?;
//     }
//
//     Ok(())
// }
