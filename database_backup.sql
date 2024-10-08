PGDMP                      |            Spotify_top50    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16462    Spotify_top50    DATABASE     �   CREATE DATABASE "Spotify_top50" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Spotify_top50";
                postgres    false            �            1259    16474    key_popularity_rankings    TABLE     �   CREATE TABLE public.key_popularity_rankings (
    musical_key character varying(50),
    track_name character varying(255),
    popularity integer,
    rank integer
);
 +   DROP TABLE public.key_popularity_rankings;
       public         heap    postgres    false            �            1259    16464    spotifytop50    TABLE     l  CREATE TABLE public.spotifytop50 (
    id integer NOT NULL,
    artist_name character varying(255),
    track_name character varying(255),
    track_id character varying(50),
    popularity integer,
    danceability double precision,
    energy double precision,
    key integer,
    loudness double precision,
    mode integer,
    speechiness double precision,
    acousticness double precision,
    instrumentalness double precision,
    liveness double precision,
    valence double precision,
    tempo double precision,
    duration_ms integer,
    time_signature integer,
    musical_key character varying(50)
);
     DROP TABLE public.spotifytop50;
       public         heap    postgres    false            �            1259    16463    spotifytop50_id_seq    SEQUENCE     �   CREATE SEQUENCE public.spotifytop50_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.spotifytop50_id_seq;
       public          postgres    false    216            �           0    0    spotifytop50_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.spotifytop50_id_seq OWNED BY public.spotifytop50.id;
          public          postgres    false    215            T           2604    16467    spotifytop50 id    DEFAULT     r   ALTER TABLE ONLY public.spotifytop50 ALTER COLUMN id SET DEFAULT nextval('public.spotifytop50_id_seq'::regclass);
 >   ALTER TABLE public.spotifytop50 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16474    key_popularity_rankings 
   TABLE DATA           \   COPY public.key_popularity_rankings (musical_key, track_name, popularity, rank) FROM stdin;
    public          postgres    false    217   �       �          0    16464    spotifytop50 
   TABLE DATA           �   COPY public.spotifytop50 (id, artist_name, track_name, track_id, popularity, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms, time_signature, musical_key) FROM stdin;
    public          postgres    false    216   4       �           0    0    spotifytop50_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.spotifytop50_id_seq', 1, false);
          public          postgres    false    215            V           2606    16471    spotifytop50 spotifytop50_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.spotifytop50
    ADD CONSTRAINT spotifytop50_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.spotifytop50 DROP CONSTRAINT spotifytop50_pkey;
       public            postgres    false    216            �   *  x�UTM�"7=�_QR��hW8E��|�@3��ED�txld�q�O�1���c)�0�n�*��z� &�C��:�&d��w� &R1�5�$���T��F�X��5)K�۸���	X�gK�����<�-!�%|~夯��o0D���u����âؐ��#Y�m��sg����hx�R;Ĕ��$�N��T�D��&�ю����/r_�V���~��h��k�ٞvZ�<۠ɛ-�τ�-ْU�J��,���V��g���:3��1x�V:����t���2�o(u����<�V�s���%:-�pm~��/	,�/E��R+�dJ�Wp��*�jc��zQ�~U4&J�ixR����<	x���m�[f�TJZ��{34o�������>R�y���,�8 ���g0�{ל˼޷���w�ǴgV)��dJ!�t!�;�O$��E�[�Jk��c����F�x*M�W�ȧ���Q���=�^2�}����h���N��&:�$R<t9�+�O����7�=��4�R��z��i���m��3�zĆ��i/F�
