-- Seeding script for Grade 10 Chemistry topics based on the Siyavula Everything Science Grade 10 Physical Sciences textbook and CAPS curriculum.
-- Assumes parent subject with code 'CHEM10' exists in the subjects table.

-- Topic 1: Classification of Matter (Chapter 2)
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
    'CHEM10-T01',
    'chemistry-grade-10-classification-of-matter',
    'Classification of Matter',
    'Materials, mixtures, pure substances, names and formulae, metals/metalloids/non-metals, and conductors/insulators.',
    'Comprehensive study of the classification of matter, identifying mixtures (homogeneous and heterogeneous) and pure substances (elements and compounds), names and chemical formulae of substances, characteristics of metals, metalloids, and non-metals, and electrical and thermal conductivity.',
    s.id,
    1,
    1,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: States of Matter and the Kinetic Molecular Theory (Chapter 3)
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
    'CHEM10-T02',
    'chemistry-grade-10-states-of-matter-and-kinetic-molecular-theory',
    'States of Matter and the Kinetic Molecular Theory',
    'Solid, liquid, and gas phases, and kinetic molecular theory.',
    'Study of the three states of matter (solid, liquid, gas), diffusion, kinetic molecular theory, microscopic behavior of particles, and how it explains melting and boiling points.',
    s.id,
    1,
    2,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: The Atom (Chapter 4)
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
    'CHEM10-T03',
    'chemistry-grade-10-the-atom',
    'The Atom',
    'Atomic structure, subatomic particles, isotopes, and electron configuration.',
    'Exploration of atomic structure, subatomic particles (protons, neutrons, electrons), atomic number and mass number, isotopes, Aufbau principle, Hund''s rule, Pauli exclusion principle, and orbital diagrams.',
    s.id,
    1,
    3,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: The Periodic Table (Chapter 5)
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
    'CHEM10-T04',
    'chemistry-grade-10-the-periodic-table',
    'The Periodic Table',
    'Organisation of elements, periodic trends, groups, and periods.',
    'Detailed study of the Periodic Table of the Elements, grouping of metals, non-metals, halogens, noble gases, transition metals, and periodic trends including atomic radius, ionization energy, electronegativity, and electron affinity.',
    s.id,
    1,
    4,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Chemical Bonding (Chapter 6)
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
    'CHEM10-T05',
    'chemistry-grade-10-chemical-bonding',
    'Chemical Bonding',
    'Covalent, ionic, and metallic bonding, Lewis structures, and chemical formulas.',
    'Study of the three primary types of chemical bonding: covalent bonding (sharing of electrons), ionic bonding (transfer of electrons), and metallic bonding (delocalised electron pool), representing bonds with Lewis dot diagrams, and writing chemical formulae.',
    s.id,
    1,
    5,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: The Particles that Substances are Made Of (Chapter 12)
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
    'CHEM10-T06',
    'chemistry-grade-10-particles-substances-are-made-of',
    'The Particles that Substances are Made Of',
    'Atoms, molecules, ions, and giant covalent or ionic structures.',
    'Study of the microscopic particles making up different substances, including monatomic elements, diatomic molecules, networks, covalent molecular structures, ionic lattices, and metallic structures.',
    s.id,
    2,
    6,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: Physical and Chemical Change (Chapter 13)
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
    'CHEM10-T07',
    'chemistry-grade-10-physical-and-chemical-change',
    'Physical and Chemical Change',
    'Physical versus chemical changes, conservation of atoms, mass, and energy.',
    'Study of the differences between physical and chemical changes in matter, conservation of atoms and mass during chemical reactions, law of constant composition, and endothermic versus exothermic energy changes.',
    s.id,
    3,
    7,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 8: Representing Chemical Change (Chapter 14)
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
    'CHEM10-T08',
    'chemistry-grade-10-representing-chemical-change',
    'Representing Chemical Change',
    'Writing and balancing chemical equations with state symbols.',
    'Practical guide to representing chemical changes using chemical equations, writing reactants and products, and applying conservation principles to balance chemical equations with state symbols.',
    s.id,
    3,
    8,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 9: Reactions in Aqueous Solutions (Chapter 18)
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
    'CHEM10-T09',
    'chemistry-grade-10-reactions-in-aqueous-solutions',
    'Reactions in Aqueous Solutions',
    'Ions in solution, conductivity, precipitation, acid-base, and redox reactions.',
    'Exploration of chemical reactions occurring in water, including dissociation of ionic compounds, ionization of polar covalent compounds, electrical conductivity of solutions, precipitation reactions, simple acid-base reactions, and redox reactions in solution.',
    s.id,
    3,
    9,
    10,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 10: Quantitative Aspects of Chemical Change (Chapter 19)
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
    'CHEM10-T10',
    'chemistry-grade-10-quantitative-aspects-of-chemical-change',
    'Quantitative Aspects of Chemical Change',
    'The mole concept, molar mass, empirical formulae, and stoichiometric calculations.',
    'Introduction to stoichiometry and the mole concept, Avogadro''s number, molar mass, calculations of percentage composition, empirical and molecular formulae, and calculations involving molar concentration and gas volumes.',
    s.id,
    3,
    10,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;

-- Topic 11: The Hydrosphere (Chapter 23)
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
    'CHEM10-T11',
    'chemistry-grade-10-the-hydrosphere',
    'The Hydrosphere',
    'The water cycle, physical and chemical properties of water, and water systems.',
    'Study of the Earth''s hydrosphere, the water cycle, properties of water that make life possible (such as high specific heat capacity), chemical composition of water systems, and the impact of human activities on water resources.',
    s.id,
    4,
    11,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'CHEM10'
ON CONFLICT (code) DO NOTHING;
