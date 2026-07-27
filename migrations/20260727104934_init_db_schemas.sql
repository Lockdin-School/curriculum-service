-- Add migration script here
CREATE TABLE subject_categories (
    --------------------------------------------------------------------------
    -- Identity
    --------------------------------------------------------------------------
                                    id UUID PRIMARY KEY,

                                    code VARCHAR(20) NOT NULL UNIQUE,
                                    name VARCHAR(100) NOT NULL UNIQUE,
                                    slug VARCHAR(100) NOT NULL UNIQUE,

                                    description TEXT,

                                    icon_url TEXT,
                                    theme_color CHAR(7),

                                    display_order INTEGER NOT NULL DEFAULT 0,

                                    is_active BOOLEAN NOT NULL DEFAULT TRUE,

                                    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                                    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

                                    CONSTRAINT chk_category_display_order
                                        CHECK (display_order >= 0),

                                    CONSTRAINT chk_category_theme_color
                                        CHECK (
                                            theme_color IS NULL
                                                OR theme_color ~ '^#[0-9A-Fa-f]{6}$'
                                            )
);

CREATE INDEX idx_subject_categories_display
    ON subject_categories(display_order);

CREATE INDEX idx_subject_categories_active
    ON subject_categories(is_active)
    WHERE is_active = TRUE;

CREATE TYPE curriculum_status AS ENUM (
    'draft',
    'active',
    'retired'
    );

CREATE TABLE curriculums (

                             id UUID PRIMARY KEY,

                             code VARCHAR(20) NOT NULL UNIQUE,
                             name VARCHAR(100) NOT NULL,

                             short_name VARCHAR(20),

                             slug VARCHAR(100) NOT NULL UNIQUE,

                             description TEXT,

                             country_code CHAR(2) NOT NULL,

                             version VARCHAR(20),

                             status curriculum_status
                                 NOT NULL DEFAULT 'active',

                             display_order INTEGER NOT NULL DEFAULT 0,

                             created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                             updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

                             CONSTRAINT chk_curriculum_display_order
                                 CHECK (display_order >= 0)
);

CREATE INDEX idx_curriculum_status
    ON curriculums(status);

CREATE INDEX idx_curriculum_display
    ON curriculums(display_order);


CREATE TABLE grades (
                        id UUID PRIMARY KEY,

                        grade SMALLINT NOT NULL UNIQUE,

                        name VARCHAR(20) NOT NULL UNIQUE,

                        display_order SMALLINT NOT NULL,

                        is_active BOOLEAN NOT NULL DEFAULT TRUE,

                        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                        updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

                        CONSTRAINT chk_grade
                            CHECK (grade BETWEEN 8 AND 12),

                        CONSTRAINT chk_display_order
                            CHECK (display_order >= 0)
);

CREATE INDEX idx_grades_display_order
    ON grades(display_order);

CREATE INDEX idx_grades_active
    ON grades(is_active)
    WHERE is_active = TRUE;

-- ============================================================================
-- SUBJECT STATUS
-- ============================================================================
CREATE TYPE subject_status AS ENUM (
    'draft',
    'published',
    'archived'
    );

-- ============================================================================
-- SUBJECTS
-- ============================================================================

