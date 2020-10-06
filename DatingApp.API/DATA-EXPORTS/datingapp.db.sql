BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
	"MigrationId"	TEXT NOT NULL,
	"ProductVersion"	TEXT NOT NULL,
	CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY("MigrationId")
);
CREATE TABLE IF NOT EXISTS "Values" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	CONSTRAINT "PK_Values" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users" (
	"Id"	INTEGER NOT NULL,
	"Username"	TEXT,
	"PasswordHash"	BLOB,
	"PasswordSalt"	BLOB,
	"City"	TEXT,
	"Country"	TEXT,
	"Created"	TEXT NOT NULL DEFAULT '0001-01-01 00:00:00',
	"DateOfBirth"	TEXT NOT NULL DEFAULT '0001-01-01 00:00:00',
	"Gender"	TEXT,
	"Interests"	TEXT,
	"Introduction"	TEXT,
	"KnownAs"	TEXT,
	"LastActive"	TEXT NOT NULL DEFAULT '0001-01-01 00:00:00',
	"LookingFor"	TEXT,
	CONSTRAINT "PK_Users" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Photos" (
	"Id"	INTEGER NOT NULL,
	"Url"	TEXT,
	"Description"	TEXT,
	"DateAdded"	TEXT NOT NULL,
	"isMain"	INTEGER NOT NULL,
	"UserId"	INTEGER NOT NULL,
	"PublicId"	TEXT,
	CONSTRAINT "FK_Photos_Users_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Photos" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Likes" (
	"LikerId"	INTEGER NOT NULL,
	"LikeeId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Likes_Users_LikeeId" FOREIGN KEY("LikeeId") REFERENCES "Users"("Id") ON DELETE RESTRICT,
	CONSTRAINT "FK_Likes_Users_LikerId" FOREIGN KEY("LikerId") REFERENCES "Users"("Id") ON DELETE RESTRICT,
	CONSTRAINT "PK_Likes" PRIMARY KEY("LikerId","LikeeId")
);
CREATE TABLE IF NOT EXISTS "Messages" (
	"Id"	INTEGER NOT NULL,
	"SenderId"	INTEGER NOT NULL,
	"ReciepientId"	INTEGER NOT NULL,
	"RecipientId"	INTEGER,
	"ContenT"	TEXT,
	"IsRead"	INTEGER NOT NULL,
	"DateRead"	TEXT,
	"MessageSent"	TEXT NOT NULL,
	"SenderDeleted"	INTEGER NOT NULL,
	"RecipientDeleted"	INTEGER NOT NULL,
	CONSTRAINT "FK_Messages_Users_RecipientId" FOREIGN KEY("RecipientId") REFERENCES "Users"("Id") ON DELETE RESTRICT,
	CONSTRAINT "FK_Messages_Users_SenderId" FOREIGN KEY("SenderId") REFERENCES "Users"("Id") ON DELETE RESTRICT,
	CONSTRAINT "PK_Messages" PRIMARY KEY("Id" AUTOINCREMENT)
);
INSERT INTO "__EFMigrationsHistory" ("MigrationId","ProductVersion") VALUES ('20200917052514_InitialCreate','3.0.0'),
 ('20200918011248_AddedUserEntity','3.0.0'),
 ('20200921074209_ExtendedUserClass','3.0.0'),
 ('20200923051730_AddedPublicId','3.0.0'),
 ('20200927113538_AddedLikeEntity','3.0.0'),
 ('20200927183822_MessageEntityAdded','3.0.0');
