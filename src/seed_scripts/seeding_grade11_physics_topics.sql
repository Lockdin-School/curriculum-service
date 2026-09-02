-- Seeding script for Grade 11 Physical Sciences (Physics modules only)
-- Based on the Siyavula Everything Science textbook and CAPS curriculum.
-- Subject code: PHY11

-- Topic 1: Vectors in Two Dimensions
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
    'PHY11-T01',
    'physical-sciences-grade-11-vectors-in-two-dimensions',
    'Vectors in Two Dimensions',
    'Introduction to vectors, resultant of perpendicular vectors, and components of vectors.',
    'Study of vectors in two dimensions on the Cartesian plane, graphical addition (head-to-tail and tail-to-tail methods), closed vector diagrams, resolving vectors into components, and algebraic addition of vectors using Pythagoras theorem or components.',
    s.id,
    1,
    1,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: Newton''s Laws
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
    'PHY11-T02',
    'physical-sciences-grade-11-newtons-laws',
    'Newton''s Laws',
    'Different types of forces, Newton''s first, second, and third laws of motion, and Newton''s law of universal gravitation.',
    'Comprehensive study of force and motion: normal and frictional forces, static and kinetic friction coefficients, resolving forces on inclined planes, Newton''s three laws of motion, equilibrium, and Newton''s law of universal gravitation.',
    s.id,
    1,
    2,
    20,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: Geometrical Optics
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
    'PHY11-T03',
    'physical-sciences-grade-11-geometrical-optics',
    'Geometrical Optics',
    'Properties of light, refraction, Snell''s Law, and total internal reflection.',
    'Study of light propagation and interaction with boundaries. Covers reflection, speed of light, refraction, optical density, Snell''s Law, critical angles, and total internal reflection in prisms and optical fibres.',
    s.id,
    2,
    3,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: 2D and 3D Wavefronts
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
    'PHY11-T04',
    'physical-sciences-grade-11-wavefronts',
    '2D and 3D Wavefronts',
    'Wavefronts, Huygens'' Principle, and diffraction of light.',
    'Study of wave phenomena in two and three dimensions, including wavefronts, Huygens'' Principle, diffraction through a single slit, and interference patterns.',
    s.id,
    2,
    4,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Electrostatics
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
    'PHY11-T05',
    'physical-sciences-grade-11-electrostatics',
    'Electrostatics',
    'Coulomb''s Law and electric fields around charges.',
    'Study of static electricity, including Coulomb''s Law, calculating resultant electrostatic forces in one and two dimensions, and electric field strength, field lines, and electric fields around charge configurations.',
    s.id,
    3,
    5,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: Electromagnetism
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
    'PHY11-T06',
    'physical-sciences-grade-11-electromagnetism',
    'Electromagnetism',
    'Magnetic fields associated with current-carrying conductors and Faraday''s Law of electromagnetic induction.',
    'Study of electric and magnetic field interactions: magnetic fields around current-carrying wires, solenoids, the right-hand rule, magnetic flux, electromagnetic induction, and Faraday''s Law.',
    s.id,
    3,
    6,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: Electric Circuits
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
    'PHY11-T07',
    'physical-sciences-grade-11-electric-circuits',
    'Electric Circuits',
    'Ohm''s Law, series-parallel networks of resistors, and power and energy in electrical appliances.',
    'Study of current electricity: Ohm''s Law, ohmic and non-ohmic conductors, series and parallel resistor networks, equivalent resistance, power, work, energy, and electrical cost calculations.',
    s.id,
    3,
    7,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY11'
ON CONFLICT (code) DO NOTHING;