CREATE TABLE subjects (
    --------------------------------------------------------------------------
    -- Identity
    --------------------------------------------------------------------------
                          id UUID PRIMARY KEY,

                          code VARCHAR(20) NOT NULL UNIQUE,
                          slug VARCHAR(150) NOT NULL UNIQUE,

                          title VARCHAR(100) NOT NULL,
                          short_description VARCHAR(160),
                          description TEXT,

    --------------------------------------------------------------------------
    -- Classification
    --------------------------------------------------------------------------
                          curriculum_id UUID NOT NULL,
                          grade_id UUID NOT NULL,
                          category_id UUID NOT NULL,

                          language_code VARCHAR(10) NOT NULL DEFAULT 'en',

    --------------------------------------------------------------------------
    -- Presentation
    --------------------------------------------------------------------------
                          cover_image_url TEXT,
                          icon_url TEXT,
                          theme_color CHAR(7),

                          display_order INTEGER NOT NULL DEFAULT 0,

    --------------------------------------------------------------------------
    -- Learning Metadata
    --------------------------------------------------------------------------
                          estimated_hours SMALLINT,

    --------------------------------------------------------------------------
    -- Cached Statistics (Denormalized)
    --------------------------------------------------------------------------
                          total_modules INTEGER NOT NULL DEFAULT 0,
                          total_topics INTEGER NOT NULL DEFAULT 0,
                          total_lessons INTEGER NOT NULL DEFAULT 0,
                          total_resources INTEGER NOT NULL DEFAULT 0,
                          total_quizzes INTEGER NOT NULL DEFAULT 0,
                          total_assignments INTEGER NOT NULL DEFAULT 0,
                          total_exams INTEGER NOT NULL DEFAULT 0,

    --------------------------------------------------------------------------
    -- Visibility & Status
    --------------------------------------------------------------------------
                          status subject_status NOT NULL DEFAULT 'draft',

                          is_featured BOOLEAN NOT NULL DEFAULT FALSE,
                          is_free BOOLEAN NOT NULL DEFAULT FALSE,

    --------------------------------------------------------------------------
    -- Versioning
    --------------------------------------------------------------------------
                          version INTEGER NOT NULL DEFAULT 1,

    --------------------------------------------------------------------------
    -- Audit
    --------------------------------------------------------------------------
                          created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                          updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

                          published_at TIMESTAMPTZ,
                          archived_at TIMESTAMPTZ,
                          deleted_at TIMESTAMPTZ,

    --------------------------------------------------------------------------
    -- Validation
    --------------------------------------------------------------------------
                          CONSTRAINT chk_subject_version
                              CHECK (version >= 1),

                          CONSTRAINT chk_subject_display_order
                              CHECK (display_order >= 0),

                          CONSTRAINT chk_subject_estimated_hours
                              CHECK (
                                  estimated_hours IS NULL
                                      OR estimated_hours >= 0
                                  ),

                          CONSTRAINT chk_subject_theme_color
                              CHECK (
                                  theme_color IS NULL
                                      OR theme_color ~ '^#[0-9A-Fa-f]{6}$'
                                  ),

                          CONSTRAINT chk_subject_total_modules
                              CHECK (total_modules >= 0),

                          CONSTRAINT chk_subject_total_topics
                              CHECK (total_topics >= 0),

                          CONSTRAINT chk_subject_total_lessons
                              CHECK (total_lessons >= 0),

                          CONSTRAINT chk_subject_total_resources
                              CHECK (total_resources >= 0),

                          CONSTRAINT chk_subject_total_quizzes
                              CHECK (total_quizzes >= 0),

                          CONSTRAINT chk_subject_total_assignments
                              CHECK (total_assignments >= 0),

                          CONSTRAINT chk_subject_total_exams
                              CHECK (total_exams >= 0),

    --------------------------------------------------------------------------
    -- Foreign Keys
    --------------------------------------------------------------------------
                          CONSTRAINT fk_subject_curriculum
                              FOREIGN KEY (curriculum_id)
                                  REFERENCES curriculums(id)
                                  ON UPDATE CASCADE
                                  ON DELETE RESTRICT,

                          CONSTRAINT fk_subject_grade
                              FOREIGN KEY (grade_id)
                                  REFERENCES grades(id)
                                  ON UPDATE CASCADE
                                  ON DELETE RESTRICT,

                          CONSTRAINT fk_subject_category
                              FOREIGN KEY (category_id)
                                  REFERENCES subject_categories(id)
                                  ON UPDATE CASCADE
                                  ON DELETE RESTRICT
);

-- ============================================================================
-- INDEXES
-- ============================================================================

-- Foreign Keys
CREATE INDEX idx_subjects_curriculum
    ON subjects(curriculum_id);

CREATE INDEX idx_subjects_grade
    ON subjects(grade_id);

CREATE INDEX idx_subjects_category
    ON subjects(category_id);

-- Main listing query
CREATE INDEX idx_subjects_listing
    ON subjects (
                 curriculum_id,
                 grade_id,
                 status,
                 display_order
        );

-- Display ordering
CREATE INDEX idx_subjects_display_order
    ON subjects(display_order);

-- Recently updated
CREATE INDEX idx_subjects_updated_at
    ON subjects(updated_at DESC);

-- Recently published
CREATE INDEX idx_subjects_published_at
    ON subjects(published_at DESC);

-- Featured
CREATE INDEX idx_subjects_featured
    ON subjects(is_featured)
    WHERE is_featured = TRUE;

-- Free subjects
CREATE INDEX idx_subjects_free
    ON subjects(is_free)
    WHERE is_free = TRUE;

-- Active (non-soft-deleted)
CREATE INDEX idx_subjects_active
    ON subjects(deleted_at)
    WHERE deleted_at IS NULL;