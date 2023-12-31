toc.dat                                                                                             0000600 0004000 0002000 00000020125 14473113500 0014435 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       7    .                {            CallOperator    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16398    CallOperator    DATABASE     �   CREATE DATABASE "CallOperator" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Malaysia.1252';
    DROP DATABASE "CallOperator";
                postgres    false         �            1259    16463    call_record    TABLE       CREATE TABLE public.call_record (
    calling_op_id integer,
    called_op_id integer,
    calling_cust_no character varying(15),
    called_cust_no character varying(15),
    time_id integer NOT NULL,
    cost numeric(10,2),
    call_duration numeric(6,2) NOT NULL
);
    DROP TABLE public.call_record;
       public         heap    postgres    false         �            1259    16462    call_reccord_time_id_seq    SEQUENCE     �   CREATE SEQUENCE public.call_reccord_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.call_reccord_time_id_seq;
       public          postgres    false    221                    0    0    call_reccord_time_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.call_reccord_time_id_seq OWNED BY public.call_record.time_id;
          public          postgres    false    220         �            1259    16404    called_cust    TABLE     �   CREATE TABLE public.called_cust (
    called_cust_no character varying(15) NOT NULL,
    name character varying(50),
    district character varying(15)
);
    DROP TABLE public.called_cust;
       public         heap    postgres    false         �            1259    16421 	   called_op    TABLE     o   CREATE TABLE public.called_op (
    called_op_id integer NOT NULL,
    called_op_name character varying(15)
);
    DROP TABLE public.called_op;
       public         heap    postgres    false         �            1259    16399    calling_cust    TABLE     �   CREATE TABLE public.calling_cust (
    calling_cust_no character varying(15) NOT NULL,
    name character varying(50),
    district character varying(15)
);
     DROP TABLE public.calling_cust;
       public         heap    postgres    false         �            1259    16416 
   calling_op    TABLE     r   CREATE TABLE public.calling_op (
    calling_op_id integer NOT NULL,
    calling_op_name character varying(15)
);
    DROP TABLE public.calling_op;
       public         heap    postgres    false         �            1259    16410    time    TABLE     `   CREATE TABLE public."time" (
    time_id integer NOT NULL,
    "time" time without time zone
);
    DROP TABLE public."time";
       public         heap    postgres    false         �            1259    16409    time_time_id_seq    SEQUENCE     �   CREATE SEQUENCE public.time_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.time_time_id_seq;
       public          postgres    false    217                     0    0    time_time_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.time_time_id_seq OWNED BY public."time".time_id;
          public          postgres    false    216         {           2604    16466    call_record time_id    DEFAULT     {   ALTER TABLE ONLY public.call_record ALTER COLUMN time_id SET DEFAULT nextval('public.call_reccord_time_id_seq'::regclass);
 B   ALTER TABLE public.call_record ALTER COLUMN time_id DROP DEFAULT;
       public          postgres    false    220    221    221         z           2604    16413    time time_id    DEFAULT     n   ALTER TABLE ONLY public."time" ALTER COLUMN time_id SET DEFAULT nextval('public.time_time_id_seq'::regclass);
 =   ALTER TABLE public."time" ALTER COLUMN time_id DROP DEFAULT;
       public          postgres    false    217    216    217                    2606    16408    called_cust called_cust_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.called_cust
    ADD CONSTRAINT called_cust_pkey PRIMARY KEY (called_cust_no);
 F   ALTER TABLE ONLY public.called_cust DROP CONSTRAINT called_cust_pkey;
       public            postgres    false    215         �           2606    16425    called_op called_op_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.called_op
    ADD CONSTRAINT called_op_pkey PRIMARY KEY (called_op_id);
 B   ALTER TABLE ONLY public.called_op DROP CONSTRAINT called_op_pkey;
       public            postgres    false    219         }           2606    16403    calling_cust calling_cost_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.calling_cust
    ADD CONSTRAINT calling_cost_pkey PRIMARY KEY (calling_cust_no);
 H   ALTER TABLE ONLY public.calling_cust DROP CONSTRAINT calling_cost_pkey;
       public            postgres    false    214         �           2606    16420    calling_op calling_op_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.calling_op
    ADD CONSTRAINT calling_op_pkey PRIMARY KEY (calling_op_id);
 D   ALTER TABLE ONLY public.calling_op DROP CONSTRAINT calling_op_pkey;
       public            postgres    false    218         �           2606    16415    time time_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_id);
 :   ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
       public            postgres    false    217         �           2606    16482 ,   call_record call_reccord_called_cust_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_called_cust_no_fkey FOREIGN KEY (called_cust_no) REFERENCES public.called_cust(called_cust_no);
 V   ALTER TABLE ONLY public.call_record DROP CONSTRAINT call_reccord_called_cust_no_fkey;
       public          postgres    false    3199    221    215         �           2606    16472 *   call_record call_reccord_called_op_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_called_op_id_fkey FOREIGN KEY (called_op_id) REFERENCES public.called_op(called_op_id);
 T   ALTER TABLE ONLY public.call_record DROP CONSTRAINT call_reccord_called_op_id_fkey;
       public          postgres    false    219    3205    221         �           2606    16477 -   call_record call_reccord_calling_cust_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_calling_cust_no_fkey FOREIGN KEY (calling_cust_no) REFERENCES public.calling_cust(calling_cust_no);
 W   ALTER TABLE ONLY public.call_record DROP CONSTRAINT call_reccord_calling_cust_no_fkey;
       public          postgres    false    3197    221    214         �           2606    16467 +   call_record call_reccord_calling_op_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_calling_op_id_fkey FOREIGN KEY (calling_op_id) REFERENCES public.calling_op(calling_op_id);
 U   ALTER TABLE ONLY public.call_record DROP CONSTRAINT call_reccord_calling_op_id_fkey;
       public          postgres    false    221    3203    218         �           2606    16487 %   call_record call_reccord_time_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_time_id_fkey FOREIGN KEY (time_id) REFERENCES public."time"(time_id);
 O   ALTER TABLE ONLY public.call_record DROP CONSTRAINT call_reccord_time_id_fkey;
       public          postgres    false    217    221    3201                                                                                                                                                                                                                                                                                                                                                                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000015004 14473113500 0015362 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
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

DROP DATABASE "CallOperator";
--
-- Name: CallOperator; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CallOperator" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Malaysia.1252';


ALTER DATABASE "CallOperator" OWNER TO postgres;

\connect "CallOperator"

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
-- Name: call_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call_record (
    calling_op_id integer,
    called_op_id integer,
    calling_cust_no character varying(15),
    called_cust_no character varying(15),
    time_id integer NOT NULL,
    cost numeric(10,2),
    call_duration numeric(6,2) NOT NULL
);


ALTER TABLE public.call_record OWNER TO postgres;

--
-- Name: call_reccord_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.call_reccord_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.call_reccord_time_id_seq OWNER TO postgres;

--
-- Name: call_reccord_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.call_reccord_time_id_seq OWNED BY public.call_record.time_id;


--
-- Name: called_cust; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.called_cust (
    called_cust_no character varying(15) NOT NULL,
    name character varying(50),
    district character varying(15)
);


ALTER TABLE public.called_cust OWNER TO postgres;

--
-- Name: called_op; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.called_op (
    called_op_id integer NOT NULL,
    called_op_name character varying(15)
);


ALTER TABLE public.called_op OWNER TO postgres;

--
-- Name: calling_cust; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calling_cust (
    calling_cust_no character varying(15) NOT NULL,
    name character varying(50),
    district character varying(15)
);


ALTER TABLE public.calling_cust OWNER TO postgres;

--
-- Name: calling_op; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calling_op (
    calling_op_id integer NOT NULL,
    calling_op_name character varying(15)
);


ALTER TABLE public.calling_op OWNER TO postgres;

--
-- Name: time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."time" (
    time_id integer NOT NULL,
    "time" time without time zone
);


ALTER TABLE public."time" OWNER TO postgres;

--
-- Name: time_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_time_id_seq OWNER TO postgres;

--
-- Name: time_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_time_id_seq OWNED BY public."time".time_id;


--
-- Name: call_record time_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record ALTER COLUMN time_id SET DEFAULT nextval('public.call_reccord_time_id_seq'::regclass);


--
-- Name: time time_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time" ALTER COLUMN time_id SET DEFAULT nextval('public.time_time_id_seq'::regclass);


--
-- Name: called_cust called_cust_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.called_cust
    ADD CONSTRAINT called_cust_pkey PRIMARY KEY (called_cust_no);


--
-- Name: called_op called_op_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.called_op
    ADD CONSTRAINT called_op_pkey PRIMARY KEY (called_op_id);


--
-- Name: calling_cust calling_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calling_cust
    ADD CONSTRAINT calling_cost_pkey PRIMARY KEY (calling_cust_no);


--
-- Name: calling_op calling_op_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calling_op
    ADD CONSTRAINT calling_op_pkey PRIMARY KEY (calling_op_id);


--
-- Name: time time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_id);


--
-- Name: call_record call_reccord_called_cust_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_called_cust_no_fkey FOREIGN KEY (called_cust_no) REFERENCES public.called_cust(called_cust_no);


--
-- Name: call_record call_reccord_called_op_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_called_op_id_fkey FOREIGN KEY (called_op_id) REFERENCES public.called_op(called_op_id);


--
-- Name: call_record call_reccord_calling_cust_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_calling_cust_no_fkey FOREIGN KEY (calling_cust_no) REFERENCES public.calling_cust(calling_cust_no);


--
-- Name: call_record call_reccord_calling_op_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_calling_op_id_fkey FOREIGN KEY (calling_op_id) REFERENCES public.calling_op(calling_op_id);


--
-- Name: call_record call_reccord_time_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_record
    ADD CONSTRAINT call_reccord_time_id_fkey FOREIGN KEY (time_id) REFERENCES public."time"(time_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            