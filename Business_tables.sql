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
    business_id INTEGER NOT NULL,
    name INTEGER NOT NULL,
    address INTEGER NOT NULL,
    city INTEGER NOT NULL,
    state VARCHAR NOT NULL,
    postal_code INTEGER NOT NULL,
    stars VARCHAR NOT NULL,
    review_count INTEGER NOT NULL,
    is_open INTEGER NOT NULL,
    categories VARCHAR NOT NULL,
    hours VARCHAR NOT NULL,
    PRIMARY KEY (business_id),
	UNIQUE (business_id)
);


