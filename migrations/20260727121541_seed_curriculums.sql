-- Add migration script here
INSERT INTO curriculums (
    id,
    code,
    name,
    short_name,
    slug,
    country_code,
    status,
    display_order
)
VALUES
    (
        gen_random_uuid(),
        'CAPS',
        'Curriculum and Assessment Policy Statement',
        'CAPS',
        'caps',
        'ZA',
        'active',
        1
    ),
    (
        gen_random_uuid(),
        'IEB',
        'Independent Examinations Board',
        'IEB',
        'ieb',
        'ZA',
        'active',
        2
    )
ON CONFLICT (code) DO NOTHING;