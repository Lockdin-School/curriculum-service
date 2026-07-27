-- Add migration script here
INSERT INTO subject_categories (
    id,
    code,
    name,
    slug,
    description,
    display_order
)
VALUES
    (
        gen_random_uuid(),
        'STEM',
        'STEM',
        'stem',
        'Science, Technology, Engineering and Mathematics',
        1
    ),
    (
        gen_random_uuid(),
        'LANG',
        'Languages',
        'languages',
        'Language subjects',
        2
    ),
    (
        gen_random_uuid(),
        'HUM',
        'Humanities',
        'humanities',
        'Humanities subjects',
        3
    ),
    (
        gen_random_uuid(),
        'COMM',
        'Commerce',
        'commerce',
        'Commerce subjects',
        4
    ),
    (
        gen_random_uuid(),
        'ART',
        'Arts',
        'arts',
        'Creative and Performing Arts',
        5
    ),
    (
        gen_random_uuid(),
        'TECH',
        'Technology',
        'technology',
        'Technology subjects',
        6
    ),
    (
        gen_random_uuid(),
        'LIFE',
        'Life Orientation',
        'life-orientation',
        'Life Orientation',
        7
    )
ON CONFLICT (code) DO NOTHING;