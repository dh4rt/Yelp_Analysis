CREATE TABLE review (
    review_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    business_id INTEGER NOT NULL,
    stars VARCHAR NOT NULL,
    useful VARCHAR NOT NULL,
    funny VARCHAR NOT NULL,
    cool VARCHAR NOT NULL,
    text VARCHAR NOT NULL,
    date VARCHAR NOT NULL,
    PRIMARY KEY (business_id),
	UNIQUE (review_id)
);

CREATE TABLE business (
    business_id VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    postal_code VARCHAR NOT NULL,
    stars NUMERIC NOT NULL,
    review_count INTEGER NOT NULL,
    PRIMARY KEY (business_id),
	UNIQUE (business_id)
);


