--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: _fluent_migrations; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public._fluent_migrations (
    id uuid NOT NULL,
    name text NOT NULL,
    batch bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public._fluent_migrations OWNER TO rbuchler;

--
-- Name: article_tags; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.article_tags (
    id uuid NOT NULL,
    title text NOT NULL,
    color_code text NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.article_tags OWNER TO rbuchler;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.articles (
    id uuid NOT NULL,
    title text NOT NULL,
    "shortTitle" text NOT NULL,
    "imageUrl" text NOT NULL,
    "categoryId" uuid,
    "colorCode" text NOT NULL,
    text text NOT NULL,
    tags text[] NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.articles OWNER TO rbuchler;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.banners (
    id uuid NOT NULL,
    partner text NOT NULL,
    "imageUrl" text,
    "widthDimension" bigint,
    "heightDimension" bigint,
    status boolean NOT NULL,
    audience text,
    priority bigint,
    "dateCampaignStart" timestamp with time zone,
    "dateCampaignEnd" timestamp with time zone,
    link text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.banners OWNER TO rbuchler;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name text,
    description text,
    status boolean,
    "qtdTrails" bigint,
    "imageUrl" text,
    "colorCode" text,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public.categories OWNER TO rbuchler;

--
-- Name: general_pets; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.general_pets (
    id uuid NOT NULL,
    user_id uuid,
    pet_specie text
);


ALTER TABLE public.general_pets OWNER TO rbuchler;

--
-- Name: pet-interests; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public."pet-interests" (
    id uuid NOT NULL,
    categories uuid[] NOT NULL,
    "petId" uuid NOT NULL,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public."pet-interests" OWNER TO rbuchler;

--
-- Name: pets; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.pets (
    id uuid NOT NULL,
    name text NOT NULL,
    specie text,
    breed text,
    weight text,
    birth_date text,
    photo_url text,
    main boolean,
    gender text,
    created_at date,
    updated_at date,
    general_pets uuid NOT NULL
);


ALTER TABLE public.pets OWNER TO rbuchler;

--
-- Name: reset_password; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.reset_password (
    id uuid NOT NULL,
    token text,
    user_id uuid NOT NULL,
    created_at date,
    updated_at date
);


ALTER TABLE public.reset_password OWNER TO rbuchler;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.subscriptions (
    id uuid NOT NULL,
    user_id uuid,
    "userType" text NOT NULL,
    "subscriptionStatus" text NOT NULL,
    "subscriptionType" text NOT NULL,
    created_at date,
    updated_at date
);


ALTER TABLE public.subscriptions OWNER TO rbuchler;

--
-- Name: trail_content_progress; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.trail_content_progress (
    id uuid NOT NULL,
    pet_id uuid,
    user_id uuid,
    trail_content_id uuid,
    is_completed boolean
);


ALTER TABLE public.trail_content_progress OWNER TO rbuchler;

--
-- Name: trail_contents; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.trail_contents (
    id uuid NOT NULL,
    "trailId" uuid,
    text text,
    "imageUrl" text,
    progress double precision,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public.trail_contents OWNER TO rbuchler;

--
-- Name: trails; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.trails (
    id uuid NOT NULL,
    "categoryId" uuid,
    name text,
    description text,
    partner text,
    "qtContent" bigint,
    "premiumFlag" boolean,
    "imageUrl" text,
    "clickerFlag" boolean,
    created_at date,
    updated_at date
);


ALTER TABLE public.trails OWNER TO rbuchler;

--
-- Name: trails_rating_by_pet; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.trails_rating_by_pet (
    id uuid NOT NULL,
    category_id uuid,
    score_rating double precision,
    pet_id uuid,
    user_id uuid,
    created_at date,
    updated_at date
);


ALTER TABLE public.trails_rating_by_pet OWNER TO rbuchler;

--
-- Name: users; Type: TABLE; Schema: public; Owner: rbuchler
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email text NOT NULL,
    full_name text NOT NULL,
    nickname text,
    birth_date text,
    gender text,
    photo_url text,
    created_at date,
    updated_at date,
    phone_number text,
    push_allow boolean,
    password text,
    third_party_login boolean,
    third_party_login_id_token text,
    third_party_login_server_auth_code text,
    general_pets_id uuid
);


ALTER TABLE public.users OWNER TO rbuchler;

--
-- Data for Name: _fluent_migrations; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public._fluent_migrations (id, name, batch, created_at, updated_at) FROM stdin;
a7fef58b-0add-4edd-b553-197b1941edaa	App.CreateUserTableMigration	1	2023-09-14 17:33:26.483411-03	2023-09-14 17:33:26.483411-03
1198b825-aad0-476a-bea1-f9cd90ee28a0	App.CreateGeneralPetsTableMigration	1	2023-09-14 17:33:26.487725-03	2023-09-14 17:33:26.487725-03
6e079a35-5179-4349-b4de-eb20f3d42e7e	App.CreatePetTabeMigration	1	2023-09-14 17:33:26.491285-03	2023-09-14 17:33:26.491285-03
e171d7fc-9caa-43cd-93e3-69790a4cb780	App.CreateCategoryTableMigration	1	2023-09-14 17:33:26.494626-03	2023-09-14 17:33:26.494626-03
ffdd693a-fcc7-4c3d-966b-28d30b2c9834	App.CreateArticlesTableMigration	1	2023-09-14 17:33:26.498211-03	2023-09-14 17:33:26.498211-03
bee27b76-a1d3-4aab-a140-3609ab552c5d	App.CreateResetPaswordTableMigration	1	2023-09-14 17:33:26.501881-03	2023-09-14 17:33:26.501881-03
ef2700df-1515-4685-8ad4-63c14774997c	App.CreateArticleTagTableMigration	1	2023-09-14 17:33:26.505292-03	2023-09-14 17:33:26.505292-03
bb4a3fc1-3fe1-467c-8346-e0ddd04e5d3e	App.CreateTrailTableMigration	1	2023-09-14 17:33:26.509625-03	2023-09-14 17:33:26.509625-03
52d7f0f9-6b25-4387-bbc0-2abb0d74a0c9	App.CreateTrailContentTableMigration	1	2023-09-14 17:33:26.513533-03	2023-09-14 17:33:26.513533-03
4f007373-869c-4450-b287-60c8002140c6	App.CreateTrailRatingTableMigration	1	2023-09-14 17:33:26.517811-03	2023-09-14 17:33:26.517811-03
d0493bf8-b571-4e46-955e-3dfeeb46fa3e	App.CreateTrailContentProgressTrableMigration	2	2023-09-14 20:17:48.462162-03	2023-09-14 20:17:48.462162-03
0e60d848-46be-44d4-9d71-a0dd02dacd7a	App.CreatePetInterestsTableMigration	2	2023-09-14 20:17:48.467607-03	2023-09-14 20:17:48.467607-03
9044d3d6-02d7-4ced-abdc-459177f17c4d	App.CreateSubscriptionTableMigration	2	2023-09-14 20:17:48.471287-03	2023-09-14 20:17:48.471287-03
e16b8c61-d9b6-469c-b277-14e60e3c44e8	App.CreateBannersTableMigration	2	2023-09-14 20:17:48.47421-03	2023-09-14 20:17:48.47421-03
\.


--
-- Data for Name: article_tags; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.article_tags (id, title, color_code, user_id) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.articles (id, title, "shortTitle", "imageUrl", "categoryId", "colorCode", text, tags, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.banners (id, partner, "imageUrl", "widthDimension", "heightDimension", status, audience, priority, "dateCampaignStart", "dateCampaignEnd", link, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.categories (id, name, description, status, "qtdTrails", "imageUrl", "colorCode", "createdAt", "updatedAt") FROM stdin;
1c648506-a2ca-4d1c-908f-62a3cc7a799a	Primeiros dias do pet		f	0	\N		2023-09-14	2023-09-14
85290b96-20d7-404f-8ed1-d86965857ef9	Alimentação		f	0	\N		2023-09-14	2023-09-14
0fa9018d-dacf-45b7-9ac2-eaa2a2e1369b	Saúde		f	0	\N		2023-09-14	2023-09-14
6c3e5e1a-be4c-43fe-bdd0-0a074a65d5b1	Higiene		f	0	\N		2023-09-14	2023-09-14
b0efac18-3bd7-4724-bf7a-496f96992d3d	Comportamento		f	0	\N		2023-09-14	2023-09-14
b141002d-28fe-43bb-a422-a3a87e75f389	Treinamento básico		f	0	\N		2023-09-14	2023-09-14
\.


--
-- Data for Name: general_pets; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.general_pets (id, user_id, pet_specie) FROM stdin;
3641876d-55af-41d6-bd26-05c317a7bea7	3963bf84-2326-4713-a6e4-3951a223a9a6	\N
\.


--
-- Data for Name: pet-interests; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public."pet-interests" (id, categories, "petId", "createdAt", "updatedAt") FROM stdin;
fddf8385-9bb7-489e-9eab-fd9c5b877b25	{1c648506-a2ca-4d1c-908f-62a3cc7a799a,85290b96-20d7-404f-8ed1-d86965857ef9,0fa9018d-dacf-45b7-9ac2-eaa2a2e1369b,6c3e5e1a-be4c-43fe-bdd0-0a074a65d5b1,b0efac18-3bd7-4724-bf7a-496f96992d3d,b141002d-28fe-43bb-a422-a3a87e75f389}	77f3b919-2eb4-4335-9f76-c73377f4edf7	2023-09-14	2023-09-14
db34b01f-24b6-422f-99fc-7d574036af38	{1c648506-a2ca-4d1c-908f-62a3cc7a799a,85290b96-20d7-404f-8ed1-d86965857ef9,0fa9018d-dacf-45b7-9ac2-eaa2a2e1369b,6c3e5e1a-be4c-43fe-bdd0-0a074a65d5b1,b0efac18-3bd7-4724-bf7a-496f96992d3d,b141002d-28fe-43bb-a422-a3a87e75f389}	77f3b919-2eb4-4335-9f76-c73377f4edf7	2023-09-14	2023-09-14
fe4eca72-0d36-4b78-b071-64cf51618516	{1c648506-a2ca-4d1c-908f-62a3cc7a799a,85290b96-20d7-404f-8ed1-d86965857ef9,0fa9018d-dacf-45b7-9ac2-eaa2a2e1369b,6c3e5e1a-be4c-43fe-bdd0-0a074a65d5b1,b0efac18-3bd7-4724-bf7a-496f96992d3d,b141002d-28fe-43bb-a422-a3a87e75f389}	77f3b919-2eb4-4335-9f76-c73377f4edf7	2023-09-14	2023-09-14
\.


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.pets (id, name, specie, breed, weight, birth_date, photo_url, main, gender, created_at, updated_at, general_pets) FROM stdin;
77f3b919-2eb4-4335-9f76-c73377f4edf7	Sassa	dog	Outro	17			t	\N	2023-09-14	2023-09-14	3641876d-55af-41d6-bd26-05c317a7bea7
\.


--
-- Data for Name: reset_password; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.reset_password (id, token, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.subscriptions (id, user_id, "userType", "subscriptionStatus", "subscriptionType", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trail_content_progress; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.trail_content_progress (id, pet_id, user_id, trail_content_id, is_completed) FROM stdin;
\.


--
-- Data for Name: trail_contents; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.trail_contents (id, "trailId", text, "imageUrl", progress, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: trails; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.trails (id, "categoryId", name, description, partner, "qtContent", "premiumFlag", "imageUrl", "clickerFlag", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trails_rating_by_pet; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.trails_rating_by_pet (id, category_id, score_rating, pet_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rbuchler
--

COPY public.users (id, email, full_name, nickname, birth_date, gender, photo_url, created_at, updated_at, phone_number, push_allow, password, third_party_login, third_party_login_id_token, third_party_login_server_auth_code, general_pets_id) FROM stdin;
3963bf84-2326-4713-a6e4-3951a223a9a6	martinitorquato@gmail.com	Raphael Torquato	RTorquato	\N	\N	\N	2023-09-14	2023-09-15	\N	\N	$2b$12$MuYSUf113T1JYLqzJxatGuBp3QvrN9XP75CL5DABYwcX0xonanLCW	\N	\N	\N	3641876d-55af-41d6-bd26-05c317a7bea7
\.


--
-- Name: _fluent_migrations _fluent_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public._fluent_migrations
    ADD CONSTRAINT _fluent_migrations_pkey PRIMARY KEY (id);


--
-- Name: article_tags article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: general_pets general_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.general_pets
    ADD CONSTRAINT general_pets_pkey PRIMARY KEY (id);


--
-- Name: pet-interests pet-interests_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public."pet-interests"
    ADD CONSTRAINT "pet-interests_pkey" PRIMARY KEY (id);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: reset_password reset_password_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.reset_password
    ADD CONSTRAINT reset_password_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: trail_content_progress trail_content_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_content_progress
    ADD CONSTRAINT trail_content_progress_pkey PRIMARY KEY (id);


--
-- Name: trail_contents trail_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_contents
    ADD CONSTRAINT trail_contents_pkey PRIMARY KEY (id);


--
-- Name: trails trails_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails
    ADD CONSTRAINT trails_pkey PRIMARY KEY (id);


--
-- Name: trails_rating_by_pet trails_rating_by_pet_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails_rating_by_pet
    ADD CONSTRAINT trails_rating_by_pet_pkey PRIMARY KEY (id);


--
-- Name: _fluent_migrations uq:_fluent_migrations.name; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public._fluent_migrations
    ADD CONSTRAINT "uq:_fluent_migrations.name" UNIQUE (name);


--
-- Name: subscriptions uq:subscriptions.user_id; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "uq:subscriptions.user_id" UNIQUE (user_id);


--
-- Name: users uq:users.email; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "uq:users.email" UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: article_tags article_tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: articles articles_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT "articles_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: general_pets general_pets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.general_pets
    ADD CONSTRAINT general_pets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: pet-interests pet-interests_petId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public."pet-interests"
    ADD CONSTRAINT "pet-interests_petId_fkey" FOREIGN KEY ("petId") REFERENCES public.pets(id) ON DELETE CASCADE;


--
-- Name: pets pets_general_pets_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_general_pets_fkey FOREIGN KEY (general_pets) REFERENCES public.general_pets(id) ON DELETE CASCADE;


--
-- Name: reset_password reset_password_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.reset_password
    ADD CONSTRAINT reset_password_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: subscriptions subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: trail_content_progress trail_content_progress_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_content_progress
    ADD CONSTRAINT trail_content_progress_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES public.pets(id) ON DELETE CASCADE;


--
-- Name: trail_content_progress trail_content_progress_trail_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_content_progress
    ADD CONSTRAINT trail_content_progress_trail_content_id_fkey FOREIGN KEY (trail_content_id) REFERENCES public.trail_contents(id) ON DELETE CASCADE;


--
-- Name: trail_content_progress trail_content_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_content_progress
    ADD CONSTRAINT trail_content_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: trail_contents trail_contents_trailId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trail_contents
    ADD CONSTRAINT "trail_contents_trailId_fkey" FOREIGN KEY ("trailId") REFERENCES public.trails(id);


--
-- Name: trails trails_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails
    ADD CONSTRAINT "trails_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id);


--
-- Name: trails_rating_by_pet trails_rating_by_pet_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails_rating_by_pet
    ADD CONSTRAINT trails_rating_by_pet_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trails_rating_by_pet trails_rating_by_pet_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails_rating_by_pet
    ADD CONSTRAINT trails_rating_by_pet_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES public.pets(id);


--
-- Name: trails_rating_by_pet trails_rating_by_pet_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rbuchler
--

ALTER TABLE ONLY public.trails_rating_by_pet
    ADD CONSTRAINT trails_rating_by_pet_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

