SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;

CREATE TABLE book_leases (
    id integer NOT NULL,
    date_start timestamp without time zone,
    date_end timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    member_id integer,
    active boolean,
    book_id integer
);

CREATE SEQUENCE book_leases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE book_leases_id_seq OWNED BY book_leases.id;

CREATE TABLE books (
    id integer NOT NULL,
    title character varying,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    publishing_house_id integer,
    author_id integer
);

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE books_id_seq OWNED BY books.id;

CREATE TABLE comments (
    id integer NOT NULL,
    text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    membership_id integer
);

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;

CREATE TABLE members (
    id integer NOT NULL,
    name character varying,
    surname character varying,
    email character varying,
    card_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE members_id_seq OWNED BY members.id;

CREATE TABLE memberships (
    id integer NOT NULL,
    fee_paid boolean,
    tshirt boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    member_id integer,
    period_id integer,
    who_signed_up integer
);

CREATE SEQUENCE memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE memberships_id_seq OWNED BY memberships.id;

CREATE TABLE memberships_roles (
    membership_id integer NOT NULL,
    role_id integer NOT NULL
);

CREATE TABLE periods (
    id integer NOT NULL,
    fee numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    info character varying,
    academic_year character varying
);

CREATE SEQUENCE periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE periods_id_seq OWNED BY periods.id;

CREATE TABLE publishing_houses (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

CREATE SEQUENCE publishing_houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE publishing_houses_id_seq OWNED BY publishing_houses.id;

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);

CREATE TABLE users (
    id integer NOT NULL,
    email character varying NOT NULL,
    crypted_password character varying,
    salt character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE users_id_seq OWNED BY users.id;

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);
ALTER TABLE ONLY book_leases ALTER COLUMN id SET DEFAULT nextval('book_leases_id_seq'::regclass);
ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);
ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);
ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);
ALTER TABLE ONLY memberships ALTER COLUMN id SET DEFAULT nextval('memberships_id_seq'::regclass);
ALTER TABLE ONLY periods ALTER COLUMN id SET DEFAULT nextval('periods_id_seq'::regclass);
ALTER TABLE ONLY publishing_houses ALTER COLUMN id SET DEFAULT nextval('publishing_houses_id_seq'::regclass);
ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);
ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);

ALTER TABLE ONLY book_leases
    ADD CONSTRAINT book_leases_pkey PRIMARY KEY (id);

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);

ALTER TABLE ONLY memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);

ALTER TABLE ONLY periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);

ALTER TABLE ONLY publishing_houses
    ADD CONSTRAINT publishing_houses_pkey PRIMARY KEY (id);

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE INDEX index_book_leases_on_book_id ON book_leases USING btree (book_id);
CREATE INDEX index_book_leases_on_member_id ON book_leases USING btree (member_id);
CREATE INDEX index_books_on_author_id ON books USING btree (author_id);
CREATE INDEX index_books_on_publishing_house_id ON books USING btree (publishing_house_id);
CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);
CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);

ALTER TABLE ONLY book_leases
    ADD CONSTRAINT fk_rails_1d0b9c786b FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE ONLY book_leases
    ADD CONSTRAINT fk_rails_38fa82dcf8 FOREIGN KEY (book_id) REFERENCES books(id);
ALTER TABLE ONLY books
    ADD CONSTRAINT fk_rails_53d51ce16a FOREIGN KEY (author_id) REFERENCES authors(id);
ALTER TABLE ONLY books
    ADD CONSTRAINT fk_rails_dcf9c24c0e FOREIGN KEY (publishing_house_id) REFERENCES publishing_houses(id);
