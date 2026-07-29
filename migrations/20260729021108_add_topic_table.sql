-- Add migration script here
CREATE TYPE topic_status AS ENUM (
    'draft',
    'published',
    'archived'
    );

CREATE TABLE topics (
    --------------------------------------------------------------------------
    -- Identity
    --------------------------------------------------------------------------
                        id UUID PRIMARY KEY,

                        code VARCHAR(30) NOT NULL UNIQUE,
                        slug VARCHAR(200) NOT NULL UNIQUE,

                        title VARCHAR(150) NOT NULL,
                        short_description VARCHAR(160),
                        description TEXT,

    --------------------------------------------------------------------------
    -- Relationships
    --------------------------------------------------------------------------
                        subject_id UUID NOT NULL,

    --------------------------------------------------------------------------
    -- Curriculum
    --------------------------------------------------------------------------
                        term SMALLINT NOT NULL,

                        display_order INTEGER NOT NULL DEFAULT 0,

                        estimated_hours SMALLINT,

    --------------------------------------------------------------------------
    -- Cached Statistics
    --------------------------------------------------------------------------
                        total_lessons INTEGER NOT NULL DEFAULT 0,
                        total_resources INTEGER NOT NULL DEFAULT 0,
                        total_quizzes INTEGER NOT NULL DEFAULT 0,
                        total_assignments INTEGER NOT NULL DEFAULT 0,

    --------------------------------------------------------------------------
    -- Status
    --------------------------------------------------------------------------
                        status topic_status NOT NULL DEFAULT 'draft',

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
    -- Constraints
    --------------------------------------------------------------------------
                        CONSTRAINT chk_topic_term
                            CHECK (term BETWEEN 1 AND 4),

                        CONSTRAINT chk_topic_version
                            CHECK (version >= 1),

                        CONSTRAINT chk_topic_display_order
                            CHECK (display_order >= 0),

                        CONSTRAINT chk_topic_estimated_hours
                            CHECK (
                                estimated_hours IS NULL
                                    OR estimated_hours >= 0
                                ),

                        CONSTRAINT chk_topic_total_lessons
                            CHECK (total_lessons >= 0),

                        CONSTRAINT chk_topic_total_resources
                            CHECK (total_resources >= 0),

                        CONSTRAINT chk_topic_total_quizzes
                            CHECK (total_quizzes >= 0),

                        CONSTRAINT chk_topic_total_assignments
                            CHECK (total_assignments >= 0),

    --------------------------------------------------------------------------
    -- Foreign Keys
    --------------------------------------------------------------------------
                        CONSTRAINT fk_topic_subject
                            FOREIGN KEY (subject_id)
                                REFERENCES subjects(id)
                                ON UPDATE CASCADE
                                ON DELETE RESTRICT
);

----------------------------------------------------------------------------
-- INDEXES
----------------------------------------------------------------------------

CREATE INDEX idx_topics_subject
    ON topics(subject_id);

CREATE INDEX idx_topics_listing
    ON topics(
              subject_id,
              term,
              status,
              display_order
        );

CREATE INDEX idx_topics_display_order
    ON topics(display_order);

CREATE INDEX idx_topics_updated_at
    ON topics(updated_at DESC);

CREATE INDEX idx_topics_featured
    ON topics(is_featured)
    WHERE is_featured = TRUE;

CREATE INDEX idx_topics_free
    ON topics(is_free)
    WHERE is_free = TRUE;

CREATE INDEX idx_topics_active
    ON topics(deleted_at)
    WHERE deleted_at IS NULL;