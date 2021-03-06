DROP DATABASE IF EXISTS maryland;
DROP ROLE IF EXISTS maryland_db_user;






CREATE DATABASE maryland;

\c maryland

CREATE ROLE maryland_db_user LOGIN SUPERUSER  PASSWORD '1234';

SET client_encoding TO 'UTF-8';

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE admins(
    "id" uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    "username" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "email"  CHARACTER VARYING(50) UNIQUE NOT NULL,
    "password" CHARACTER VARYING(100) NOT NULL,
    "role"  CHARACTER VARYING(100) NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO admins (username,email,password,role) 
VALUES('admin1','akmyradowakmuhammet21@gmail.com','$2y$10$6QZ6DPn791vv1mlTnbm/Gu1IHvt9kZe/4bSgnCa72y5UMgdsBW6Q6','superadmin');



CREATE TABLE languages(
    "id" SERIAL,
    "name" CHARACTER VARYING(50) UNIQUE NOT NULL,
    "short_name" CHARACTER VARYING(10) PRIMARY KEY NOT NULL,
    "image_path" CHARACTER VARYING(255)  NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




CREATE TABLE product_categories(
    "id" SERIAL PRIMARY KEY ,
    "name" CHARACTER VARYING(250) UNIQUE NOT NULL,
    "image_path" CHARACTER VARYING(255)  NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Insert into product_categories(name, image_path) VALUES ('Kukurt','1634903349-partner-surat.png');

CREATE TABLE product_categorie_translates(
    "id" SERIAL PRIMARY KEY,
    "lang_name" character varying(5) NOT NULL,
    "category_id"  INT NOT NULL,
    "name" CHARACTER VARYING(250) UNIQUE NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT product_categorie_translates_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT product_categorie_translates_category_id_fk
        FOREIGN KEY ("category_id")
            REFERENCES product_categories("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_product_categorie_translates_lang_name
ON product_categorie_translates(lang_name);


INSERT INTO product_categorie_translates(lang_name,category_id,name) VALUES('tr', 1, 'Kukurt');



CREATE TABLE products(
    "id" SERIAL PRIMARY KEY,
    "title" CHARACTER VARYING(250) NOT NULL,
    "text" TEXT NOT NULL,
    "image_path" CHARACTER VARYING(255)  NOT NULL,
    "category_id"  INT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT products_category_id_fk
        FOREIGN KEY ("category_id")
            REFERENCES product_categories("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

Insert INTO products(title, text, image_path, category_id) VALUES ('GRAN??LAR K??K??RT', 
'<p>K??k??rt, kimyasal sembol?? S olan toprakta bol miktarda bulunan elementlerden biridir. Parlak sar?? rengi ile bilinir. End??stride, s??lf??rik asit ??retimi, tar??m, t??p, g??da, ka????t ve kau??uk end??strisinde yayg??n olarak kullan??lmaktad??r. Daha ??nce, d??nya y??zeyindeki volkanik b??lgelerden veya s??cak hava buhar?? kullan??larak yap??lan bir delme i??leminden elde ediliyordu. Ancak son zamanlarda petrol rafinerisi s??recinden geri kazan??lmaktad??r. Rafineriler, teknolojinin yard??m??yla atmosferi ??ok kirleten ve asit ya??murlar??na neden olan K??k??rt Dioksit emisyonunu neredeyse s??f??ra indiriyor.</p><p>MARYLAND DI?? TICARET LIMITED ??IRKETI, d??nyan??n en ??retken K??k??rt t??ccarlar??ndan biridir. M????teri odakl?? yakla????m??m??z, ??e??itli m????teri gereksinimlerine ??zel ????z??mler tasarlamam??za yard??mc?? olur. Y??llar boyunca, co??rafyalar ve k??talar genelinde k??k??rt tedarik etme ve satma konusunda kapsaml?? bilgi ve deneyim edindik. Biz esas olarak ??ekillendirilmi?? K??k??rt (Gran??ler/ Prilled/ Peletler), Ezilmi?? Par??alar ve Toz K??k??rt ticareti yap??yoruz. Lojistik ??zerindeki keskin kontrolle desteklenen kaynak bulma konusundaki zengin deneyimimiz, sorunsuz teslimatlar d??zenlememize yard??mc?? oluyor.</p>',
,'1634903349-partner-surat.png',1);

CREATE TABLE product_translates(
    "id" SERIAL PRIMARY KEY,
    "lang_name" character varying(5) NOT NULL,
    "product_id"  INT NOT NULL,
    "title" CHARACTER VARYING(250) NOT NULL,
    "text" TEXT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT product_translates_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT product_translates_product_id_fk
        FOREIGN KEY ("product_id")
            REFERENCES products("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_product_translates_lang_name
ON product_translates(lang_name);
Insert INTO product_translates(lang_name, product_id ,title, text) VALUES ('tr',1,'GRAN??LAR K??K??RT', 
'<p>K??k??rt, kimyasal sembol?? S olan toprakta bol miktarda bulunan elementlerden biridir. Parlak sar?? rengi ile bilinir. End??stride, s??lf??rik asit ??retimi, tar??m, t??p, g??da, ka????t ve kau??uk end??strisinde yayg??n olarak kullan??lmaktad??r. Daha ??nce, d??nya y??zeyindeki volkanik b??lgelerden veya s??cak hava buhar?? kullan??larak yap??lan bir delme i??leminden elde ediliyordu. Ancak son zamanlarda petrol rafinerisi s??recinden geri kazan??lmaktad??r. Rafineriler, teknolojinin yard??m??yla atmosferi ??ok kirleten ve asit ya??murlar??na neden olan K??k??rt Dioksit emisyonunu neredeyse s??f??ra indiriyor.</p><p>MARYLAND DI?? TICARET LIMITED ??IRKETI, d??nyan??n en ??retken K??k??rt t??ccarlar??ndan biridir. M????teri odakl?? yakla????m??m??z, ??e??itli m????teri gereksinimlerine ??zel ????z??mler tasarlamam??za yard??mc?? olur. Y??llar boyunca, co??rafyalar ve k??talar genelinde k??k??rt tedarik etme ve satma konusunda kapsaml?? bilgi ve deneyim edindik. Biz esas olarak ??ekillendirilmi?? K??k??rt (Gran??ler/ Prilled/ Peletler), Ezilmi?? Par??alar ve Toz K??k??rt ticareti yap??yoruz. Lojistik ??zerindeki keskin kontrolle desteklenen kaynak bulma konusundaki zengin deneyimimiz, sorunsuz teslimatlar d??zenlememize yard??mc?? oluyor.</p>'
);



CREATE TABLE "address"(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "lang_name" character varying(5) NOT NULL,
  "address" CHARACTER VARYING(255) NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp,
   CONSTRAINT addresses_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_address_lang_name
ON address(lang_name);


CREATE TABLE "products_header"(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "lang_name" character varying(5) NOT NULL,
  "title" CHARACTER VARYING(255) NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp,
   CONSTRAINT products_header_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_products_header_lang_name
ON products_header(lang_name);


CREATE TABLE services(
  "id" serial PRIMARY Key NOT NULL,
  "title" CHARACTER VARYING(250) NOT NULL,
  "text" TEXT NOT NULL,
  "image_path" CHARACTER VARYING(255)  NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp
);

INsert into services(title,text,image_path) VALUES('Depa ve depolama hizmetleri','<p>Maryland, kargo ve mallar?? depolamak i??in tam donan??ml?? depo tesislerinin k??sa vadeli ve uzun vadeli kiralamas??n?? sunar. Depolar??m??zda ??r??nler, g??n boyu g??zetim alt??nda, uygun s??hhi ko??ullarda muhafaza edilmektedir. Maryland'in depo tesisleri, hem i?? hem de d???? mekanlarda mallar??n depolanmas??na ve yerle??tirilmesine izin verir. ??irketimiz, hem T??rkmenistan topraklar??nda hem de T??rkiye'nin Mersin ??ehrinde bulunan depolarda her hacimde kargonun yerle??tirilmesinde yard??mc?? olmaktad??r. Depolama ve organizasyon, mal ve kargo g??nderilerinin kabul ve sevk??yat?? s??recinin uygulanmas?? i??in eksiksiz bir hizmet yelpazesi sunuyoruz.</p>',
'1635175936-service-image.jpg');

CREATE TABLE service_translates(
    "id" SERIAL PRIMARY KEY,
    "lang_name" character varying(5) NOT NULL,
    "service_id" INT NOT NULL,
    "title" CHARACTER VARYING(250) NOT NULL,
    "text" TEXT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT service_translates_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE,
     CONSTRAINT service_translates_service_id_fk
        FOREIGN KEY ("service_id")
            REFERENCES services("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_service_translates_lang_name
ON service_translates(lang_name);

CREATE TABLE menu(
    "id" SERIAL PRIMARY KEY ,
    "lang_name" character varying(5) NOT NULL,
    "menu1" CHARACTER VARYING(50)  NOT NULL,
    "menu2" CHARACTER VARYING(50)  NOT NULL,
    "menu3" CHARACTER VARYING(50)  NOT NULL,
    "menu4" CHARACTER VARYING(50)  NOT NULL,
    "menu5" CHARACTER VARYING(50)  NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT menu_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_menu_lang_name
ON menu(lang_name);


CREATE TABLE home_sliders(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "title" CHARACTER VARYING(255),
  "text" TEXT,
  "image_path" CHARACTER VARYING(255) NOT NULL,
  "created_at" timestamp DEFAULT current_timestamp
);



CREATE TABLE home_slider_translates(
    "id" SERIAL PRIMARY KEY,
    "lang_name" character varying(5) NOT NULL,
    "slider_id"  INT NOT NULL,
    "title" CHARACTER VARYING(250) NOT NULL,
    "text" TEXT,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT home_slider_translates_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT home_slider_translates_slider_id_fk
        FOREIGN KEY ("slider_id")
            REFERENCES home_sliders("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_home_slider_translates_lang_name
ON home_slider_translates(lang_name);



CREATE TABLE footer_titles(
    "id" SERIAL PRIMARY KEY ,
    "lang_name" character varying(5) NOT NULL,
    "title1" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "title2" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "title3" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "title4" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "title5" CHARACTER VARYING(100) UNIQUE NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT footer_titles_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);
Insert INTO footer_titles(lang_name,title1,title2,title3,title4,title5) VALUES('ru','?????? ??????????','?????????????????? ?? ????????','?????????????? ????????????','Copyright @ 2021. All rights reserved.','Design And Developed by');

CREATE INDEX idx_footer_titles_lang_name
ON footer_titles(lang_name);



CREATE TABLE reports(
    "id" SERIAL PRIMARY KEY ,
    "lang_name" character varying(5) NOT NULL,
    "report1" CHARACTER VARYING(200) UNIQUE NOT NULL,
    "report2" CHARACTER VARYING(200) UNIQUE NOT NULL,
    "report3" CHARACTER VARYING(200) UNIQUE NOT NULL,
    "report4" CHARACTER VARYING(200) UNIQUE NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT reports_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_reports_lang_name
ON reports(lang_name);




CREATE TABLE home_body(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "lang_name" character varying(5) NOT NULL,
  "title1" CHARACTER VARYING(200)  NOT NULL,
  "text1" TEXT  NOT NULL,
  "statistica_title" CHARACTER VARYING(200)  NOT NULL,
  "title2" CHARACTER VARYING(200)  NOT NULL,
  "text2" TEXT  NOT NULL,
  "created_at" timestamp DEFAULT current_timestamp,
  CONSTRAINT home_body_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_home_body_lang_name
ON home_body(lang_name);



CREATE TABLE about_body(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "lang_name" character varying(5) NOT NULL,
  "title1" CHARACTER VARYING(255),
  "text1" TEXT,
  "title2" CHARACTER VARYING(255),
  "text2" TEXT,
  "button_text" TEXT,
  "created_at" timestamp DEFAULT current_timestamp,
  CONSTRAINT about_body_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_about_body_lang_name
ON about_body(lang_name);


CREATE TABLE contact_body(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "lang_name" character varying(5) NOT NULL,
  "title1" CHARACTER VARYING(255)  NOT NULL,
  "text1" TEXT  NOT NULL,
  "title2" CHARACTER VARYING(255)  NOT NULL,
  "contact_name" CHARACTER VARYING(255)  NOT NULL,
  "contact_email" CHARACTER VARYING(255)  NOT NULL,
  "contact_subject" CHARACTER VARYING(255)  NOT NULL,
  "contact_message" TEXT  NOT NULL,
  "contact_button" CHARACTER VARYING(255)  NOT NULL,
  "created_at" timestamp DEFAULT current_timestamp,
  CONSTRAINT contact_body_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_contact_body_lang_name
ON contact_body(lang_name);


CREATE TABLE settings(
  "id" SERIAL PRIMARY KEY NOT NULL,
  "logo" CHARACTER VARYING(255)  NOT NULL,
  "logo_black" CHARACTER VARYING(255)  NOT NULL,
  "favicon" CHARACTER VARYING(255)  NOT NULL,
  "email" CHARACTER VARYING(255)  NOT NULL,
  "whatsapp" CHARACTER VARYING(255)  NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp
); 
Insert into settings(logo,logo_black,favicon,email,whatsapp)VALUES('logo.svg','logo-black.svg','1631108314-favicon.png','info@maryland-ltd.com','+905417972917');

CREATE TABLE phones(
  "id" serial PRIMARY Key NOT NULL,
  "phone_number" CHARACTER VARYING(255) UNIQUE NOT NULL,
  "created_at" timestamp DEFAULT current_timestamp
);


CREATE TABLE images(
  "id" serial PRIMARY Key NOT NULL,
  "image_path" CHARACTER VARYING(255) NOT NULL,
  "role" CHARACTER VARYING(255) NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp
);

CREATE INDEX idx_images_role
ON images(role);

CREATE TABLE statistica(
  "id" serial PRIMARY Key NOT NULL,
  "title" CHARACTER VARYING(250) NOT NULL,
  "amount" INT NOT NULL,
  "image_path" CHARACTER VARYING(255)  NOT NULL,
  "created_at" TIMESTAMP DEFAULT current_timestamp
);



CREATE TABLE statistica_translates(
    "id" SERIAL PRIMARY KEY,
    "lang_name" character varying(5) NOT NULL,
    "statistica_id" INT NOT NULL,
    "title" CHARACTER VARYING(250) NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT statistica_translates_lang_name_fk
        FOREIGN KEY ("lang_name")
            REFERENCES languages("short_name")
                ON UPDATE CASCADE ON DELETE CASCADE,
     CONSTRAINT statistica_translates_statistica_id_fk
        FOREIGN KEY ("statistica_id")
            REFERENCES statistica("id")
                ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_statistica_translates_lang_name
ON statistica_translates(lang_name);






Insert Into images (image_path, role) VALUES ('1634903349-partner-surat.png', 'home_about_image');




INSERT INTO menu(lang_id,menu1,menu2,menu3,menu4,menu5) VALUES(1,'Anasayfa','Hakkimizda','Ileti??im','??r??nler','Hizmetler'),
(2,'??????????????','O ??????','??????????????','????????????????','????????????'),
(3,'Home','About us','Contact','Products','Services');


INSERT INTO about_body(lang_id,title1,text1,title2,text2,button_text) 
VALUES(3,'MARYLAND DI?? TICARET LIMITED ??IRKETI','MARYLAND DI?? TIC LTD ??TI g??bre pazarlama sekt??r??nde, ve y??k ta????mac??l?????? sekt??r??nde faaliyet g??stermek ??zere tecr??beli kadrosuyla 2020 y??l??nda kurulmu??tur. 
MARYLAND ??n ba??l??ca g??c??, g??bre ticaretinde kritik ??neme sahip karma????k tedarik zincirlerini kurmak ve y??netmektir. Dinamik ve deneyimli profesyonellerden olu??an ??zel bir ekip taraf??ndan y??netilen MARYLAND, kendi ofisleri, temsilcileri ve acenteleri arac??l??????yla 10-dan fazla ??lkede faaliyet g??stermektedir.
Maryland, d??nya ??ap??ndaki geni?? m????teri yelpazesinin ??e??itli lojistik gereksinimlerini kar????lamak i??in konteyner gemileri, nehir tipi gemiler ve supramax d??kme y??k gemileri aras??nda de??i??en gemiler kiralar ve kullan??r.
Firmam??z??n Temel ??lkeleri:
- M????teri memnuniyetini ??st seviyete tutmak ve
-Yeni ??r??nler sunmak,
- Yapt??????m??z i??lerde daima en iyisini hedeflemek,
- Sekt??rdeki yenilikleri takip edip sekt??rde ??nc?? olmak,
- Ekip ??al????mas??na ve Ar-Ge ye ??nem verip, de??i??mekte olan ko??ullara uyum sa??lamak,
- Kom??u ??lkeler ile ticaretimizi geli??tirerek b??lgenin en bilinen, sayg??n ve g??venilir markas?? olmakt??r.','G??venilir ortaklik','??al????anlar??m??z??n profesyonelli??ine b??y??k ??nem veriyor, bu nedenle e??itimlerine yat??r??m yap??yoruz. Uzmanlar??m??z sizin i??in gerekli t??m belgeleri haz??rlayacak, kargonuzun var???? noktas??na zaman??nda teslim edilmesini sa??layacakt??r. B??y??k ??irketler ve k??????k ??irketler lojistik konusunda bize g??veniyor. Her lojistik projesi, ????z??lmesi gereken ??zellikler ve g??revler dikkate al??narak ayr?? ayr?? olu??turulur. Maryland, petrol ??r??nleri, k??k??rt, g??breler, ??e??itli polimerler, karbamid ve potasyum tedarik??isidir.','Contact us_tm');
(2,'??????????????','O ??????','??????????????','????????????????','????????????'),
(3,'Home','About us','Contact','Products','Services');




-- CREATE OR REPLACE FUNCTION get_old_image()
--   RETURNS TRIGGER 
--   LANGUAGE PLPGSQL
--   AS
-- $$
-- BEGIN
--     SELECT image_path as old_image_path FROM images where role='partner' and id= ;

-- 	RETURN old_image_path;
-- END;
-- $$



-- CREATE TRIGGER  old_image_path
--   BEFORE UPDATE
--   ON (SELECT * FROM images)
--   FOR EACH ROW
--   EXECUTE PROCEDURE log_last_name_changes();


------------------------------------
------------------------------------
------------------------------------

"INSERT INTO home_slider_translates(lang_name,slider_id,title,text)VALUES('ru',1,'Sulphur','<p>Sulphur, which is an industrial raw material with a trade volume of 55 million tons in the world, is mainly used in the production of sulfuric acid, fertilizer, detergent (LABSA), and in sectors such as paper, food industry, agriculture, auto tires, explosives, chemistry and paint, waste water treatment. finds wide use.</p><p>&nbsp;</p>');"

INSERT INTO home_sliders(title,text,image_path) VALUES('K??k??rt','D??nyada 55 milyon ton ticaret hacmine sahip bir end??striyel hammadde olan k??k??rt, ba??lica s??lf??rik asit, g??bre, deterjan (LABSA) ??retiminde kullanilmak, ??zere ka??it, gida sanayii, tarim, oto lastikleri, patlayici, kimya ve boya, atik su aritimi gibi sekt??rlerde de kendine geni?? kullanim alani bulmaktadir.','first');


 select home_slider_translates.*,home_slider_images.image_path from home_slider_translates Left Join home_slider_images
 on home_slider_images.slider_id = home_slider_translates.slider_id where lang_name='en';

 Insert into home_body(lang_name,title1,text1,title2,text2) VALUES('en','Hizmetlerimiz','<p>Hizmetlerimiz ve hizmetimiz bir ????z??md??r<br>m????terinin sorunlar?? ortaya ????kmadan ??nce</p>','??r??nler','<p>T??m en yenilik??i hizmetler ve teklifler</p>');



CREATE TABLE send_messages (
    "id" SERIAL PRIMARY KEY,
    "name" CHARACTER VARYING(25) NOT NULL,
    "email" CHARACTER VARYING(200) NOT NULL,
    "title" CHARACTER VARYING(200) NOT NULL,
    "message" TEXT NOT NULL,
    "created_at" TIMESTAMP DEFAULT current_timestamp 
);


------------------------------------
------------------------------------
------------------------------------
,c.name as category_name
inner join product_categories c on c.id=a.category_id