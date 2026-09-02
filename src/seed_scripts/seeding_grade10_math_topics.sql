-- Seeding script for Grade 10 Mathematics topics based on the Siyavula Everything Maths textbook (textbook.pdf) and CAPS curriculum.
-- Assumes parent subject with code 'MAT10' exists in the subjects table.

-- Chapter 1: Algebraic Expressions
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
    'MAT10-T01',
    'mathematics-grade-10-algebraic-expressions',
    'Algebraic Expressions',
    'The real number system, products, factorisation, and algebraic fractions.',
    'Study of the real number system, including rational and irrational numbers, rounding decimal numbers, estimating surds, multiplying algebraic expressions, factorising trinomials and difference of squares, and simplifying algebraic fractions.',
    s.id,
    1,
    1,
    15,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 2: Exponents
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
    'MAT10-T02',
    'mathematics-grade-10-exponents',
    'Exponents',
    'Laws of exponents, rational exponents, and solving exponential equations.',
    'Study of the revision of exponent laws, simplifying expressions with rational exponents, and solving simple exponential equations where the variable is in the exponent.',
    s.id,
    1,
    2,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 3: Number Patterns
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
    'MAT10-T03',
    'mathematics-grade-10-number-patterns',
    'Number Patterns',
    'Investigating, describing, and finding general formulas for linear sequences.',
    'Introduction to sequences and number patterns, focusing on linear sequences with a constant common difference, and finding the general term formula.',
    s.id,
    1,
    3,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 4: Equations and Inequalities
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
    'MAT10-T04',
    'mathematics-grade-10-equations-and-inequalities',
    'Equations and Inequalities',
    'Linear, quadratic, simultaneous, and literal equations, word problems, and linear inequalities.',
    'Comprehensive study of solving linear equations, quadratic equations by factorisation, simultaneous linear equations algebraically and graphically, literal equations (changing the subject of a formula), solving word problems, and solving linear inequalities.',
    s.id,
    1,
    4,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 5: Trigonometry
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
    'MAT10-T05',
    'mathematics-grade-10-trigonometry',
    'Trigonometry',
    'Introduction to trigonometric ratios, special angles, equations, and ratios in the Cartesian plane.',
    'Introduction to trigonometry, including similarity of triangles, defining sine, cosine, and tangent ratios, reciprocal ratios (cosecant, secant, cotangent), using calculator skills, special angles (30, 45, and 60 degrees), solving simple trigonometric equations, and defining trigonometric ratios in the Cartesian plane.',
    s.id,
    2,
    5,
    15,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 6: Functions
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
    'MAT10-T06',
    'mathematics-grade-10-functions',
    'Functions',
    'Study of linear, quadratic, hyperbolic, exponential, and trigonometric functions.',
    'Comprehensive study of functions, their parameters, and graphs on the Cartesian plane. Covers linear, quadratic (parabolic), hyperbolic, exponential, and trigonometric (sine, cosine, tangent) parent functions and their vertical transformations, as well as domain, range, asymptotes, and interpreting graphs.',
    s.id,
    2,
    6,
    18,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 7: Euclidean Geometry
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
    'MAT10-T07',
    'mathematics-grade-10-euclidean-geometry',
    'Euclidean Geometry',
    'Properties of triangles, quadrilaterals, and the mid-point theorem.',
    'Study of circle and polygon geometry, focusing on the classification and properties of triangles, quadrilaterals (parallelograms, rectangles, rhombuses, squares, trapeziums, kites), and the formulation and application of the mid-point theorem.',
    s.id,
    2,
    7,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 8: Analytical Geometry
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
    'MAT10-T08',
    'mathematics-grade-10-analytical-geometry',
    'Analytical Geometry',
    'Distance, gradient, and mid-point formulas on the Cartesian plane.',
    'Study of coordinate geometry on the Cartesian plane, including drawing figures, calculating the distance between two points, finding the gradient of a line, and determining the coordinates of the mid-point of a line segment.',
    s.id,
    3,
    8,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 9: Finance and Growth
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
    'MAT10-T09',
    'mathematics-grade-10-finance-and-growth',
    'Finance and Growth',
    'Simple interest, compound interest, hire-purchase, and foreign exchange.',
    'Study of financial mathematics, focusing on simple and compound interest calculations, applications such as hire-purchase agreements, and understanding foreign exchange rates.',
    s.id,
    3,
    9,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 10: Statistics
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
    'MAT10-T10',
    'mathematics-grade-10-statistics',
    'Statistics',
    'Collecting and grouping data, central tendency, dispersion, and the five-number summary.',
    'Introduction to data handling, including data collection methods, measures of central tendency (mean, median, mode) for ungrouped and grouped data, measures of dispersion (range, quartiles, percentiles, interquartile range), and the five-number summary (with box-and-whisker plots).',
    s.id,
    3,
    10,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 11: Trigonometry (Two-dimensional problems)
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
    'MAT10-T11',
    'mathematics-grade-10-trigonometry-two-dimensional-problems',
    'Trigonometry (Two-dimensional problems)',
    'Applying trigonometric ratios to solve practical two-dimensional height and distance problems.',
    'Applications of trigonometric ratios to solve practical two-dimensional problems, including calculating heights, distances, angles of elevation, and angles of depression in right-angled triangles.',
    s.id,
    4,
    11,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 12: Euclidean Geometry (Proofs and conjectures)
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
    'MAT10-T12',
    'mathematics-grade-10-euclidean-geometry-proofs-and-conjectures',
    'Euclidean Geometry (Proofs and conjectures)',
    'Formal geometric proofs and conjectures regarding triangles and quadrilaterals.',
    'Advanced polygon geometry focusing on constructing formal proofs, analyzing geometric conjectures, and solving multi-step geometric problems involving triangles and quadrilaterals.',
    s.id,
    4,
    12,
    6,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 13: Measurements
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
    'MAT10-T13',
    'mathematics-grade-10-measurements',
    'Measurements',
    'Surface area and volume of right prisms, cylinders, pyramids, cones, and spheres.',
    'Study of 2D area of polygons and 3D measurements, including surface area and volume of right prisms, cylinders, pyramids, cones, and spheres, and analyzing the effect on surface area and volume when multiplying a dimension by a factor of k.',
    s.id,
    4,
    13,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;

-- Chapter 14: Probability
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
    'MAT10-T14',
    'mathematics-grade-10-probability',
    'Probability',
    'Theoretical probability, relative frequency, Venn diagrams, and probability identities.',
    'Introduction to probability theory, including theoretical probability, relative frequency (experimental probability), Venn diagrams for representing sample spaces, union and intersection of events, probability identities, mutually exclusive events, and complementary events.',
    s.id,
    4,
    14,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT10'
ON CONFLICT (code) DO NOTHING;
