-- Add migration script here
INSERT INTO subjects (
    id,
    code,
    slug,
    title,
    short_description,
    description,
    curriculum_id,
    grade_id,
    category_id,
    language_code,
    estimated_hours,
    status,
    display_order
)
SELECT
    gen_random_uuid(),
    'MAT11',
    'mathematics-grade-11',
    'Mathematics',
    'Grade 11 Mathematics',
    'CAPS Grade 11 Mathematics.',
    c.id,
    g.id,
    sc.id,
    'en',
    0,
    'published',
    1

FROM curriculums c
         JOIN grades g
              ON g.grade = 11
         JOIN subject_categories sc
              ON sc.code = 'STEM'

WHERE c.code = 'CAPS'

ON CONFLICT (code) DO NOTHING;