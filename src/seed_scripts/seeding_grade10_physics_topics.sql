-- Seeding script for Grade 10 Physics topics based on Siyavula Everything Science Grade 10 Physical Sciences textbook and CAPS curriculum.
-- Assumes parent subject with code 'PHY10' exists in the subjects table.

-- Topic 1: Transverse Pulses
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
    'PHY10-T01',
    'physics-grade-10-transverse-pulses',
    'Transverse Pulses',
    'Introduction to pulses, pulse speed, superpositions, and interference on a string.',
    'Study of transverse pulses on a string or medium. Covers definitions of pulses, amplitude, pulse length, calculating pulse speed, superposition of pulses, constructive and destructive interference, and particle motion.',
    s.id,
    1,
    1,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: Transverse Waves
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
    'PHY10-T02',
    'physics-grade-10-transverse-waves',
    'Transverse Waves',
    'Properties of transverse waves, wavelength, amplitude, frequency, period, and wave speed.',
    'Detailed study of transverse waves. Explores wave definitions (crests, troughs, points in phase), frequency, period, wavelength, amplitude, the wave equation (v = f * lambda), and calculating wave speed.',
    s.id,
    1,
    2,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: Longitudinal Waves
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
    'PHY10-T03',
    'physics-grade-10-longitudinal-waves',
    'Longitudinal Waves',
    'Longitudinal waves, compressions, rarefactions, wavelength, period, and frequency.',
    'Study of longitudinal waves in a medium. Covers compressions and rarefactions, wavelength, amplitude, period, frequency, and calculating longitudinal wave speed.',
    s.id,
    1,
    3,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: Sound
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
    'PHY10-T04',
    'physics-grade-10-sound',
    'Sound',
    'Sound waves, pitch, loudness, ultrasound, and the speed of sound.',
    'Exploration of sound as a longitudinal wave, including the speed of sound in different media, properties of sound waves (pitch/frequency, loudness/amplitude, wave quality), and the applications of ultrasound.',
    s.id,
    1,
    4,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Electromagnetic Radiation
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
    'PHY10-T05',
    'physics-grade-10-electromagnetic-radiation',
    'Electromagnetic Radiation',
    'Wave-particle duality, the EM spectrum, penetrating ability, and photon energy calculations.',
    'Study of electromagnetic radiation, including its dual wave-particle nature, the speed of light, the electromagnetic spectrum (radio waves to gamma rays), penetrating power, hazards, and calculating photon energy using Planck''s equation.',
    s.id,
    1,
    5,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: Vectors and Scalars
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
    'PHY10-T06',
    'physics-grade-10-vectors-and-scalars',
    'Vectors and Scalars',
    'Physical quantities, vector representation, direction, and addition methods.',
    'Introduction to physical quantities as either vectors or scalars. Covers vector notations, properties of vectors, finding resultant vectors graphically (head-to-tail and tail-to-tail methods), and basic algebraic addition of one-dimensional vectors.',
    s.id,
    2,
    6,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: Motion in One Dimension
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
    'PHY10-T07',
    'physics-grade-10-motion-in-one-dimension',
    'Motion in One Dimension',
    'Position, displacement, speed, velocity, acceleration, and equations of motion.',
    'Comprehensive study of kinematics in one dimension. Covers reference frames, position, distance, displacement, speed, average and instantaneous velocity, acceleration, ticker-timer analysis, graphing motion (position-time, velocity-time, acceleration-time graphs), and applying the equations of motion to solve problems.',
    s.id,
    2,
    7,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 8: Magnetism
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
    'PHY10-T08',
    'physics-grade-10-magnetism',
    'Magnetism',
    'Magnetic poles, magnetic fields, compasses, and Earth''s magnetosphere.',
    'Study of magnetic phenomena, including magnetic poles (attraction and repulsion), ferromagnetic materials, magnetic fields and field lines, the compass, geographic versus magnetic poles, and Earth''s magnetic field (magnetosphere) which protects against solar wind.',
    s.id,
    3,
    8,
    2,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 9: Electrostatics
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
    'PHY10-T09',
    'physics-grade-10-electrostatics',
    'Electrostatics',
    'Static charge, tribal-charging, conservation of charge, and quantization of charge.',
    'Study of electric charge at rest. Covers positive and negative charges, charging by friction, force between charges (like charges repel, opposite charges attract), the principle of conservation of charge, and the principle of charge quantization.',
    s.id,
    3,
    9,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 10: Electric Circuits
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
    'PHY10-T10',
    'physics-grade-10-electric-circuits',
    'Electric Circuits',
    'Current, potential difference, electromotive force, resistance, and series-parallel circuit networks.',
    'Study of electric current and circuit analysis. Covers electrical current, potential difference (voltage) and electromotive force (emf), resistance, resistors in series and parallel networks, ammeter and voltmeter placements, and calculating equivalent resistance.',
    s.id,
    3,
    10,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

-- Topic 11: Mechanical Energy
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
    'PHY10-T11',
    'physics-grade-10-mechanical-energy',
    'Mechanical Energy',
    'Gravitational potential energy, kinetic energy, and conservation of mechanical energy.',
    'Study of work and mechanical energy. Explores gravitational potential energy (Ep = mgh), kinetic energy (Ek = 1/2 * m * v^2), mechanical energy (Em = Ep + Ek), and the law of conservation of mechanical energy in the absence of resistive forces.',
    s.id,
    4,
    11,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'PHY10'
ON CONFLICT (code) DO NOTHING;

