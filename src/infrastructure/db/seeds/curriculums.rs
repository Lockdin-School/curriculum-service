// use sqlx::PgPool;
// use uuid::Uuid;
//
// pub async fn seed_curriculums(pool: &PgPool) -> sqlx::Result<()> {
//     let curriculums = [
//         (
//             "CAPS",
//             "Curriculum and Assessment Policy Statement",
//             "CAPS",
//             "caps",
//             "ZA",
//             1,
//         ),
//         (
//             "IEB",
//             "Independent Examinations Board",
//             "IEB",
//             "ieb",
//             "ZA",
//             2,
//         ),
//     ];
//
//     for curriculum in curriculums {
//         sqlx::query!(
//             r#"
//             INSERT INTO curriculums (
//                 id,
//                 code,
//                 name,
//                 short_name,
//                 slug,
//                 country_code,
//                 status,
//                 display_order
//             )
//             VALUES (
//                 $1,$2,$3,$4,$5,$6,'active',$7
//             )
//             ON CONFLICT (code) DO NOTHING
//             "#,
//             Uuid::new_v4(),
//             curriculum.0,
//             curriculum.1,
//             curriculum.2,
//             curriculum.3,
//             curriculum.4,
//             curriculum.5,
//         )
//             .execute(pool)
//             .await?;
//     }
//
//     Ok(())
// }