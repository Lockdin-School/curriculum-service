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
    subject_seed.code,
    subject_seed.slug,
    subject_seed.title,
    subject_seed.short_description,
    subject_seed.description,
    c.id,
    g.id,
    sc.id,
    'en',
    0,
    'published'::subject_status,
    subject_seed.display_order
FROM (
         VALUES
             ('MAT10', 'mathematics-grade-10', 'Mathematics', 'Grade 10 Mathematics', 'CAPS Grade 10 Mathematics.', 10, 1),
             ('PHY10', 'physics-grade-10', 'Physics', 'Grade 10 Physics', 'CAPS Grade 10 Physics.', 10, 2),
             ('CHEM10', 'chemistry-grade-10', 'Chemistry', 'Grade 10 Chemistry', 'CAPS Grade 10 Chemistry.', 10, 3),
             ('LFS10', 'life-sciences-grade-10', 'Life Sciences', 'Grade 10 Life Sciences', 'CAPS Grade 10 Life Sciences.', 10, 4),
             ('PHY11', 'physics-grade-11', 'Physics', 'Grade 11 Physics', 'CAPS Grade 11 Physics.', 11, 2),
             ('CHEM11', 'chemistry-grade-11', 'Chemistry', 'Grade 11 Chemistry', 'CAPS Grade 11 Chemistry.', 11, 3),
             ('LFS11', 'life-sciences-grade-11', 'Life Sciences', 'Grade 11 Life Sciences', 'CAPS Grade 11 Life Sciences.', 11, 4),
             ('MAT12', 'mathematics-grade-12', 'Mathematics', 'Grade 12 Mathematics', 'CAPS Grade 12 Mathematics.', 12, 1),
             ('PHY12', 'physics-grade-12', 'Physics', 'Grade 12 Physics', 'CAPS Grade 12 Physics.', 12, 2),
             ('CHEM12', 'chemistry-grade-12', 'Chemistry', 'Grade 12 Chemistry', 'CAPS Grade 12 Chemistry.', 12, 3),
             ('LFS12', 'life-sciences-grade-12', 'Life Sciences', 'Grade 12 Life Sciences', 'CAPS Grade 12 Life Sciences.', 12, 4)
     ) AS subject_seed (
                        code,
                        slug,
                        title,
                        short_description,
                        description,
                        grade,
                        display_order
    )
         JOIN curriculums c
              ON c.code = 'CAPS'
         JOIN grades g
              ON g.grade = subject_seed.grade
         JOIN subject_categories sc
              ON sc.code = 'STEM'
ON CONFLICT (code) DO NOTHING;