INSERT INTO "Users" ("Id","Username","PasswordHash","PasswordSalt","City","Country","Created","DateOfBirth","Gender","Interests","Introduction","KnownAs","LastActive","LookingFor") VALUES (1,'freda',X'ace696494991c300d721ce5f6a006e5be3f9f3e42436a0c171680feb3a05df42b98d2d3694fb21842ee2b9c703b89feadd998b1bf78d3c295a6bce248f59dd9c',X'60b5ca9dc477ac29af9c752f83a48bd6ab922cefdd66bf548736631b0585ebf510cdc5dfc50d0237f65fb5b2d9a4ff6bb43f6f92f8cdf8fe86e13564e5b9377f5057c1f4a492525a20b08574ed3c849e11399cfa717f3b82f15ae7ae2154c67504104ba74496f94f2476ea7800de644cc1268e844907655bd72401befba40595','Hamilton','Finland','2017-02-13 00:00:00','1980-03-12 00:00:00','female','Ullamco nulla laboris pariatur aute culpa laboris consequat adipisicing dolore.','Veniam ex id elit et id. Ullamco proident laborum irure fugiat laborum enim exercitation reprehenderit proident tempor dolor. Sit do consectetur amet tempor eu exercitation labore in reprehenderit laborum. Tempor velit laborum qui deserunt dolore proident amet laboris pariatur aliqua. Excepteur mollit elit esse ut laborum ad ut nisi anim. Reprehenderit amet id tempor adipisicing occaecat Lorem pariatur nisi non consequat id duis nisi. Pariatur non dolor magna cupidatat duis elit quis.
','Freda','2020-09-29 19:09:43.8313107','Eiusmod consequat nulla nulla cupidatat adipisicing commodo ullamco reprehenderit fugiat ad labore. Nulla commodo minim sint non consectetur deserunt do veniam aliqua amet consectetur et reprehenderit. Dolor dolor eu reprehenderit ex laborum magna adipisicing ad nisi laborum velit.
'),
 (2,'aida','�U��5zZ�������	Ң�M�����^W0��Ɩy��%���m�yR�#�Mmħ��Y���,�[',X'0dfe280b35a3d22d02630e878a0425296f81b301fcf16936d18e0ef5f0a9a318739e58598a229237148ef57600c30297b0688c8b195bc117e83cdd0012852cd00b8fe31544099c229b5d0ca0b493d12d245804591e2e27f9e61caf332e64ed1b7edd6d858f9ed6ba8d97b8cd211e6f271326a5c2d1f82a4d66dd6d4a1a008392','Ypsilanti','Latvia','2017-06-19 00:00:00','1989-10-18 00:00:00','female','Sunt voluptate deserunt duis nostrud aute do voluptate culpa magna anim sit.','Ea eu enim mollit deserunt mollit velit Lorem. Qui ea reprehenderit consequat nulla. Velit elit proident reprehenderit officia ut eu. Ullamco consequat amet ipsum proident voluptate. Magna irure aliqua nulla cupidatat laborum aute tempor consequat. Minim amet in dolor enim velit qui. Ut ad est fugiat nostrud qui cupidatat.
','Aida','2020-09-28 06:31:15.4677841','Est ad do cillum anim exercitation pariatur ea pariatur aliqua duis consectetur ut ullamco veniam. Eu ea et ipsum amet pariatur dolor nostrud sunt tempor ipsum veniam fugiat proident. In aliquip laboris fugiat anim duis. Proident exercitation exercitation cillum aliquip aliquip ullamco nostrud magna enim. Ea Lorem aute et consequat nulla ullamco aliqua proident magna aliquip nulla. Voluptate officia ex sit tempor eiusmod qui nulla eiusmod sit. Consectetur duis pariatur dolore anim ut ad cupidatat proident incididunt excepteur ad.
'),
 (3,'susie','�G2�m�" ���Ba��A.�ޘ��ܯ��w3A����"�˅3E �\-S,h����:3V�S@ ��',X'797ae7cd36af3a3914ffd5d2e8067da6e958f6e12b62da9e29c8b08d6546b35daf5663b6d79b5873222043ad39b338f2777a857d0a80455d45d03b5c89e4f5e24c3638d35ed77f094c998bec1119eab2ac8092f0274434de704e789e188df1a45f03da7b58210c6a9d91d74b9877b360dfafc3b3fc949a818e6c34de0039ea82','Lake Zurich','United states of mexico','2017-12-03 00:00:00','1972-05-21 00:00:00','female','Updated interests 3','Updated Introduction 1','Susie','2020-10-01 20:57:18.5778028','Updated Looking for 2'),
 (4,'nichole','��$�=Ғ�''v�A@[^���M�-i����l�Y$ʞi�^������=�xj�OMv:�i��_#',X'224d61cafbbb050c55722e01a85d48483cd3ad9015eb9adc24b01ae4119cc40d35ffda529c5600cfe5f68ffe1dcf9ddb9a4d7f334afe247f40df2f910ec65c4cffc57153dcbd96f5bbf63721c54b1728fec0c9722d237a064e815fe381403d6a884cf20bbae144fc2b29cb75372bc72483476577aa48603052cdf467cd3196b2','Idamay','Jamaica','2017-08-30 00:00:00','1968-03-10 00:00:00','female','Culpa consequat in id fugiat do quis magna culpa minim.','Ipsum consectetur dolor nisi mollit velit id do voluptate irure ea nostrud exercitation excepteur mollit. Duis sunt consectetur proident ullamco ipsum excepteur consequat do duis. Proident consequat ut laborum magna aliquip. Esse culpa tempor ullamco sunt officia officia ea occaecat elit occaecat mollit consectetur in exercitation. Laborum cillum ad laboris fugiat incididunt occaecat. Dolore laborum cillum quis esse adipisicing non Lorem eu.
','Nichole','2017-08-30 00:00:00','Cupidatat cillum laborum labore esse cillum culpa irure quis ad eiusmod quis nulla. Dolor nulla deserunt laborum officia consectetur officia sunt labore quis labore consectetur aute. Qui irure labore dolore in irure consequat exercitation elit proident eiusmod fugiat do. In est irure commodo ad cillum ut id cillum sit cupidatat elit. Consectetur cillum exercitation voluptate aliqua proident adipisicing ex. Officia qui est eiusmod commodo aliqua et.
'),
 (5,'bridget','y?)��3�wm	:8Jx\2�?vy�E8��G!����^ʠ�gץ��2A���c8Dd4��F�y�s','{�3�9���=��W/���%`�I+�$�2��lr��/�:�%C[��qxz���14�T���z_X���rJ�T�@`������#��^�۲Sآ>fLg�u��9?Jc3�0`��!�MMv�%�^J��A\^-=��Ms','Ona','Turks and Caicos Islands','2017-06-23 00:00:00','1965-07-31 00:00:00','female','Exercitation consequat labore proident id nisi non aliquip exercitation.','Dolore magna ad aute elit eiusmod pariatur in. Consectetur proident sint cillum quis ad quis. Laboris adipisicing consequat minim eiusmod irure amet. Veniam et do in voluptate nulla reprehenderit in sint. Do adipisicing quis occaecat officia non. Est aute ad cillum eiusmod velit anim esse ea dolore.
','Bridget','2020-10-01 17:47:26.6602208','Reprehenderit amet id elit elit enim veniam sint esse deserunt. Consectetur sit qui reprehenderit in nulla anim laboris ea. Et ad ad pariatur adipisicing enim dolor. Exercitation mollit dolore incididunt irure dolore mollit enim do qui elit. Tempor dolore consequat veniam culpa commodo amet non excepteur consequat deserunt dolore.
'),
 (6,'fisher','cJ]_�*uߘi�6~��G��f�a��v�Qm��)�G�|NL_�su�M���0�6㲟��ۊ	�vӿ','.o���;��z��X���''�M���B\�_rT!�x,�j���Bwv��FL��2�@��ܖȨ�6�H��!����9�vp9I�� ���d�Z�;�lS��UJG����sj��Hy�蹲�=ԧ۱J','Bennett','Dominican Republic','2017-10-15 00:00:00','1990-04-02 00:00:00','male','Ullamco sint deserunt enim dolor cupidatat mollit.','Ex sit do magna amet dolor aliquip veniam qui cillum fugiat dolore. Reprehenderit et non ipsum id non aute enim exercitation fugiat dolor fugiat eiusmod. Culpa consectetur sunt sit labore. Veniam ullamco ut cillum sit labore cupidatat consectetur dolor Lorem. Nisi nulla commodo minim aliquip aliqua anim eu eiusmod ex et nulla est ullamco. Et enim consequat fugiat consequat id id deserunt veniam aliqua nostrud nostrud.
','Fisher','2020-09-29 19:10:34.7598925','Pariatur qui nostrud eu excepteur aliquip aliquip non. Ipsum eu commodo cillum minim labore elit sint velit laboris mollit fugiat minim tempor. Consequat ex consequat sunt officia. Anim exercitation do dolore ut do excepteur eu duis ut voluptate dolor eiusmod aute. Amet veniam ad in mollit duis magna esse eu amet nulla elit non elit ea. Officia excepteur et commodo cupidatat amet non aliqua laborum consectetur nisi nostrud anim adipisicing. Sint non duis ex amet voluptate ex.
'),
 (7,'simon','�N��H�x��m�!&Yz�4�D;C�&��j|g'')�}�.��~�~���V~��"@g���ܧ7�k',X'83fb40a03218a07e5bced7e8090c8be86e98b0adf502a6e93ab549f2c62c0ad71e824d6419c9246d0fb343931e49cfdc3f3c386e8fe7d97f0fdb212de7226c95a941083c3795d9f34e0f40119b8fda6a29b3b686a6865f00cff94e88ddeb86abb46a714e1bece2f1acfec8b0eabda15aa5317bb3e5dc487e52d9a17073852383','Chamizal','Guadeloupe','2017-06-22 00:00:00','1964-08-27 00:00:00','male','Occaecat culpa commodo tempor ullamco mollit nostrud pariatur reprehenderit officia dolore proident aliquip.','Esse sunt esse cupidatat enim nulla et nisi labore commodo dolor dolore laboris non. Id non Lorem cillum exercitation aliquip ut tempor. Deserunt commodo laborum proident reprehenderit eiusmod pariatur incididunt. Sit officia cupidatat adipisicing esse sunt cupidatat amet irure occaecat do est. Lorem officia magna culpa ex sit in veniam proident.
','Simon','2020-09-29 20:57:19.6685589','Ullamco ad elit ex ullamco consectetur sint laborum occaecat. Qui sunt aute est culpa irure incididunt culpa sunt et in. Aute esse id ex commodo elit. Exercitation cupidatat laboris officia elit aliquip exercitation aliqua. Sunt sit ea ea sint consequat consectetur eu proident aliquip anim veniam. Ipsum esse do reprehenderit sint veniam dolore proident dolor do. Cupidatat laborum sunt enim voluptate in laboris ipsum ea laborum in eu.
'),
 (8,'rivers','�mDݴ(�Z�;j��Dܱ�''�"b�]#�{tr�H�*�^��cN��(A0�v-3Z�5��','	�\��N_��; �ͽ2�.�c���e�
ˉ��`���?��|B��d��t5����si��B|�b!�����u=uVw���Z�d���2G�M2]� ^�pF��A*6�U����$�����Ǣ','Rockbridge','Taiwan','2017-04-16 00:00:00','1952-12-16 00:00:00','male','Exercitation sit ut labore esse culpa sit.','Anim incididunt eu eiusmod ut excepteur esse quis deserunt adipisicing enim ut culpa. Eiusmod dolor proident dolor pariatur enim do. Duis dolor cupidatat aute minim consectetur voluptate esse labore.
','Rivers','2017-04-16 00:00:00','Deserunt amet ad duis anim non velit. Occaecat adipisicing consectetur aute commodo cillum aliquip magna laborum irure eu. Velit aliquip incididunt pariatur fugiat amet eiusmod consequat Lorem et ipsum Lorem amet.
'),
 (9,'boyer','CӠ1��ͦ9<���ٲ�[<�!Wؖ�D�[�쵕@LAT���h�̾�]$�����S|=D',X'60db3aed15e99a581550f5a8b8c7aeae13f6190b68004abe28466da6d3f9ad240cf4047e9a128d2b00be2a6a2bf6492b608665c1adc837180c2f9ffb0a226ee56c3e9f7a8a386063597f0587cce879305244cb6a8ea7e2d29df6a74e893621a1c14fb3ecf2618d0073b17fed9aeac2e6f449bd8e2600f2101cb4bfd7cb485e9e','Katonah','Georgia','2017-09-17 00:00:00','1974-12-02 00:00:00','male','Est laborum quis ullamco nulla cupidatat anim enim aliqua et veniam et consectetur dolore ea.','In ex in incididunt esse aute sit ex anim dolore laborum nisi id ea. Consequat incididunt aute eiusmod amet ut. Esse ullamco qui anim sit adipisicing ea consectetur adipisicing sunt est duis. Esse Lorem mollit est aute quis aliquip exercitation labore voluptate. Id aute elit est Lorem.
','Boyer','2017-09-17 00:00:00','Ipsum sint esse do amet minim ipsum id non nulla nostrud eiusmod deserunt. Magna Lorem deserunt aliqua aliquip aliquip tempor culpa nulla occaecat pariatur. Voluptate minim commodo sint ad commodo nostrud. Ullamco fugiat occaecat sint laboris sunt aliqua fugiat in enim. Exercitation excepteur aliqua commodo fugiat proident mollit.
'),
 (10,'johnson','�8��X�6���s�U��P�{K�1�N��c_�r���9��M�E��`�G�h�}�@�Q','�r�Ì�9K�e)�''�A����_�V����v[�5�4.��>]xܘ���1r}��#bv"��͛�e�d΢�Q�i �±����~��=d0	��nٻɗ7mF=�����w��~��z��"Z!��x^,G�','Barronett','Botswana','2017-06-28 00:00:00','1957-07-17 00:00:00','male','Sunt quis laboris culpa est mollit nulla aliquip dolor labore non.','Occaecat veniam quis culpa minim ullamco sunt sint veniam elit ad magna. Sit est quis duis commodo tempor mollit duis incididunt sint. Incididunt exercitation fugiat elit Lorem culpa elit.
','Johnson','2017-06-28 00:00:00','Anim consequat ut nostrud veniam ea ipsum duis ea nisi ullamco quis. Anim anim elit duis commodo occaecat quis quis esse. Excepteur occaecat ipsum mollit mollit amet velit occaecat fugiat nostrud. Proident anim sunt officia ex elit ea culpa est ut officia adipisicing quis. Nulla non cupidatat commodo ullamco amet voluptate elit consectetur.
'),
 (14,'serge','oŨ�T���	�x��9�����Y���43�d2��(��Q�eH-S$���ď��֑	����|�� ','i�0�r��RPD|�G�"<㕿�i����U�<l����.L��IG��L
�f��������!#��M�y��;�R9����,�V�aF,l��1�L�y�Z��pg؍�>��''���~U���h��^�','chicago','usa','2020-09-25 07:29:38.6983741','1940-01-01 06:00:00','male','This is good enough for a training course','This is good enough for a training course','serginho','2020-09-25 07:29:38.6984573','This is good enough for a training course'),
 (15,'rueda',X'b1001d45ff3dfacd2c062594d3a4d5bd00b2bea22bd1a7107d281084831c74ad087bf030dfac91c78f25379dca064167cf999b900389f69a54fa76d3d43b3fef','�2(t)�H��[!��j%1��z���v����N�S�u��T�4�e�pNJ}h��g���BYX������o�p/�(��˟ C5�����,���8��L�Ͷ4�U�&�Y�i�YN��{���{��:','Kiev','UKraine','2020-09-25 13:21:40.3181199','2020-08-01 05:00:00','male',NULL,NULL,'serginho','2020-09-25 16:20:03.8409365',NULL);
INSERT INTO "Photos" ("Id","Url","Description","DateAdded","isMain","UserId","PublicId") VALUES (1,'https://randomuser.me/api/portraits/women/47.jpg','Ut dolore minim ipsum minim exercitation anim aliqua esse.','0001-01-01 00:00:00',1,1,NULL),
 (2,'https://randomuser.me/api/portraits/women/33.jpg','Culpa sint consectetur in deserunt occaecat nostrud in commodo ad deserunt in minim.','0001-01-01 00:00:00',0,2,NULL),
 (3,'https://randomuser.me/api/portraits/women/65.jpg','Esse aliquip enim nisi culpa sunt.','0001-01-01 00:00:00',1,3,NULL),
 (4,'https://randomuser.me/api/portraits/women/38.jpg','Adipisicing consequat consequat sit aute officia commodo officia esse dolore dolore anim consequat nisi excepteur.','0001-01-01 00:00:00',1,4,NULL),
 (5,'https://randomuser.me/api/portraits/women/6.jpg','Proident reprehenderit est enim proident ad exercitation irure eu laboris exercitation aute voluptate dolore adipisicing.','0001-01-01 00:00:00',1,5,NULL),
 (6,'https://randomuser.me/api/portraits/men/44.jpg','Culpa commodo proident do dolor cillum pariatur eiusmod cillum reprehenderit do Lorem nulla do.','0001-01-01 00:00:00',1,6,NULL),
 (7,'https://randomuser.me/api/portraits/men/72.jpg','Magna ea dolore eu incididunt eu commodo culpa sunt magna in magna est.','0001-01-01 00:00:00',0,7,NULL),
 (8,'https://randomuser.me/api/portraits/men/23.jpg','Duis esse irure nulla ullamco est id consequat Lorem.','0001-01-01 00:00:00',1,8,NULL),
 (9,'https://randomuser.me/api/portraits/men/36.jpg','Sint aliqua ut culpa ipsum deserunt elit anim voluptate fugiat.','0001-01-01 00:00:00',1,9,NULL),
 (10,'https://randomuser.me/api/portraits/men/52.jpg','Laboris magna mollit consequat deserunt consectetur culpa commodo anim est ea sunt.','0001-01-01 00:00:00',1,10,NULL),
 (11,'http://res.cloudinary.com/ruedatech/image/upload/v1600848892/aaqkkfqrwucq1gdxexkb.jpg',NULL,'2020-09-23 03:14:36.3380874',0,3,'aaqkkfqrwucq1gdxexkb'),
 (12,'http://res.cloudinary.com/ruedatech/image/upload/v1600898470/xuzkfv5ksvd6kunuu7cd.jpg',NULL,'2020-09-23 17:00:41.7832543',0,3,'xuzkfv5ksvd6kunuu7cd'),
 (15,'http://res.cloudinary.com/ruedatech/image/upload/v1600931768/vmhgickdgz4nufyapa5q.jpg',NULL,'2020-09-24 02:16:06.4499127',1,7,'vmhgickdgz4nufyapa5q'),
 (21,'http://res.cloudinary.com/ruedatech/image/upload/v1601037015/wqq285a3qn4obnlonzl7.jpg',NULL,'2020-09-25 07:30:14.3737155',1,14,'wqq285a3qn4obnlonzl7'),
 (22,'http://res.cloudinary.com/ruedatech/image/upload/v1601037034/md8w7oq18n9j4fja0esa.jpg',NULL,'2020-09-25 07:30:33.0789812',0,14,'md8w7oq18n9j4fja0esa'),
 (23,'http://res.cloudinary.com/ruedatech/image/upload/v1601064450/xvtanwtyzqcixjlbos1j.jpg',NULL,'2020-09-25 15:07:28.1480583',1,15,'xvtanwtyzqcixjlbos1j'),
 (24,'http://res.cloudinary.com/ruedatech/image/upload/v1601148033/if2vjhs8sqhvycddnlso.jpg',NULL,'2020-09-26 14:20:05.8006472',1,2,'if2vjhs8sqhvycddnlso');
INSERT INTO "Likes" ("LikerId","LikeeId") VALUES (3,15),
 (3,14),
 (3,6),
 (6,3),
 (6,1),
 (6,2),
 (3,9),
 (7,2),
 (7,1),
 (7,4),
 (7,5),
 (5,6);
INSERT INTO "Messages" ("Id","SenderId","ReciepientId","RecipientId","ContenT","IsRead","DateRead","MessageSent","SenderDeleted","RecipientDeleted") VALUES (18,3,6,NULL,'This is a test message from Susie to Fisher',0,NULL,'2020-09-28 06:13:54.5551782',0,0),
 (19,7,3,NULL,'This is a message from Simon to Susie',0,NULL,'2020-09-28 12:43:49.0310276',0,0),
 (20,7,3,NULL,'This is 2nd message from Simon to Susie',0,NULL,'2020-09-28 12:44:12.1840107',0,0),
 (21,7,3,NULL,'This is 3rd message from Simon to Susie',0,NULL,'2020-09-28 12:44:19.4257668',0,0),
 (22,3,5,NULL,'This is 1st message from Susie to bridget',0,NULL,'2020-09-30 19:15:08.676797',0,0),
 (23,3,5,NULL,'This is 2nd message from Susie to bridget',0,NULL,'2020-09-30 19:20:24.9472642',0,0),
 (24,3,5,NULL,'This is 3rd message from Susie to bridget',0,NULL,'2020-09-30 19:21:58.2587998',0,0),
 (25,5,3,NULL,'This is 1st message from bridget to susie',0,NULL,'2020-09-30 20:02:27.5043959',0,0),
 (26,5,3,NULL,'This is a message from bridget to susie',0,NULL,'2020-10-01 08:32:08.0998672',0,0),
 (27,5,3,NULL,'This is another message from bridget to susie',0,NULL,'2020-10-01 08:40:12.8033762',0,0),
 (28,5,3,NULL,'This is Yet another message from bridget to susie',0,NULL,'2020-10-01 08:51:02.6801627',0,0),
 (29,5,3,NULL,'This is Yet yet another message from bridget to susie',0,NULL,'2020-10-01 08:57:22.2232472',0,0),
 (30,5,3,NULL,'This is Yet yet yet yet another message from bridget to susie',0,NULL,'2020-10-01 09:54:43.0958675',0,0),
 (34,3,0,NULL,'This Simon testing',0,NULL,'2020-10-01 17:52:24.3043589',0,0),
 (35,3,0,NULL,'This Simon testing again',0,NULL,'2020-10-01 17:55:23.6955766',0,0),
 (36,3,0,NULL,'test 2',0,NULL,'2020-10-01 20:13:48.5137534',0,0),
 (37,3,0,NULL,'test 3',0,NULL,'2020-10-01 20:29:29.5305674',0,0),
 (38,3,0,NULL,'test 4',0,NULL,'2020-10-01 20:34:09.3871568',0,0),
 (39,3,0,NULL,'test 5',0,NULL,'2020-10-01 20:36:47.119146',0,0),
 (40,3,0,NULL,'test 6',0,NULL,'2020-10-01 20:50:19.7323391',0,0),
 (41,3,0,NULL,'test 7',0,NULL,'2020-10-01 20:54:06.8659612',0,0),
 (42,3,0,NULL,'test 33',0,NULL,'2020-10-01 20:57:18.2083052',0,0);
CREATE INDEX IF NOT EXISTS "IX_Photos_UserId" ON "Photos" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_Likes_LikeeId" ON "Likes" (
	"LikeeId"
);
CREATE INDEX IF NOT EXISTS "IX_Messages_RecipientId" ON "Messages" (
	"RecipientId"
);
CREATE INDEX IF NOT EXISTS "IX_Messages_SenderId" ON "Messages" (
	"SenderId"
);
COMMIT;
