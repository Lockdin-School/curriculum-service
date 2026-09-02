-- Add migration script here
-- Topic 1: Biodiversity and Classification of Micro-organisms
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
    'LFS11-T01',
    'life-sciences-grade-11-biodiversity-and-classification-of-micro-organisms',
    'Biodiversity and Classification of Micro-organisms',
    'Structure, characteristics, and ecological roles of viruses, bacteria, protists, and fungi.',
    'Study of the classification and characteristics of micro-organisms (viruses, bacteria, protists, and fungi). Explores their ecological roles as decomposers, nitrogen fixers, and in symbiotic relationships, as well as pathogenic diseases, the immune response, vaccinations, and industrial biotechnology applications.',
    s.id,
    1,
    1,
    16,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 2: Biodiversity of Plants
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
    'LFS11-T02',
    'life-sciences-grade-11-biodiversity-of-plants',
    'Biodiversity of Plants',
    'The evolutionary progression of Bryophytes, Pteridophytes, Gymnosperms, and Angiosperms.',
    'An exploration of plant diversity across the four major divisions: Bryophytes, Pteridophytes, Gymnosperms, and Angiosperms. Focuses on the decreasing dependence on water for reproduction, alternation of generations, asexual vs sexual reproduction, floral adaptations for pollination, and the ecological and agricultural significance of seeds and seed banks.',
    s.id,
    1,
    2,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 3: Biodiversity of Animals
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
    'LFS11-T03',
    'life-sciences-grade-11-biodiversity-of-animals',
    'Biodiversity of Animals',
    'Key features of animal body plans and the classification of major phyla.',
    'Detailed study of animal body plans, focusing on key features such as symmetry, cephalisation, primary and secondary tissue layers, gut openings, and coelom development. Classifies major animal phyla, compares open and closed circulatory systems, and explores the vital roles of invertebrates in agriculture and ecosystems.',
    s.id,
    1,
    3,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 4: Photosynthesis
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
    'LFS11-T04',
    'life-sciences-grade-11-photosynthesis',
    'Photosynthesis',
    'The mechanism, phases, and limiting factors of light-driven energy conversion.',
    'Detailed study of photosynthesis, including the structure of the chloroplast, light-dependent and light-independent phases, and the roles of water, carbon dioxide, and chlorophyll. Covers the experimental investigation of starch production, limiting factors (light, temperature, CO2), and greenhouse applications.',
    s.id,
    2,
    4,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 5: Animal Nutrition
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
    'LFS11-T05',
    'life-sciences-grade-11-animal-nutrition',
    'Animal Nutrition',
    'Dentition, mechanical and chemical digestion, absorption, and homeostatic control in humans.',
    'Study of mammalian nutrition, comparing dentition across herbivores, carnivores, and omnivores. Explores the human digestive system, the processes of mechanical and chemical digestion (including enzymes such as carbohydrases, proteases, and lipases), absorption in the villi, assimilation, egestion, and the homeostatic control of blood glucose.',
    s.id,
    2,
    5,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 6: Cellular Respiration
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
    'LFS11-T06',
    'life-sciences-grade-11-cellular-respiration',
    'Cellular Respiration',
    'Aerobic and anaerobic breakdown of glucose to generate ATP.',
    'Introduction to cellular metabolism and respiration, contrasting catabolic and anabolic pathways. Details aerobic and anaerobic respiration (fermentation), glycolysis, the Krebs cycle, and oxidative phosphorylation. Investigates the industrial and economic benefits of fermentation in South Africa.',
    s.id,
    2,
    6,
    8,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 7: Gaseous Exchange
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
    'LFS11-T07',
    'life-sciences-grade-11-gaseous-exchange',
    'Gaseous Exchange',
    'Ventilation, diffusion, transport of respiratory gases, and homeostatic regulation.',
    'Explores the physiological requirements of gas exchange surfaces in diverse organisms and details the human respiratory system. Covers the mechanics of breathing, internal and external gas exchange at the alveoli, transportation of oxygen and carbon dioxide, homeostatic control of breathing, respiratory diseases, and the physiological impact of smoking and altitude.',
    s.id,
    3,
    7,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 8: Excretion in Humans
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
    'LFS11-T08',
    'life-sciences-grade-11-excretion-in-humans',
    'Excretion in Humans',
    'Structure and functioning of the urinary system and homeostatic osmoregulation.',
    'Study of excretion in humans, focusing on the structure of the urinary system, macro- and microscopic structure of the kidney, and nephron function (ultrafiltration, selective reabsorption, tubular excretion). Discusses osmoregulation, homeostatic feedback loops involving ADH and aldosterone, kidney stones, dialysis, and the social impact of diseases like bilharzia.',
    s.id,
    3,
    8,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 9: Population Ecology
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
    'LFS11-T09',
    'life-sciences-grade-11-population-ecology',
    'Population Ecology',
    'Ecology of populations, counting techniques, growth curves, and environmental interactions.',
    'Detailed study of population ecology, including parameters affecting population size, direct and indirect counting methods, geometric and logistic growth curves, and environmental resistance. Investigates interactions like predation, competition, and symbiosis, as well as social organisation, ecological succession, and human population age-gender pyramids.',
    s.id,
    3,
    9,
    16,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;

-- Topic 10: Human Impact on the Environment
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
    'LFS11-T10',
    'life-sciences-grade-11-human-impact-on-the-environment',
    'Human Impact on the Environment',
    'Analysing human activity on atmosphere, climate, water, food security, and waste.',
    'Comprehensive overview of major environmental challenges driven by human activity: atmosphere and climate change (enhanced greenhouse effect, global warming, ozone depletion), water availability and quality, food security, solid waste management (recycling, methane capture), and biodiversity loss (poaching, habitat destruction, alien plant invasions) within South Africa.',
    s.id,
    4,
    10,
    16,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'LFS11'
ON CONFLICT (code) DO NOTHING;