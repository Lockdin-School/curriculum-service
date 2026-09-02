-- Add migration script here
-- Topic 1: Atomic Combinations: Molecular Structure
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
    'CHEM11-T01',
    'chemistry-grade-11-atomic-combinations-molecular-structure',
    'Atomic Combinations: Molecular Structure',
    'Chemical bonds, molecular shape, electronegativity, and bond energy.',
    'Study of covalent, ionic, and metallic bonding models, drawing Lewis diagrams, predicting molecular shapes using VSEPR theory, understanding electronegativity, polar versus non-polar molecules, bond lengths, and bond energies.',
    s.id,
    1,
    1,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: Intermolecular Forces
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
    'CHEM11-T02',
    'chemistry-grade-11-intermolecular-forces',
    'Intermolecular Forces',
    'Forces between molecules, van der Waals forces, hydrogen bonding, and physical properties.',
    'Understanding the difference between interatomic and intermolecular forces; classifying ion-dipole, dipole-dipole, London dispersion (induced dipole), and hydrogen forces; and analyzing their impact on physical properties such as boiling/melting points, viscosity, density, and solubility.',
    s.id,
    2,
    2,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: Ideal Gases
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
    'CHEM11-T03',
    'chemistry-grade-11-ideal-gases',
    'Ideal Gases',
    'The kinetic theory of gases, ideal gas behavior, and gas laws (Boyle, Charles, Avogadro).',
    'Study of ideal and real gas behaviors, the kinetic molecular theory, and gas laws including Boyle''s Law, Charles'' Law, Avogadro''s Law, and the ideal gas equation (pV = nRT).',
    s.id,
    2,
    3,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: Quantitative Aspects of Chemical Change
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
    'CHEM11-T04',
    'chemistry-grade-11-quantitative-aspects-of-chemical-change',
    'Quantitative Aspects of Chemical Change',
    'Molar volume of gases, stoichiometry, limiting reagents, percent purity, and percent yield.',
    'Calculations of molecular and empirical formulas, molar gas volume at STP, stoichiometry in gaseous and solution reactions, identifying limiting and excess reagents, and calculating percentage purity and yield.',
    s.id,
    3,
    4,
    14,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Energy and Chemical Change
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
    'CHEM11-T05',
    'chemistry-grade-11-energy-and-chemical-change',
    'Energy and Chemical Change',
    'Energy changes in chemical reactions, exothermic/endothermic processes, and activation energy.',
    'Introduction to chemical thermodynamics (thermochemistry), bond breaking and forming, calculating enthalpy change (delta H), sketching and interpreting potential energy profiles, activation energy, and the activated complex.',
    s.id,
    4,
    5,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: Types of Reactions
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
    'CHEM11-T06',
    'chemistry-grade-11-types-of-reactions',
    'Types of Reactions',
    'Acid-base reactions, Bronsted-Lowry theory, and redox (oxidation-reduction) reactions.',
    'Study of acid-base systems using Arrhenius and Bronsted-Lowry models, conjugate pairs, neutralisation reactions, determining oxidation numbers, and balancing redox reactions using half-reaction methods.',
    s.id,
    4,
    6,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: The Lithosphere
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
    'CHEM11-T07',
    'chemistry-grade-11-the-lithosphere',
    'The Lithosphere',
    'The Earth''s crust, mineral processing, and mining impacts.',
    'Exploring chemistry in the lithosphere, focusing on South Africa''s mineral resources, mining and extraction metallurgy (such as gold or iron processing), and the environmental impact of chemical processing and energy resource use.',
    s.id,
    4,
    7,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM11'
ON CONFLICT (code) DO NOTHING;