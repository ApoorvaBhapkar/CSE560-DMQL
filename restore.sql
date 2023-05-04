--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "London_Airbnb";
--
-- Name: London_Airbnb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "London_Airbnb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "London_Airbnb" OWNER TO postgres;

\connect "London_Airbnb"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: calendar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar (
    listing_id bigint NOT NULL,
    date date NOT NULL,
    available boolean,
    price money,
    adjusted_price money,
    minimum_nights integer,
    maximum_nights integer
);


ALTER TABLE public.calendar OWNER TO postgres;

--
-- Name: host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.host (
    host_id bigint NOT NULL,
    host_url text,
    host_name character varying(255),
    host_since date,
    host_location character varying(255),
    host_about text,
    host_response_time character varying(255),
    host_response_rate character varying(255),
    host_acceptance_rate double precision,
    host_is_superhost boolean,
    host_neighbourhood character varying(255),
    host_listings_count integer,
    host_total_listings_count integer,
    host_verifications text
);


ALTER TABLE public.host OWNER TO postgres;

--
-- Name: listing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listing (
    listing_id bigint NOT NULL,
    name character varying(255),
    description text,
    experiences_offered character varying(255),
    house_rules text,
    host_id bigint,
    street character varying(255),
    city character varying(255),
    state character varying(255),
    zipcode character varying(255),
    country character varying(255),
    latitude double precision,
    longitude double precision,
    property_type character varying(255),
    room_type character varying(255),
    accommodates integer,
    bathrooms double precision,
    bedrooms double precision,
    beds integer,
    bed_type character varying(255),
    amenities text,
    square_feet double precision,
    guests_included integer,
    minimum_nights integer,
    maximum_nights integer,
    cancellation_policy text,
    neighbourhood_id bigint
);


ALTER TABLE public.listing OWNER TO postgres;

--
-- Name: neighbourhood; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.neighbourhood (
    id bigint NOT NULL,
    neighbourhood text
);


ALTER TABLE public.neighbourhood OWNER TO postgres;

--
-- Name: pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricing (
    price money,
    weekly_price money,
    monthly_price money,
    security_deposit money,
    cleaning_fee money,
    extra_people money,
    listing_id bigint NOT NULL
);


ALTER TABLE public.pricing OWNER TO postgres;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    number_of_reviews integer,
    review_scores_rating double precision,
    review_scores_accuracy double precision,
    review_scores_cleanliness double precision,
    review_scores_checkin double precision,
    review_scores_communication double precision,
    review_scores_location double precision,
    review_scores_value double precision,
    listing_id bigint NOT NULL
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: reviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewer (
    reviewer_id bigint NOT NULL,
    reviewer_name character varying(255)
);


ALTER TABLE public.reviewer OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    listing_id bigint,
    id bigint NOT NULL,
    date date,
    reviewer_id bigint,
    comments text
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Data for Name: calendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3635.dat

--
-- Data for Name: host; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3632.dat

--
-- Data for Name: listing; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3634.dat

--
-- Data for Name: neighbourhood; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3633.dat

--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3636.dat

--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3637.dat

--
-- Data for Name: reviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3639.dat

--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3638.dat

--
-- Name: calendar calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar
    ADD CONSTRAINT calendar_pkey PRIMARY KEY (listing_id, date);


--
-- Name: host host_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host
    ADD CONSTRAINT host_pkey PRIMARY KEY (host_id);


--
-- Name: listing listing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing
    ADD CONSTRAINT listing_pkey PRIMARY KEY (listing_id);


--
-- Name: neighbourhood neighbourhood_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.neighbourhood
    ADD CONSTRAINT neighbourhood_pkey PRIMARY KEY (id);


--
-- Name: pricing pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pricing_pkey PRIMARY KEY (listing_id);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (listing_id);


--
-- Name: reviewer reviewer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewer
    ADD CONSTRAINT reviewer_id PRIMARY KEY (reviewer_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: ix_neighbourhood_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_neighbourhood_id ON public.neighbourhood USING btree (id);


--
-- Name: calendar calendar_fk_listing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar
    ADD CONSTRAINT calendar_fk_listing_id FOREIGN KEY (listing_id) REFERENCES public.listing(listing_id) NOT VALID;


--
-- Name: listing host_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing
    ADD CONSTRAINT host_fk FOREIGN KEY (host_id) REFERENCES public.host(host_id) NOT VALID;


--
-- Name: pricing listing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id) REFERENCES public.listing(listing_id) NOT VALID;


--
-- Name: listing neighbourhood_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing
    ADD CONSTRAINT neighbourhood_fk FOREIGN KEY (neighbourhood_id) REFERENCES public.neighbourhood(id) NOT VALID;


--
-- Name: rating rating_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_fk FOREIGN KEY (listing_id) REFERENCES public.listing(listing_id) NOT VALID;


--
-- Name: reviews reviewer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviewer_fk FOREIGN KEY (reviewer_id) REFERENCES public.reviewer(reviewer_id) ON DELETE CASCADE NOT VALID;


--
-- Name: reviews reviews_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_fk FOREIGN KEY (listing_id) REFERENCES public.listing(listing_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

