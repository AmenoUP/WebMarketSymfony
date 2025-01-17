PGDMP  %         	            |           tweb    16.1    16.1     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    tweb    DATABASE     w   CREATE DATABASE tweb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE tweb;
                postgres    false            �            1259    16399    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap    postgres    false            �            1259    16408    order    TABLE     �   CREATE TABLE public."order" (
    id integer NOT NULL,
    totalprice double precision NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    16405    order_id_seq    SEQUENCE     u   CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public          postgres    false            �            1259    16413    order_product    TABLE     f   CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false            �            1259    16420    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    photo character varying(255) NOT NULL,
    price double precision NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16406    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false            �            1259    16427    user    TABLE       CREATE TABLE public."user" (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16407    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false                       0    16399    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public          postgres    false    215   %                  0    16408    order 
   TABLE DATA           @   COPY public."order" (id, totalprice, creation_date) FROM stdin;
    public          postgres    false    219   �                  0    16413    order_product 
   TABLE DATA           =   COPY public.order_product (order_id, product_id) FROM stdin;
    public          postgres    false    220   �                  0    16420    product 
   TABLE DATA           F   COPY public.product (id, name, description, photo, price) FROM stdin;
    public          postgres    false    221   �                  0    16427    user 
   TABLE DATA           Q   COPY public."user" (id, login, password, email, firstname, lastname) FROM stdin;
    public          postgres    false    222   F!                  0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 1, false);
          public          postgres    false    216                       0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 3, true);
          public          postgres    false    217                       0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public          postgres    false    218            d           2606    16404 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public            postgres    false    215            f           2606    16412    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            postgres    false    219            j           2606    16417     order_product order_product_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id);
 J   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_product_pkey;
       public            postgres    false    220    220            l           2606    16426    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            n           2606    16433    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    222            g           1259    16419    idx_2530ade64584665a    INDEX     T   CREATE INDEX idx_2530ade64584665a ON public.order_product USING btree (product_id);
 (   DROP INDEX public.idx_2530ade64584665a;
       public            postgres    false    220            h           1259    16418    idx_2530ade68d9f6d38    INDEX     R   CREATE INDEX idx_2530ade68d9f6d38 ON public.order_product USING btree (order_id);
 (   DROP INDEX public.idx_2530ade68d9f6d38;
       public            postgres    false    220            o           2606    16439 !   order_product fk_2530ade64584665a    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_2530ade64584665a FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.order_product DROP CONSTRAINT fk_2530ade64584665a;
       public          postgres    false    220    221    4716            p           2606    16434 !   order_product fk_2530ade68d9f6d38    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_2530ade68d9f6d38 FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.order_product DROP CONSTRAINT fk_2530ade68d9f6d38;
       public          postgres    false    4710    219    220                c   x���+�0 Q�=��)�X,����Ԕ�p� ��1o:����粷�*G=SZr;�bdE%Obf��ۣ��;�h>�80���&:~�`GM#�� i ��B$�            x������ � �            x������ � �         d   x�3�t�H�-�IU(�O)M.���,V ��<�T�T~�B�BD^!%�8�(��$3?O���('�$?� #�$_/� ���R�Ғ�dJU�2��=... V8�         �   x�5λn�0 ���~��V���!\���(�B]b�(`p�y�������~T�� ���6��@ds��	�iV=�?�*`drt@�%ke�tc�c�{��mV��hG�����':@6�x��("�S�{n�u�~ofq�h�ki!ga�֘���/~���'��d�R���{s��|��
����~<�"�=��<�y���V�kSJ�0�����\lr���P
��$-��uS�[6Du���A <]�     