-- Add migration script here
INSERT INTO topics (
    id,
    code,
    slug,
    title,
    short_description,
    description,

    subject_id,

    term,

    display_order,

    estimated_hours,

    status,

    is_featured,
    is_free
)
SELECT
    gen_random_uuid(),

    'MAT11-T01',

    'mathematics-grade-11-functions',

    'Functions',

    'Introduction to Functions',

    'Study of linear, quadratic, exponential, hyperbolic and inverse functions.',

    s.id,

    1,

    1,

    18,

    'published',

    FALSE,

    FALSE

FROM subjects s

WHERE s.code = 'MAT11'

ON CONFLICT (code) DO NOTHING;