�#s0b�[��P���}��uLމ>im`z �+�/�,4���_��<��4
���(:�jB\�X��m^���m\��XHG���6({ �>{� ��������E���Eq�D� �������0!�hS�d�GP����x�R?o�v���S�����uI��tE����������o������?)�}Ǟ�*L�qқM��#�v���1�x@�d?�0��>ks����V���G      �     x�eY�n�Js]�}
�������*�$k�5�edCI�D�"m���ˣd�Ed�g�^,�Ք�{��5w�ԩS�ʔ�����([��&#p=G��I�e�#�]�ޠ+����e�\���C����OR�
N	uɃ�hx /����GIMhE�����)u��rE���<�s)'���t�]���H'N�^xt^I�ߛ<��Ο�0I�n�To�<;���!�E���ټޜ>�޺���Ō�������r�Ƀ�(������{&jJA�JW���+�
��	��)D��d9�����~��'����[��t,�ԩ��"�o�[���s�m�x�z����$�"�y�*B��&H�ku�S�Q�W|Հ� �;<����d��Ή����#*��f���{�ݲI|�d~YB �	�6 �	�rn�q��ͧ�9_���Lz��=R?�N'~I':�El�?�QXT�zX7�"=��ösK���ͺ�N���וk ѐI8�����ED\]b�Jeb��b_)�\�J���=;��%	d��mt��'��ĩ��1̝v�@�,�ED�t˪�N����e��a��F�Ap����7��3�&xΨ%��a�4�#�׮f&K%J�Գ]�9>s�Y������y�h�vg�{I<��>�O�u��g���$n�´y�y>ѐ�{Q�`���20i)UIbG#�gQ�OW�����$�o�ő�/��n&���-��W��ڍ�������yI[�ט+*$�+�(q���N�1E�}(o�u����>i&!@��!L���8��A$�;���sM��`:WKou�c@��6����6_�7�QH|��GA�4��ZC(�T�@����3���8%�h���>�w���';�ڛ��ċ,
a�x��@�-C=W ����3���yF��t��HW�~7<3˒5	�E���pکc2�_FaJ��n>��l��^��W��-ky�PU�onPв�\��8��O��2�@>@F�ʔ3�M$��H��+�zJ��������MD���2�no���$��e����`��*#�9P�`3 �끸�)i��v��1@��K��η{��x2�;ՠ:�W�S��;�0O�Hʛ���v~��qX�qo=�m�*AۂT���]BVMY��P� $�z���ʸwo?6.q匷Q�C.H�pC�����'v���o�Ǐ��୬�jW�s���(#�B��%���.%2� ��ø�Pg������1ԇm|�(̏������K/_��~4G�)L���~�V�l�p�G, ���%�	��PɄH��L��2*Iu2&�SQ�²�f2��v]�o�њ��E�(�oX¨�9�ޏ����Ji��P���B�fQE��)��)�p'2D�Y�;��(%�ċ�$�E;>֊E�9ov�D#�x��g��R�8Ò���0�6h;p���Ə���6�q���"�����Tm�ѼF�h��4
r��B�̜��v�.�n T���+��rA]�iw������!�d�.N����*��$[eN ��7���깳~��t���g�}���V�w�)%�w��s��>S��&V8�� �t��ߋ�� о�%��t��(K5��Y�� ��x⎦�d��'�k�:c�{�G�@V�ʺ�(��4|l���0�&b���qS��{�L���},2,������\�qR��E�����ۍ�^�R�g�]i�WY�b;9�; ��r� 8�ب!'���B:MM�oix����c�O�����h�^�L�%��.!���Q޳�����,��1�	TX�����?��ϷjϡulNiL�Ӡ���S�2���Ǭ`��tlۦ��	�.c�,�ȡy�=�D��j4 �I�ҵ!%�����Z�,18DI�:��&̉�FI磙̺˗}�����yiű�5EI(���Jk_,�B+��@RA�!���A��E��F��۝{��:<���Z�������wHL9���qD,��5��[�9�E+��k�Xfh䛖X�`�X����dY&H�]�Rt�;ȽZ�k�a;��6>�"J�����?!�E�����ٹۙ���w���Vm{��-s4$�^�{�~q�dO��ÚWP6���G� =��2kOZ��ę����~�?�r�l�[�'�s�mp�����B�R��o
�����|
x�s�wDE{?���u�����"��=x��0���d���[��]z�X>�ޭj�?�f��Rm��;:�]7-�����\8E�߱���"�A9�jo�mV��8���D�ZgX��Y�k$#���h�;�9�.M��i�%�« R���f�^3�%���>���=<V��y�E�I�Z����b{�
�W��F߻�X4׫�<�.����	�
�ʊ�=�� a�&8�UD޳c\�Y
V�;��ޘ������I#rK��~��L�*U������.W蹴� WfJS �?� �҉.�Ơ�0Y�d��hd�Nv�VD}<��ў�|�l�&����Y�@<lfD��C�R58Nb�+�Z�h%��+���m�2� 	ABa�Ye�^�is㏯M���y��>Dc"��J��u��報Z����5DAjc���1�r�ed�d����3z���>��9�N��H�{��/����>����_=��|`u����� Wh,A'Jˏ��=m�~���8GK���GY�9M2
�I0�ί����4��ɒ���l��%iGka��}�e��h�L#���,{�=T��Y����k�G�����������^_x-g��٫.�V�g]�6E!�q7!`Ÿ( ���rQ��
2�\��~��"�"��ҽ���x��>?�/��]��i�"��5�a9�k�{V� �u�X����I_��&��w/�y{~Ɖ�/�i�`��bk|�p�o�&C�����r��߯[iI�ژ��7�k���2�G��H�j�iL�Td&p����ɎN'�D�*���Hq�Uݻ���==&��i�xo|���v5d�u1�}m�5j���*��v����/#��D�"���yN��/���1��M^w���\���-q"�6 ��P8uqW��<.���&
3˸v �ޞ���U=K�Q���6��L�u;�g�Կ|��gỤ���F����������l<�E�Ų8Tg�� ��B�Өp���P����k;ԄR	�¤ X���mz��/���֬V��k�S�<�7��
�7�A�-BT����y�
AQOM����������wzf��,#�;�,�j�������xދr�F��L��W�V�Ҏ}�(�Xц�.�����I�q?��)]���	Oy�.#�`K@��'*j�zp�Ni�4��/��ے�:A���R��r1!����I\�R��`Q�T��3�Mn��6����4�M=�A��?=톃`Q��C���ϊ��~Pb���eMxH
�--݊D0�����!�3���ї�ɩ�����������8:�St�W"�lR;�t���`�j>�&ط��6+�Y9w�.0U�y�~뷙��ZՅɇA���ϖ�<efq���7Fne��s_��������Օ��`�ZnO�`9�~�'�44h5�t���e�&��Я͡��F<k�!��.���Q�.��.��O~��|��U�IúZL��=��5�r!a�(��p:�\F�A<�?�h����.GaDn`_y��9�8?�x�-E���������맑m��@n7g>��R��_�����K:bt�
,��vcfW�.G��X �</Kan�u�U��3���"���i����q}���-�[A�̖�lg�R#p<��.`vV��]k�|�ECs_��[�?��?"S!N     