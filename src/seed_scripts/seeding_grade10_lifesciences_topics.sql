-- Seeding script for Grade 10 Life Sciences topics based on the Siyavula Everything Science textbook and CAPS curriculum.
-- Assumes parent subject with code 'LFS10' exists in the subjects table.

-- Topic 1: Introduction to Life Sciences
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
    'LFS10-T01',
    'life-sciences-grade-10-introduction-to-life-sciences',
    'Introduction to Life Sciences',
    'Orientation to Life Sciences, the scientific method, biological drawings, tables, graphs, and lab safety.',
    'Introduction to the FET-phase study of Life Sciences. Covers the scientific method, formulating hypotheses, identifying variables, biological drawings and diagrams, constructing and interpreting tables and graphs, mathematical skills in scales and measurements, and laboratory safety procedures.',
    s.id,
    1,
    1,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: The Chemistry of Life
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
    'LFS10-T02',
    'life-sciences-grade-10-chemistry-of-life',
    'The Chemistry of Life',
    'Molecules for life, organic and inorganic compounds, vitamins, and Recommended Dietary Allowance.',
    'Study of the molecular structure and biological functions of key molecules. Covers inorganic compounds (water and minerals) and organic compounds (carbohydrates, lipids, proteins, enzymes, and nucleic acids), chemical tests for these nutrients, vitamins and deficiency diseases, and Recommended Dietary Allowance (RDA).',
    s.id,
    1,
    2,
    10,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: The Basic Units of Life
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
    'LFS10-T03',
    'life-sciences-grade-10-basic-units-of-life',
    'The Basic Units of Life',
    'Cell theory, cell membranes and transport, microscopic structure of cell organelles, and differences between plant and animal cells.',
    'Detailed study of the cell as the structural and functional unit of life. Covers cell theory, cell membranes and transport (diffusion, osmosis, active transport), cytoplasm, detailed structure and function of cell organelles (nucleus, mitochondria, ribosomes, endoplasmic reticulum, Golgi body, plastids, vacuoles, centrioles), and structural differences between plant and animal cells.',
    s.id,
    1,
    3,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: Cell Division
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
    'LFS10-T04',
    'life-sciences-grade-10-cell-division',
    'Cell Division',
    'The cell cycle, phases of mitosis in plant and animal cells, and cancer as uncontrolled mitosis.',
    'Study of cell replication through mitosis. Covers the cell cycle (interphase, mitosis, and cytokinesis), the specific phases of mitosis (prophase, metaphase, anaphase, telophase) in plant and animal cells, the importance of mitosis in growth, repair, and asexual reproduction, and cancer as uncontrolled cell division (causes, types of tumours, and treatments).',
    s.id,
    1,
    4,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Plant and Animal Tissues
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
    'LFS10-T05',
    'life-sciences-grade-10-plant-and-animal-tissues',
    'Plant and Animal Tissues',
    'Cell differentiation, plant tissues, animal tissues, leaf anatomy, and biotechnology applications.',
    'Study of tissues as groups of similar cells adapted for specific functions. Covers plant tissues (meristematic, xylem, phloem, parenchyma, collenchyma, sclerenchyma, epidermis), animal tissues (epithelial, connective, muscle, nerve), leaf anatomy as an organ, and applications of traditional medicine and biotechnology (vaccines, cloning, and ethics).',
    s.id,
    2,
    5,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: Support and Transport Systems in Plants
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
    'LFS10-T06',
    'life-sciences-grade-10-support-and-transport-systems-in-plants',
    'Support and Transport Systems in Plants',
    'Anatomy of dicot roots and stems, transpiration, guttation, uptake and transport of water and mineral salts, and translocation.',
    'Study of support and transport systems in plants. Covers the anatomy of dicotyledonous roots and stems (under a microscope), uptake and transport of water and minerals (root pressure, capillary action, transpiration pull), transpiration and factors affecting the transpiration rate, wilting and guttation, and the translocation of manufactured organic food from the leaves.',
    s.id,
    2,
    6,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: Support Systems in Animals
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
    'LFS10-T07',
    'life-sciences-grade-10-support-systems-in-animals',
    'Support Systems in Animals',
    'Skeletal systems, structure of the human skeleton, musculoskeletal tissues, locomotion, and skeleton diseases.',
    'Detailed study of skeletal systems. Covers different types of skeletons (hydrostatic, exoskeleton, endoskeleton), the human skeleton (axial and appendicular), structure of a long bone, joints, ligaments, tendons, skeletal muscles, the mechanism of contraction, human locomotion, and skeleton-related diseases (rickets, osteoporosis, arthritis).',
    s.id,
    2,
    7,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 8: Transport Systems in Animals
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
    'LFS10-T08',
    'life-sciences-grade-10-transport-systems-in-animals',
    'Transport Systems in Animals',
    'Circulatory systems, structure of the human heart, blood vessels, cardiovascular diseases and treatments.',
    'Study of transport in animals. Covers open and closed circulatory systems, single and double circulation, the internal and external structure of the human heart, cardiac cycle, blood vessels (arteries, veins, capillaries), blood composition and the lymphatic system, and cardiovascular diseases (hypertension, strokes, heart attacks) and treatments.',
    s.id,
    3,
    8,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 9: Biospheres to Ecosystems
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
    'LFS10-T09',
    'life-sciences-grade-10-biospheres-to-ecosystems',
    'Biospheres to Ecosystems',
    'The biosphere, aquatic and terrestrial South African biomes, ecosystems, energy flow, and nutrient cycles.',
    'Study of environmental systems. Covers the biosphere and its interactions with the atmosphere, lithosphere and hydrosphere, South African aquatic and terrestrial biomes, biotic and abiotic factors, energy flow (food chains, webs, and trophic pyramids), nutrient cycles (oxygen, carbon, nitrogen, water), and ecotourism opportunities and challenges.',
    s.id,
    3,
    9,
    24,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 10: Biodiversity and Classification
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
    'LFS10-T10',
    'life-sciences-grade-10-biodiversity-and-classification',
    'Biodiversity and Classification',
    'Biological classification, taxonomy, binomial nomenclature, prokaryotes versus eukaryotes, and the five-kingdom system.',
    'Study of biodiversity on Earth. Covers biological classification (taxonomy), hierarchical ranking schemes (kingdom to species), binomial nomenclature, characteristics of prokaryotes versus eukaryotes, the five-kingdom system of classification (Monera, Protista, Fungi, Plantae, Animalia), and South African species endemism and hotspots.',
    s.id,
    4,
    10,
    4,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;

-- Topic 11: History of Life on Earth
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
    'LFS10-T11',
    'life-sciences-grade-10-history-of-life-on-earth',
    'History of Life on Earth',
    'Geological timescales, pre-Cambrian to Cenozoic eras, fossils, mass extinctions, continental drift, and natural selection.',
    'Exploration of Earth''s prehistory and evolutionary pathways. Covers geological timescales, representations of life''s history in the Pre-Cambrian, Paleozoic, Mesozoic, and Cenozoic eras, Cambrian explosion, mass extinction events, fossil formation and dating methods (relative and radiometric dating), continental drift, and key features of evolution by natural selection.',
    s.id,
    4,
    11,
    20,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS10'
ON CONFLICT (code) DO NOTHING;
