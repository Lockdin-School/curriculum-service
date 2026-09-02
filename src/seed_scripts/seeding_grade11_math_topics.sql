-- Seeding script for Grade 11 Mathematics topics based on the Siyavula Everything Maths textbook and CAPS curriculum.
-- Assumes parent subject with code 'MAT11' exists in the subjects table.

-- Chapter 1: Exponents and Surds
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
    'MAT11-T01',
    'mathematics-grade-11-exponents-and-surds',
    'Exponents and Surds',
    'Rational exponents, surds, surd equations, and exponential applications.',
    'Study of rational exponents and surds, simplifying surds, solving surd equations, and real-world applications of exponentials.',
    s.id,
    1,
    1,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 2: Equations and Inequalities
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
    'MAT11-T02',
    'mathematics-grade-11-equations-and-inequalities',
    'Equations and Inequalities',
    'Quadratic equations, completing the square, nature of roots, and inequalities.',
    'Comprehensive study of quadratic equations, completing the square, quadratic formula, substitution, nature of roots, quadratic inequalities, simultaneous equations, and applied word problems.',
    s.id,
    1,
    2,
    15,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
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
    'MAT11-T03',
    'mathematics-grade-11-number-patterns',
    'Number Patterns',
    'Linear sequences and quadratic sequences.',
    'Study of linear sequences with a constant first difference and quadratic sequences where the second difference is constant, including finding the general terms.',
    s.id,
    1,
    3,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 4: Analytical Geometry
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
    'MAT11-T04',
    'mathematics-grade-11-analytical-geometry',
    'Analytical Geometry',
    'Straight lines, gradient, inclination, parallel, and perpendicular lines.',
    'Study of coordinate geometry in the Cartesian plane, including equations of straight lines, gradient, angle of inclination, and properties of parallel and perpendicular lines.',
    s.id,
    1,
    4,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 5: Functions
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
    'MAT11-T05',
    'mathematics-grade-11-functions',
    'Functions',
    'Linear, quadratic, exponential, hyperbolic, and trigonometric functions.',
    'Comprehensive study of functions and their graphs including linear, quadratic, hyperbolic, exponential, and trigonometric (sine, cosine, tangent) functions, along with average gradient, domain, range, and asymptotes.',
    s.id,
    2,
    5,
    18,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 6: Trigonometry
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
    'MAT11-T06',
    'mathematics-grade-11-trigonometry',
    'Trigonometry',
    'Trigonometric identities, reduction formulae, equations, and triangle rules.',
    'Advanced study of trigonometric identities (quotient and square), reduction formulae, trigonometric equations, general solutions, and the application of the area, sine, and cosine rules in triangles.',
    s.id,
    2,
    6,
    18,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 7: Measurement
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
    'MAT11-T07',
    'mathematics-grade-11-measurement',
    'Measurement',
    'Area, surface area, and volume of 2D and 3D geometric shapes.',
    'Revision of perimeter and area of polygons, surface area and volume of right prisms, cylinders, pyramids, cones, and spheres, and the effect of scaling dimensions by a constant factor.',
    s.id,
    3,
    7,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 8: Euclidean Geometry
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
    'MAT11-T08',
    'mathematics-grade-11-euclidean-geometry',
    'Euclidean Geometry',
    'Circle geometry, cyclic quadrilaterals, tangents, and theorems.',
    'Study of circle geometry, including chords, perpendicular bisectors, angles subtended by arcs, cyclic quadrilaterals, tangents, and the tangent-chord theorem.',
    s.id,
    3,
    8,
    15,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 9: Finance, Growth and Decay
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
    'MAT11-T09',
    'mathematics-grade-11-finance-growth-and-decay',
    'Finance, Growth and Decay',
    'Simple and compound depreciation, timelines, and interest rates.',
    'Study of simple and compound interest and depreciation, timelines for multi-stage transactions, and the comparison of nominal and effective interest rates.',
    s.id,
    4,
    9,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 10: Probability
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
    'MAT11-T10',
    'mathematics-grade-11-probability',
    'Probability',
    'Dependent and independent events, Venn, tree diagrams, and contingency tables.',
    'Study of probability theory including dependent and independent events, Venn diagrams with three events, tree diagrams, and contingency tables to determine event independence.',
    s.id,
    4,
    10,
    12,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 11: Statistics
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
    'MAT11-T11',
    'mathematics-grade-11-statistics',
    'Statistics',
    'Histograms, ogives, variance, standard deviation, skewed data, and outliers.',
    'Study of data analysis tools including histograms, cumulative frequency graphs (ogives), measures of dispersion (variance and standard deviation), symmetric versus skewed data, and the identification of outliers.',
    s.id,
    4,
    11,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;

-- Chapter 12: Linear Programming
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
    'MAT11-T12',
    'mathematics-grade-11-linear-programming',
    'Linear Programming',
    'Inequalities, feasible regions, optimization, and graphic solutions.',
    'Introduction to linear programming optimization, formulating system constraint inequalities, graphing feasible regions, and finding optimal solutions using objective functions.',
    s.id,
    4,
    12,
    9,
    'published',
    FALSE,
    FALSE
FROM subjects s
WHERE s.code = 'MAT11'
ON CONFLICT (code) DO NOTHING;