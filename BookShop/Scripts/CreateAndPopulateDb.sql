CREATE DATABASE BookStore 
GO 

USE BookStore
GO

CREATE TABLE [dbo].[Author]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	FirstName NCHAR(128) NOT NULL, 
	LastName NCHAR(128) NOT NULL
);


INSERT INTO Author(FirstName,LastName) VALUES('Nelle','Maddox'),('Catherine','Brady'),('Isaac','Mcdonald'),('Flynn','Baxter'),('Cooper','Salas'),('Blythe','Stark'),('Karina','Michael'),('Nehru','Heath'),('Xandra','Whitfield'),('Rajah','Cote');
INSERT INTO Author(FirstName,LastName) VALUES('Zeus','Reynolds'),('Kylan','Griffith'),('McKenzie','Dawson'),('Christopher','Shields'),('Victoria','Mann'),('Guy','Lawrence'),('Nicole','Dillon'),('Pearl','Mathis'),('Caleb','Bailey'),('Price','Lane');
INSERT INTO Author(FirstName,LastName) VALUES('Dillon','Berger'),('Jamal','Phillips'),('Damian','Frank'),('Candice','Ewing'),('Carlos','Schwartz'),('Sara','Merrill'),('Elliott','York'),('Felix','Lott'),('Riley','Aguilar'),('Rhiannon','Callahan');
INSERT INTO Author(FirstName,LastName) VALUES('Elijah','Schwartz'),('Andrew','Peterson'),('Damon','Baxter'),('Vincent','Floyd'),('Jonah','Barrett'),('Leila','Stanton'),('Donovan','Zamora'),('Oleg','Jimenez'),('Jena','Copeland'),('Ima','Yang');
INSERT INTO Author(FirstName,LastName) VALUES('Uriel','Anderson'),('Amaya','Schwartz'),('Norman','Cole'),('Malcolm','Sandoval'),('Quinn','Paul'),('Jolene','Hancock'),('Andrew','Pitts'),('Sylvia','Anderson'),('Autumn','Owen'),('Willa','Holden');
INSERT INTO Author(FirstName,LastName) VALUES('Phoebe','Reed'),('Erasmus','Mcguire'),('Mufutau','Navarro'),('Beck','Watson'),('Mason','Harmon'),('Delilah','Garrett'),('Talon','Lowe'),('Simone','Shelton'),('Caesar','Stokes'),('Dillon','Gregory');
INSERT INTO Author(FirstName,LastName) VALUES('Hayfa','Wyatt'),('Jasper','Reilly'),('Cassady','Hardin'),('Iris','Parsons'),('Ashely','Warner'),('Leslie','Odonnell'),('Leila','Morrison'),('Erasmus','Gillespie'),('Tad','Mann'),('Camden','Odom');
INSERT INTO Author(FirstName,LastName) VALUES('Madonna','Hutchinson'),('Kirsten','Beck'),('Hasad','Chaney'),('Ira','Aguirre'),('Rhea','Rios'),('Daquan','Wolfe'),('Emery','Mcdowell'),('Zachery','Good'),('Aline','Hill'),('Keaton','Guerrero');
INSERT INTO Author(FirstName,LastName) VALUES('Jocelyn','Justice'),('Kirestin','Keller'),('Maisie','Ballard'),('Solomon','Burks'),('Cameran','Sexton'),('Irma','Jacobson'),('Ori','Hood'),('Yael','Wilkins'),('Carson','Wagner'),('Tatyana','Peck');
INSERT INTO Author(FirstName,LastName) VALUES('Kylynn','Hart'),('Dean','Barrett'),('Calista','Summers'),('Jacob','Randolph'),('Gabriel','Blake'),('Colin','Blankenship'),('Jeremy','Hooper'),('Piper','Levy'),('Kennan','Sherman'),('Fallon','Rice');


CREATE TABLE [dbo].[BookCategory] (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Category NCHAR(128) NOT NULL,
	CONSTRAINT UC_BookCategory UNIQUE (Category)
);


INSERT INTO BookCategory (Category) VALUES ('Fiction');
INSERT INTO BookCategory (Category) VALUES ('Fantasy');
INSERT INTO BookCategory (Category) VALUES ('Mystery');
INSERT INTO BookCategory (Category) VALUES ('Romance');
INSERT INTO BookCategory (Category) VALUES ('Westerns');
INSERT INTO BookCategory (Category) VALUES ('Dystopian');
INSERT INTO BookCategory (Category) VALUES ('Thriller');
INSERT INTO BookCategory (Category) VALUES ('Contemporary');
INSERT INTO BookCategory (Category) VALUES ('Sci-Fi');


CREATE TABLE [dbo].[Book]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	Name NCHAR(128) NOT NULL, 
	AuthorId INT, 
	EditionYear SMALLINT NOT NULL CONSTRAINT CHK_EditionYear_validation CHECK (EditionYear >=1000 AND EditionYear <=3000), 
	Price MONEY,
	CategoryId INT,
	CONSTRAINT FK_BookCategory_To_Book FOREIGN KEY (CategoryId) REFERENCES BookCategory (Id) ON DELETE SET NULL,
	CONSTRAINT FK_Author_To_Book FOREIGN KEY (AuthorId) REFERENCES Author(Id) ON DELETE SET NULL
)

INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('consequat dolor vitae',7,2012,'$16.30',6),('congue a, aliquet',53,1962,'$74.21',1),('Aliquam erat volutpat.',81,2000,'$86.63',8),('Phasellus ornare. Fusce',99,1988,'$47.17',9),('Nunc pulvinar arcu',61,1994,'$80.00',5),('nibh lacinia orci,',44,2005,'$76.58',2),('urna, nec luctus',30,2010,'$33.17',1),('nec ante blandit',30,2005,'$82.81',8),('eu tellus eu',76,2021,'$12.39',8),('fringilla, porttitor vulputate,',38,2016,'$37.75',1);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('libero. Donec consectetuer',18,1959,'$11.99',7),('at, iaculis quis,',2,1985,'$78.50',2),('dictum ultricies ligula.',88,1956,'$41.69',6),('quis accumsan convallis,',78,2002,'$99.00',8),('mi tempor lorem,',18,1958,'$47.68',2),('consequat nec, mollis',61,1994,'$92.59',2),('Quisque ac libero',51,2009,'$9.26',5),('Phasellus fermentum convallis',88,2020,'$26.26',5),('nibh sit amet',7,2019,'$99.78',8),('Mauris vel turpis.',82,1973,'$30.23',2);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('felis eget varius',9,1953,'$19.51',5),('in, tempus eu,',64,2002,'$67.36',4),('lacus. Ut nec',29,1990,'$24.21',1),('dignissim magna a',68,1976,'$2.10',1),('vulputate, nisi sem',92,1980,'$89.09',3),('cursus, diam at',20,1966,'$5.67',8),('cursus et, magna.',33,2019,'$44.97',2),('rutrum. Fusce dolor',30,1956,'$67.04',6),('egestas. Fusce aliquet',24,1967,'$65.93',1),('id, blandit at,',78,1988,'$43.88',4);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('lectus rutrum urna,',39,1998,'$92.00',1),('ultricies adipiscing, enim',80,1988,'$52.92',2),('lorem vitae odio',5,2016,'$25.53',7),('Sed auctor odio',89,1985,'$53.17',5),('habitant morbi tristique',94,2010,'$95.18',2),('cursus non, egestas',2,1956,'$88.82',4),('mattis semper, dui',5,2012,'$88.86',1),('neque sed dictum',15,1981,'$19.66',8),('tellus. Aenean egestas',79,1965,'$95.91',1),('eget, venenatis a,',92,2006,'$10.04',1);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('libero. Proin mi.',42,1989,'$72.51',4),('est. Mauris eu',18,1950,'$47.96',5),('sit amet, faucibus',76,1957,'$31.41',6),('dictum. Proin eget',3,2003,'$64.31',9),('tristique pellentesque, tellus',37,2015,'$13.75',8),('ultricies ornare, elit',51,1986,'$8.26',6),('non sapien molestie',15,2018,'$52.20',1),('montes, nascetur ridiculus',11,2016,'$44.89',1),('vitae velit egestas',1,1992,'$62.31',1),('dolor egestas rhoncus.',36,2014,'$53.78',3);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('mauris sapien, cursus',6,1966,'$94.28',7),('egestas rhoncus. Proin',41,1977,'$96.42',8),('risus. Donec egestas.',80,1951,'$26.10',3),('aliquet, sem ut',69,1961,'$41.66',2),('ut, pellentesque eget,',88,1952,'$55.14',1),('magna a neque.',17,1956,'$76.07',6),('convallis convallis dolor.',14,2014,'$3.56',3),('dapibus quam quis',97,1957,'$94.80',6),('Donec vitae erat',72,2012,'$5.94',4),('magna. Phasellus dolor',52,1952,'$51.68',3);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('erat volutpat. Nulla',51,1967,'$78.48',8),('fringilla cursus purus.',42,1967,'$76.56',1),('quam. Pellentesque habitant',11,1950,'$58.08',7),('ultrices posuere cubilia',82,1956,'$66.75',1),('dui nec urna',34,1950,'$60.13',7),('consectetuer ipsum nunc',6,2012,'$51.78',8),('eu enim. Etiam',65,1987,'$34.54',8),('luctus lobortis. Class',32,1978,'$6.66',4),('mauris ut mi.',8,1991,'$67.17',6),('ornare. Fusce mollis.',13,1955,'$71.88',2);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('interdum. Sed auctor',12,2019,'$31.07',6),('vitae erat vel',53,1961,'$47.44',1),('fermentum risus, at',5,1977,'$86.97',4),('egestas hendrerit neque.',50,1957,'$66.12',7),('Ut tincidunt orci',2,1984,'$95.02',4),('Nunc sollicitudin commodo',14,1966,'$5.12',8),('neque tellus, imperdiet',15,1970,'$49.25',9),('ullamcorper viverra. Maecenas',37,1959,'$24.19',7),('elementum purus, accumsan',33,1975,'$56.35',3),('tincidunt aliquam arcu.',52,2000,'$47.46',8);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('nonummy ipsum non',65,1987,'$92.01',5),('placerat, orci lacus',85,2003,'$50.73',6),('Cras convallis convallis',85,1995,'$9.50',6),('nec, imperdiet nec,',81,2000,'$71.48',4),('Morbi metus. Vivamus',98,1971,'$10.56',4),('Nunc quis arcu',86,2013,'$9.43',6),('Vestibulum ante ipsum',49,1973,'$40.40',7),('aliquet libero. Integer',29,2007,'$43.12',4),('odio. Nam interdum',73,1991,'$80.57',1),('metus facilisis lorem',12,1998,'$78.63',8);
INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('felis orci, adipiscing',1,1991,'$39.35',6),('inceptos hymenaeos. Mauris',25,1962,'$33.42',1),('nascetur ridiculus mus.',48,2019,'$73.89',9),('diam eu dolor',80,2002,'$69.84',9),('tellus sem mollis',25,1971,'$94.13',7),('ullamcorper eu, euismod',16,1981,'$1.95',2),('Vivamus molestie dapibus',53,1959,'$27.51',6),('ornare placerat, orci',97,2011,'$97.10',1),('ac turpis egestas.',68,2016,'$35.29',6),('rutrum urna, nec',61,1973,'$48.41',9);

CREATE TABLE [dbo].[Contact]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	Email NCHAR(128) NOT NULL, 
	Address NCHAR(128) NOT NULL, 
	PhoneNumber NCHAR(15) NOT NULL
)

INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('ac.facilisis.facilisis@ornare.edu','P.O. Box 568, 7816 Nec Avenue','040-219-5904'),('at.lacus.Quisque@consequat.net','7939 At, Av.','003-444-5128'),('lobortis.tellus@Sed.org','Ap #245-1456 Maecenas Avenue','021-788-9924'),('libero.est.congue@blanditviverraDonec.edu','236-3188 Non, Avenue','004-804-3860'),('pede@ametornare.com','465-2738 Nascetur Street','054-940-1781'),('hymenaeos.Mauris.ut@estMauriseu.co.uk','465-5628 Lectus Road','098-667-8924'),('Duis.elementum@netusetmalesuada.edu','P.O. Box 668, 5229 Dui Street','029-987-1301'),('luctus.felis@tristiquealiquet.org','1562 Eget Av.','000-168-5818'),('et.malesuada.fames@acmattisornare.org','P.O. Box 263, 4838 Et Street','097-856-9128'),('Aenean.gravida@interdumenimnon.ca','P.O. Box 296, 1622 Porttitor Road','094-000-6778');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('orci.adipiscing@felis.co.uk','P.O. Box 558, 9667 Aliquam Avenue','054-239-5726'),('libero@sapiencursusin.ca','P.O. Box 964, 5465 Rutrum St.','021-265-9007'),('Aenean.euismod.mauris@neccursus.co.uk','Ap #601-7520 Lectus. Rd.','036-175-1947'),('nec@luctusvulputatenisi.co.uk','214-1223 Dolor, Av.','079-963-7647'),('bibendum.sed.est@loremluctus.co.uk','8766 Aliquam Rd.','048-451-4082'),('egestas.rhoncus@id.com','P.O. Box 895, 4480 Per St.','082-028-4645'),('arcu.Vestibulum@nonmagna.com','P.O. Box 442, 9430 Dignissim Street','081-975-9629'),('Phasellus.dapibus.quam@erateget.edu','P.O. Box 805, 8006 Semper Street','013-829-1614'),('tellus@Vivamussit.net','254-7478 Consectetuer Av.','030-632-7425'),('ipsum.primis@facilisiseget.co.uk','769-1266 Nunc Ave','032-839-7156');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('vulputate.dui@primisin.co.uk','Ap #500-8510 Auctor Avenue','022-620-6654'),('neque.vitae@commodoipsumSuspendisse.net','Ap #191-4612 Enim Avenue','089-661-6343'),('nulla.Integer@euismod.com','892-6984 Praesent Rd.','040-446-8942'),('nonummy.ultricies.ornare@utaliquamiaculis.ca','P.O. Box 518, 9619 Scelerisque Av.','097-684-7655'),('dignissim.tempor@Pellentesquehabitant.net','P.O. Box 636, 2885 Pellentesque St.','067-349-6482'),('commodo@anteMaecenasmi.com','Ap #688-9886 Dapibus Rd.','081-776-2483'),('elit@Pellentesque.ca','P.O. Box 675, 9018 Nullam Street','044-200-4082'),('In.ornare.sagittis@sitamet.ca','Ap #289-7194 Tincidunt Road','016-848-6857'),('Mauris.non@consequatpurus.net','Ap #242-5293 In Ave','061-268-6574'),('erat@eueleifend.edu','P.O. Box 302, 1833 Elit. St.','018-712-5653');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('non@magnisdisparturient.org','477-4016 Metus. Avenue','053-969-1940'),('nulla.Integer@felis.edu','992-2596 Cras Av.','083-365-4182'),('purus.sapien.gravida@etmagnisdis.com','521-630 Eget Street','038-786-8395'),('risus@liberoInteger.org','Ap #676-1971 Lectus Rd.','008-531-0802'),('quis.arcu@pedenec.org','9355 Aliquam, Rd.','027-833-4189'),('et.commodo.at@Phasellusfermentumconvallis.ca','Ap #401-4548 Nisl. Ave','084-158-7844'),('at.augue.id@porttitor.ca','2520 Libero St.','049-594-7790'),('orci@adipiscinglacus.net','867-6291 Mi St.','035-699-1717'),('dolor.quam.elementum@velit.co.uk','5999 Commodo Rd.','077-268-3375'),('Integer.tincidunt@vitae.co.uk','956 Aliquam Rd.','031-926-1349');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('Cum@acsem.edu','P.O. Box 164, 9065 Malesuada Rd.','037-579-2511'),('consectetuer@velit.net','Ap #583-468 Neque Road','052-685-9281'),('magna.sed.dui@velvenenatisvel.org','Ap #739-9352 Magna Street','007-074-9141'),('eu@iaculis.net','P.O. Box 125, 6250 Lectus Rd.','041-839-7351'),('pharetra@hendrerit.com','Ap #189-2215 Ut Avenue','087-349-4762'),('risus@vitaesodales.ca','Ap #188-8954 Tristique Av.','004-704-3314'),('a@auguemalesuadamalesuada.com','5565 Quisque Road','021-644-6474'),('purus.mauris@vel.net','P.O. Box 136, 4840 Lorem Road','093-379-0645'),('Sed.eu@semmolestie.com','Ap #197-858 Feugiat Av.','055-306-3319'),('Aliquam.ultrices.iaculis@quamdignissim.net','142-7123 Ante Rd.','070-052-9591');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('dictum.placerat.augue@accumsansedfacilisis.ca','P.O. Box 142, 7600 Donec St.','022-349-1049'),('Donec.tempor.est@blandit.co.uk','3391 Penatibus Rd.','081-075-8593'),('tellus.faucibus.leo@senectuset.ca','4143 Ut, St.','093-458-3672'),('vulputate.posuere.vulputate@enimcondimentum.edu','Ap #767-1261 Nisl Av.','058-758-4282'),('tellus.Suspendisse@dictumeu.org','798-6128 Sed Ave','074-794-1327'),('sapien@nasceturridiculus.co.uk','Ap #853-840 Egestas Street','005-144-1978'),('ut.ipsum@CuraeDonectincidunt.com','Ap #742-8033 Aliquam St.','029-321-1502'),('ligula.Aenean.euismod@quam.net','Ap #667-4212 Nunc Road','070-863-7536'),('commodo.tincidunt.nibh@ultriciesadipiscingenim.ca','8042 Tincidunt Road','064-540-8116'),('ut.odio@felisorciadipiscing.org','P.O. Box 861, 3051 Magna. Rd.','032-562-5196');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('magna@ametmetus.net','P.O. Box 254, 2670 Elit. Rd.','020-671-6186'),('tortor@sed.org','8123 Pellentesque, Rd.','016-913-6660'),('pharetra.Nam@quistristique.ca','Ap #563-5092 Sed, St.','032-531-3518'),('tellus.Aenean.egestas@odiovel.net','P.O. Box 193, 5033 Dictum. Av.','004-364-7942'),('placerat.augue@utdolor.org','9351 Adipiscing Street','088-236-6457'),('velit.Quisque@fringillaornare.ca','1851 Non St.','040-767-0053'),('ut.pellentesque@tinciduntnibh.org','5753 Sapien. Rd.','057-485-5981'),('Curae.Donec.tincidunt@iderat.org','5963 Aliquam Street','027-932-7956'),('vel.pede@PhasellusnullaInteger.org','5803 Interdum St.','017-985-0824'),('elit.erat@duiaugueeu.ca','304-9189 Aliquam St.','048-111-0734');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('eu.arcu@eueleifend.net','Ap #340-8209 Lorem, St.','035-832-1700'),('magnis@elitAliquam.co.uk','Ap #538-7997 Tristique St.','056-823-6938'),('malesuada.id.erat@sedorcilobortis.com','356-1281 Lorem, Street','093-991-7663'),('ut@antedictumcursus.co.uk','621-5551 Semper, Avenue','076-390-5798'),('mollis.Phasellus.libero@idnuncinterdum.co.uk','165 Ut Ave','024-121-4118'),('nibh@nulla.ca','Ap #650-2569 Enim. Road','075-451-0593'),('montes.nascetur.ridiculus@dui.com','7876 Mi. Av.','078-729-5046'),('nulla.Integer@diam.co.uk','P.O. Box 859, 2854 Quis Rd.','096-733-3655'),('tortor@auctorquis.co.uk','P.O. Box 929, 7913 Dui. Street','022-444-4903'),('condimentum.Donec@Praesent.org','789-7484 Mi Street','083-800-4250');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('ac@lacinia.net','601 Dictum St.','039-088-1034'),('Duis.volutpat.nunc@imperdiet.edu','Ap #166-5079 Imperdiet Ave','086-601-8768'),('ridiculus.mus@sociosquadlitora.ca','517-3222 Consectetuer St.','042-291-2119'),('non.massa@dictumultricies.co.uk','Ap #551-9215 Purus Street','059-538-0691'),('aliquet@Nullamnisl.edu','5437 Nunc Rd.','011-539-4904'),('non@ipsumdolorsit.ca','6284 Felis Avenue','036-481-9441'),('magna.Phasellus.dolor@suscipit.org','3971 Ut Street','093-201-5514'),('auctor.velit@Aliquamvulputate.com','406-9788 Torquent St.','007-583-3699'),('a@acsem.com','P.O. Box 926, 9776 Donec St.','058-334-0960'),('imperdiet.erat.nonummy@primis.com','Ap #441-7094 Fermentum St.','083-750-5485');
INSERT INTO Contact([Email],[Address],[PhoneNumber]) VALUES('mauris.sagittis.placerat@dignissimpharetraNam.co.uk','327-7330 Ut Road','046-688-6813'),('interdum@natoquepenatibus.com','Ap #846-8033 Sociis Street','005-538-4328'),('dolor@turpisnec.edu','208-2535 Augue Rd.','006-110-6565'),('lacus@ridiculus.ca','356-1516 Erat, Ave','010-158-9542'),('consequat.purus@vulputaterisus.edu','9180 Augue Avenue','024-500-3596'),('auctor@consectetuercursuset.edu','Ap #406-7031 Aliquet Street','035-444-5070'),('magna.Cras.convallis@Curabituregestas.net','478-9204 Interdum. Rd.','058-239-2793'),('ultrices.iaculis@euismod.edu','246-3188 Lorem Avenue','027-463-6767'),('placerat.orci@viverraDonec.edu','404-4940 Sociis Street','094-830-8288'),('mollis@non.net','3934 Malesuada Ave','087-567-2544');

CREATE TABLE [dbo].[Customer]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	FirstName NCHAR(40) NOT NULL, 
	LastName NCHAR(40) NOT NULL, 
	Address NCHAR(40) NOT NULL, 
	Email NCHAR(128) NULL
)

INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Colt','Mercer','P.O. Box 716, 4061 Sociosqu Street','iaculis.lacus@consectetuer.com'),('Phillip','Koch','370-6003 Blandit Rd.','lorem@ultricies.co.uk'),('Colette','Bond','P.O. Box 932, 1764 Aliquet Rd.','Sed.congue.elit@vulputatenisi.edu'),('Myles','Taylor','P.O. Box 289, 6959 Ipsum. Rd.','sollicitudin@egetvenenatisa.ca'),('Joan','Randolph','7506 Sem Rd.','eu.elit.Nulla@sitametluctus.org'),('Courtney','Leach','Ap #976-2076 Lacus, Ave','nostra@porttitor.com'),('Lance','Byrd','Ap #267-2573 Amet Avenue','feugiat@Etiamimperdiet.ca'),('Tatiana','Montoya','Ap #657-617 Ornare Av.','ut.mi.Duis@ametfaucibusut.com'),('Joel','Forbes','9105 Quisque Street','arcu.ac.orci@sodalesatvelit.ca'),('Jerry','Black','P.O. Box 806, 1887 Vulputate, St.','libero.Donec@sollicitudinadipiscingligula.edu');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Melvin','Howell','P.O. Box 601, 430 Diam Rd.','a.neque.Nullam@dapibusrutrumjusto.net'),('Colt','Munoz','434-9130 Mauris Ave','feugiat@at.ca'),('Penelope','Aguirre','282-6926 Aenean Rd.','ac.eleifend.vitae@a.ca'),('Ann','Aguilar','P.O. Box 397, 3349 Mauris Avenue','Morbi.neque.tellus@et.net'),('Lesley','Evans','Ap #164-5824 Lacus. Avenue','ac.orci@purusDuiselementum.co.uk'),('Ulric','Saunders','P.O. Box 579, 3676 Dolor Road','sollicitudin.orci.sem@felisegetvarius.net'),('Finn','Dotson','8928 Semper Street','Morbi@massaSuspendisse.net'),('Rose','Fuller','Ap #224-3933 Lectus Rd.','risus.Duis.a@vitae.org'),('Cole','Cooley','3038 Tempus Road','ligula.Aenean.euismod@nisiMaurisnulla.net'),('Tanya','Orr','P.O. Box 402, 8154 Arcu. Ave','congue.turpis@Seddiamlorem.org');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Vanna','Rosario','9936 Auctor St.','ante.iaculis@tincidunt.net'),('Ferris','Bowers','395-194 Mauris Ave','Nulla.semper@molestiearcuSed.org'),('Hermione','Orr','P.O. Box 670, 630 Aliquam Road','Donec@leo.co.uk'),('Christopher','Russell','Ap #282-7680 Molestie Rd.','gravida.nunc@dolor.org'),('Dane','Pollard','Ap #511-5103 Donec St.','volutpat@fringillacursus.ca'),('Elaine','Wall','Ap #592-6163 Mattis. St.','sapien.cursus@Donecnon.edu'),('Marvin','Hayden','P.O. Box 711, 7816 Nec Ave','faucibus.lectus@Sedpharetrafelis.edu'),('Illana','Herrera','Ap #524-9790 Risus. Rd.','tristique.senectus.et@magnamalesuada.edu'),('Tate','Mcintosh','P.O. Box 824, 684 Ornare St.','volutpat.ornare.facilisis@atiaculisquis.co.uk'),('Arden','Bullock','Ap #600-5425 Sit Avenue','diam@sit.ca');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Autumn','Solomon','426-7056 Malesuada Rd.','lectus.Nullam@liberoProinsed.com'),('Eric','Blanchard','7798 Convallis Street','tortor@atauctor.net'),('Ora','Sellers','Ap #663-8817 Quisque Avenue','velit@utlacus.com'),('Hope','Shields','P.O. Box 647, 1268 Amet Road','nibh@luctusCurabituregestas.ca'),('Florence','Hahn','Ap #459-3515 Dolor Ave','lacus.Mauris@laoreetlibero.org'),('Jasper','Workman','P.O. Box 344, 6336 Amet, Road','Mauris.nulla@lectusquismassa.ca'),('Glenna','Lee','901-4762 Dapibus Av.','morbi@utodiovel.ca'),('Marsden','Shaffer','Ap #268-2107 Lorem Rd.','Ut@risusIn.edu'),('Aurora','Rowe','567-4217 Ipsum Rd.','nunc.In@fermentumvel.net'),('Bethany','Wooten','P.O. Box 761, 477 Non, Avenue','arcu.Morbi@arcu.co.uk');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Hashim','Munoz','5223 Donec Rd.','suscipit.est@facilisisvitae.org'),('Shea','Kline','P.O. Box 227, 6961 Mi Rd.','est.vitae@lectus.edu'),('Nevada','Daugherty','124-8055 Vestibulum Road','scelerisque.lorem.ipsum@eu.com'),('Jesse','Castillo','4113 Nunc, Road','Cum.sociis@Maurisnulla.net'),('Jordan','Carr','Ap #358-6671 Accumsan Av.','elit.fermentum.risus@euismodestarcu.ca'),('Caldwell','Bradford','681-3441 Auctor, St.','non.enim@auctor.ca'),('Donna','Gardner','4518 Nulla Rd.','Nunc.laoreet.lectus@massa.ca'),('Caldwell','Osborne','7429 Quam Rd.','eu@justoeu.ca'),('Noelle','Juarez','Ap #521-8141 Rutrum. Street','elit.Curabitur.sed@nascetur.org'),('Uriah','Salinas','P.O. Box 213, 2113 Gravida. Ave','Aliquam@nec.ca');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Anika','Rhodes','3417 Nibh St.','rhoncus@lacinia.com'),('Aiko','Fowler','3208 Dolor Ave','dolor@Crasinterdum.net'),('Carson','Morrow','7002 Iaculis, St.','mi.lorem@mauris.org'),('Steel','Walls','2186 Volutpat Street','tincidunt@Suspendissealiquet.com'),('Keane','Spencer','Ap #640-2883 Tellus Av.','arcu.ac@Curabituregestas.org'),('Ferdinand','Horton','P.O. Box 421, 7492 Est St.','senectus.et.netus@atrisusNunc.co.uk'),('Quail','Rosario','735-2727 Dolor. Rd.','Curae.Donec.tincidunt@Donecat.co.uk'),('Riley','Alston','4125 In Av.','scelerisque@id.org'),('Lucius','Stout','Ap #354-8088 Augue Av.','a@fermentumrisus.co.uk'),('Ulysses','Cherry','1749 Egestas. Rd.','nisl.Nulla@consectetuerrhoncus.com');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Oliver','Woodward','Ap #769-1003 Est Road','ac.urna@quamdignissimpharetra.ca'),('Diana','Lawson','953-3303 Parturient Rd.','Proin.sed.turpis@Cras.org'),('John','Orr','2827 Quam. Ave','commodo.auctor.velit@odioNaminterdum.ca'),('Emery','Wilkinson','538-5860 Venenatis Street','bibendum.Donec@mieleifendegestas.ca'),('Keegan','Blankenship','Ap #956-1496 Odio St.','sed@loremut.edu'),('John','Roy','9233 Nam Rd.','a@nibhsitamet.edu'),('Rhona','Hopper','P.O. Box 247, 8150 Commodo St.','pede@congueturpisIn.com'),('Peter','Mcgowan','Ap #915-6980 Tempor Av.','Maecenas.ornare@Nunccommodoauctor.com'),('Neve','Moon','Ap #163-982 Rutrum Rd.','elit.Nulla@quismassa.edu'),('Evan','Flowers','P.O. Box 273, 7152 Dui St.','faucibus.id.libero@semmolestie.co.uk');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Raphael','Gregory','483 Curabitur Street','felis@molestiedapibusligula.com'),('David','Green','Ap #669-6236 Eu St.','mi@vel.org'),('Thomas','Hahn','512-8679 Dictum Ave','elementum.dui.quis@laoreet.edu'),('August','Baird','977-353 Phasellus Av.','per@pellentesquetellus.co.uk'),('Giselle','Nichols','P.O. Box 378, 9545 Eget Rd.','sem.Pellentesque@gravidanonsollicitudin.com'),('Drake','Moreno','P.O. Box 921, 4092 Integer Av.','Mauris.ut@ornaretortorat.com'),('Elvis','Schroeder','Ap #953-7301 Nunc Ave','Etiam.bibendum.fermentum@nisiCumsociis.edu'),('Hyatt','Byrd','Ap #601-6744 Arcu Av.','ligula@idblanditat.org'),('Ray','Harvey','P.O. Box 196, 9677 Urna. Av.','Fusce.dolor@pede.edu'),('Edan','Austin','Ap #340-2010 Semper, Street','suscipit.nonummy.Fusce@metus.edu');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Brianna','Figueroa','5864 Phasellus Street','eu.odio.tristique@faucibusMorbivehicula.net'),('Cyrus','Kane','450 Neque. Av.','tempus@justosit.edu'),('Carlos','Boyer','877-3369 Sit Street','non@Etiam.ca'),('Alice','Nicholson','5838 Nunc. Street','at.risus@sit.ca'),('Lee','Wheeler','164-4911 Egestas. Rd.','eget.ipsum@diameudolor.net'),('Renee','Rowe','Ap #682-7845 Laoreet St.','Integer.tincidunt@magnaPraesent.ca'),('Jana','Knapp','1255 Varius. Avenue','enim.commodo@diam.net'),('Kareem','Compton','1363 Dictum St.','tortor.at.risus@nulla.ca'),('Hope','Hodges','Ap #403-8805 Quam Street','mollis.nec.cursus@sapienAeneanmassa.net'),('Carl','Emerson','P.O. Box 445, 9531 Amet, Rd.','dolor@egetmetus.ca');
INSERT INTO Customer([FirstName],[LastName],[Address],[Email]) VALUES('Damon','Walker','1519 Rutrum, Street','Aliquam@sociisnatoquepenatibus.co.uk'),('Lael','Crane','P.O. Box 182, 4297 Vestibulum Rd.','quis.arcu.vel@dolor.ca'),('Brooke','Owen','740-1269 Dolor Street','nec@enimSed.org'),('Yoko','Rios','738-3057 Quisque Rd.','lacus.pede@leoVivamusnibh.co.uk'),('Xantha','Juarez','2595 Lorem Rd.','elit@odioEtiamligula.net'),('Ezra','Herrera','5777 Ad Avenue','Quisque.imperdiet@fringillaest.ca'),('Axel','Hunter','P.O. Box 361, 4013 Eros Ave','tempor.augue@elitNullafacilisi.co.uk'),('Ivor','Shelton','P.O. Box 116, 3449 Augue Avenue','Vivamus@commodo.co.uk'),('Kylynn','Goff','8550 Mollis. Rd.','arcu.Curabitur@Sedetlibero.org'),('Beau','Jones','379-5019 Ut Road','interdum.enim@portaelit.ca');


CREATE TABLE [dbo].[UserCategory]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[Name] NCHAR(50) NULL
)


INSERT INTO UserCategory([Name]) VALUES('Admin'),('SuperAdmin'),('MegaAdmin'),('Default'),('Restricted');

CREATE TABLE [dbo].[User]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	FirstName NCHAR(20) NOT NULL, 
	LastName NCHAR(20) NOT NULL, 
	BirthDate DATE NOT NULL, 
	UserCategoryId INT NOT NULL ,
	ContactId INT NOT NULL,
	CONSTRAINT FK_User_To_UserCategory FOREIGN KEY (UserCategoryId) REFERENCES UserCategory(Id),
	CONSTRAINT FK_User_To_Contact FOREIGN KEY (ContactId) REFERENCES Contact(Id)
)


INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Melinda','Torres','03/30/1960',4,32),('Sybill','Larsen','11/19/1972',1,89),('Conan','Bright','02/08/1940',4,22),('Ruby','Cruz','11/11/2003',5,55),('Wynter','Blankenship','12/05/1970',1,19),('Gary','Ingram','11/19/1999',1,57),('Orson','Cobb','10/28/1954',4,86),('Rahim','Franks','09/19/1942',2,37),('Sydney','Rowe','07/29/1970',4,12),('Cairo','Coffey','11/29/1993',2,20);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Keane','Huffman','10/12/1961',4,39),('September','Valentine','04/01/1984',5,37),('Ignatius','Day','09/18/1964',5,91),('Priscilla','Sargent','12/10/1961',4,74),('Ryan','Barron','02/27/1984',3,14),('Hector','Wright','05/06/1951',5,97),('Fleur','Mccray','04/11/1992',2,70),('Edward','Hamilton','06/11/1981',4,98),('Honorato','Fields','01/14/1957',3,40),('Demetria','Hester','03/28/1973',1,97);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Baker','Perkins','10/31/1967',1,53),('Bethany','Kennedy','11/09/1971',2,77),('Lance','Baldwin','09/13/1989',2,92),('Macy','Copeland','05/23/1989',3,88),('Elaine','Fox','11/08/1988',3,97),('Sonia','Ochoa','11/03/1952',4,18),('Shannon','Travis','12/06/1948',5,12),('Chava','Estes','08/03/1991',1,59),('Renee','Sweet','06/30/1965',4,95),('Rylee','Sutton','10/02/1972',4,7);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Bruno','Leon','05/17/1962',4,53),('Adara','Ryan','08/20/1939',1,28),('Isabella','Mcintosh','12/30/1942',1,42),('Ivor','Bruce','06/04/1986',2,7),('Jasmine','Reese','02/29/2000',1,59),('Keane','Gibbs','11/14/2001',4,19),('Sawyer','Griffith','01/18/1998',1,48),('Yvette','Kinney','08/10/1977',4,80),('Gil','Snider','09/20/1967',4,10),('Brett','Hoffman','04/01/1943',1,33);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Paki','Pace','07/26/1995',2,11),('Samson','Spears','05/10/1968',5,23),('Veda','Rodgers','06/22/1986',1,62),('Ulric','Nelson','06/05/1953',2,87),('Channing','Mcfarland','10/02/1970',3,5),('Eleanor','Humphrey','01/10/1956',2,3),('Yasir','Christensen','12/31/1957',1,19),('Medge','Moon','03/03/1997',4,2),('Mechelle','Powell','04/26/1962',1,49),('Bruce','Cote','11/08/1967',1,15);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Jackson','Ramos','02/09/1976',2,54),('Ivana','Montgomery','10/07/1942',1,6),('Teagan','Stevenson','06/18/1957',5,92),('Leah','Stuart','09/09/2001',2,62),('Celeste','Fisher','12/24/1955',4,22),('Ariana','Ramirez','03/13/1959',4,73),('Adele','Estrada','12/22/1990',4,51),('Nomlanga','Reeves','03/16/1975',5,57),('Ira','Ramsey','07/08/1964',5,72),('Adria','Jackson','04/23/1977',2,14);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Abigail','Brewer','02/16/1993',3,38),('Margaret','Underwood','10/11/1993',3,63),('Christian','Lowe','10/26/1958',5,100),('Ralph','Pearson','09/16/2002',5,91),('Preston','Hicks','10/02/1964',3,54),('Tana','Greer','03/31/1987',5,7),('Hermione','Burgess','01/10/1987',4,36),('Dylan','Chandler','09/06/1949',3,43),('Blythe','Lamb','12/04/1995',2,27),('Kato','Conner','09/25/1945',1,51);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Emery','Rodriquez','12/21/1993',3,82),('Courtney','Bradford','04/09/1989',2,72),('Noble','Cobb','12/31/1948',4,93),('Stella','Burgess','10/07/1962',3,86),('Jaden','Bauer','07/30/1953',5,60),('Abra','Phillips','07/22/1956',2,78),('Aquila','Castro','08/22/1993',3,7),('Addison','Le','05/31/1948',3,63),('Alisa','Patel','07/31/1992',3,69),('Jesse','Church','08/07/1966',5,86);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Carolyn','Ryan','02/12/1946',1,77),('Nero','Wallace','10/28/1980',3,35),('Ezekiel','Cantu','01/13/2003',2,79),('Palmer','Hyde','03/10/1961',2,80),('Orlando','Dunn','10/19/1991',1,76),('Joshua','Burns','09/26/1992',5,77),('Hiram','Wilson','05/23/1966',5,57),('Malachi','Potter','08/17/1939',4,16),('Preston','Donovan','12/09/1997',1,63),('Nathan','Beach','04/11/1970',2,65);
INSERT INTO [User]([FirstName],[LastName],[BirthDate],[UserCategoryId],[ContactId]) VALUES('Hakeem','Cooley','01/22/1993',2,5),('Lester','Butler','07/02/1986',4,38),('Palmer','Collier','12/07/1999',5,74),('Lucian','Nichols','01/12/1954',1,58),('Lillian','Weiss','05/28/1996',1,8),('Reese','Heath','05/04/1960',2,76),('Wade','Hatfield','06/13/1984',4,48),('Keely','Kline','03/13/1971',5,46),('Flynn','Leblanc','07/16/1991',3,52),('Rajah','Quinn','11/16/1984',5,82);

CREATE TABLE [dbo].[Warehouse]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[BookId] INT NOT NULL,  
	[Count] INT NOT NULL,
	[LastUpdated] DATETIME NOT NULL,
	CONSTRAINT FK_Warehouse_To_Book FOREIGN KEY (BookId) REFERENCES [Book](Id)
)

INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(1,7,'03/29/2020'),(2,2,'03/29/2020'),(3,3,'03/29/2020'),(4,7,'03/28/2020'),(5,3,'03/29/2020'),(6,3,'03/28/2020'),(7,2,'03/29/2020'),(8,7,'03/28/2020'),(9,7,'03/28/2020'),(10,4,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(11,2,'03/29/2020'),(12,5,'03/29/2020'),(13,7,'03/29/2020'),(14,3,'03/29/2020'),(15,6,'03/28/2020'),(16,2,'03/29/2020'),(17,7,'03/28/2020'),(18,6,'03/29/2020'),(19,7,'03/29/2020'),(20,7,'03/29/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(21,1,'03/29/2020'),(22,1,'03/29/2020'),(23,3,'03/28/2020'),(24,7,'03/28/2020'),(25,3,'03/28/2020'),(26,2,'03/28/2020'),(27,1,'03/29/2020'),(28,3,'03/29/2020'),(29,1,'03/29/2020'),(30,7,'03/29/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(31,4,'03/29/2020'),(32,6,'03/29/2020'),(33,7,'03/28/2020'),(34,3,'03/28/2020'),(35,4,'03/29/2020'),(36,6,'03/28/2020'),(37,3,'03/29/2020'),(38,4,'03/29/2020'),(39,2,'03/28/2020'),(40,2,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(41,1,'03/28/2020'),(42,5,'03/28/2020'),(43,4,'03/29/2020'),(44,3,'03/28/2020'),(45,4,'03/28/2020'),(46,4,'03/29/2020'),(47,5,'03/28/2020'),(48,5,'03/29/2020'),(49,7,'03/29/2020'),(50,5,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(51,5,'03/29/2020'),(52,3,'03/29/2020'),(53,2,'03/28/2020'),(54,3,'03/29/2020'),(55,2,'03/29/2020'),(56,5,'03/28/2020'),(57,5,'03/29/2020'),(58,2,'03/28/2020'),(59,3,'03/28/2020'),(60,3,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(61,6,'03/28/2020'),(62,3,'03/28/2020'),(63,6,'03/28/2020'),(64,6,'03/29/2020'),(65,7,'03/29/2020'),(66,3,'03/28/2020'),(67,6,'03/28/2020'),(68,3,'03/28/2020'),(69,3,'03/29/2020'),(70,3,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(71,5,'03/28/2020'),(72,7,'03/28/2020'),(73,4,'03/28/2020'),(74,4,'03/28/2020'),(75,4,'03/29/2020'),(76,2,'03/29/2020'),(77,5,'03/29/2020'),(78,7,'03/29/2020'),(79,6,'03/29/2020'),(80,6,'03/29/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(81,5,'03/29/2020'),(82,5,'03/29/2020'),(83,4,'03/29/2020'),(84,3,'03/29/2020'),(85,1,'03/29/2020'),(86,3,'03/29/2020'),(87,3,'03/29/2020'),(88,1,'03/29/2020'),(89,5,'03/29/2020'),(90,4,'03/28/2020');
INSERT INTO Warehouse([BookId],[Count],[LastUpdated]) VALUES(91,7,'03/29/2020'),(92,5,'03/29/2020'),(93,1,'03/29/2020'),(94,3,'03/28/2020'),(95,7,'03/29/2020'),(96,5,'03/28/2020'),(97,4,'03/28/2020'),(98,2,'03/28/2020'),(99,4,'03/29/2020'),(100,3,'03/29/2020');


CREATE TABLE [dbo].[Order]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [BookId] INT NOT NULL,
    [Count] INT NOT NULL, 
    [CustomerId] INT NOT NULL,
	CONSTRAINT FK_Order_to_Customer FOREIGN KEY (CustomerId) REFERENCES [Customer](Id), 
	CONSTRAINt FK_Order_To_Book FOREIGN KEY (BookId) REFERENCES [Book](Id)
)

INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(49,4,7),(3,2,26),(19,1,30),(7,3,15),(41,4,66),(63,2,4),(89,5,79),(18,3,99),(26,5,68),(48,3,49);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(53,4,61),(13,3,52),(17,1,87),(37,4,99),(14,3,46),(49,1,35),(62,4,73),(62,5,9),(75,5,58),(45,1,36);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(37,5,14),(88,1,68),(85,2,77),(85,3,46),(56,5,48),(78,2,1),(32,3,70),(13,4,55),(98,3,65),(9,5,41);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(48,1,84),(72,4,79),(66,4,54),(58,5,51),(23,5,39),(29,5,81),(2,3,19),(95,4,65),(66,5,62),(67,4,73);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(55,5,85),(21,5,84),(41,3,91),(35,5,8),(6,4,10),(59,1,28),(7,2,69),(3,4,77),(47,2,17),(92,4,18);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(96,5,34),(75,3,63),(96,1,57),(34,2,69),(10,3,89),(32,3,17),(78,5,50),(66,2,60),(1,5,35),(68,3,59);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(15,1,16),(1,5,79),(40,4,96),(41,1,44),(14,5,54),(93,1,88),(74,2,72),(47,2,28),(72,4,18),(90,1,8);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(14,3,84),(80,3,34),(96,3,6),(75,3,78),(45,2,78),(76,5,88),(2,5,76),(49,4,2),(4,5,96),(59,3,67);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(2,1,29),(65,1,88),(25,2,99),(41,3,21),(82,5,24),(70,1,60),(16,1,88),(98,4,36),(82,4,31),(45,5,51);
INSERT INTO [Order]([BookId],[Count],[CustomerId]) VALUES(83,1,11),(75,3,21),(69,2,37),(85,1,95),(9,3,80),(24,5,55),(86,3,77),(58,2,44),(19,4,51),(42,4,81);





--Drop table Warehouse;
--Drop table User;
--Drop table UserCategory;
--Drop table Customer;
--Drop table Contact;
--Drop table Book;
--Drop table Author;
--Drop table BookCategory;


-- add stored procedures
GO
CREATE PROCEDURE GenerateBigBookData @count INT AS
While @count > 0 
BEGIN
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('consequat dolor vitae',7,2012,'$16.30',6),('congue a, aliquet',53,1962,'$74.21',1),('Aliquam erat volutpat.',81,2000,'$86.63',8),('Phasellus ornare. Fusce',99,1988,'$47.17',9),('Nunc pulvinar arcu',61,1994,'$80.00',5),('nibh lacinia orci,',44,2005,'$76.58',2),('urna, nec luctus',30,2010,'$33.17',1),('nec ante blandit',30,2005,'$82.81',8),('eu tellus eu',76,2021,'$12.39',8),('fringilla, porttitor vulputate,',38,2016,'$37.75',1);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('libero. Donec consectetuer',18,1959,'$11.99',7),('at, iaculis quis,',2,1985,'$78.50',2),('dictum ultricies ligula.',88,1956,'$41.69',6),('quis accumsan convallis,',78,2002,'$99.00',8),('mi tempor lorem,',18,1958,'$47.68',2),('consequat nec, mollis',61,1994,'$92.59',2),('Quisque ac libero',51,2009,'$9.26',5),('Phasellus fermentum convallis',88,2020,'$26.26',5),('nibh sit amet',7,2019,'$99.78',8),('Mauris vel turpis.',82,1973,'$30.23',2);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('felis eget varius',9,1953,'$19.51',5),('in, tempus eu,',64,2002,'$67.36',4),('lacus. Ut nec',29,1990,'$24.21',1),('dignissim magna a',68,1976,'$2.10',1),('vulputate, nisi sem',92,1980,'$89.09',3),('cursus, diam at',20,1966,'$5.67',8),('cursus et, magna.',33,2019,'$44.97',2),('rutrum. Fusce dolor',30,1956,'$67.04',6),('egestas. Fusce aliquet',24,1967,'$65.93',1),('id, blandit at,',78,1988,'$43.88',4);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('lectus rutrum urna,',39,1998,'$92.00',1),('ultricies adipiscing, enim',80,1988,'$52.92',2),('lorem vitae odio',5,2016,'$25.53',7),('Sed auctor odio',89,1985,'$53.17',5),('habitant morbi tristique',94,2010,'$95.18',2),('cursus non, egestas',2,1956,'$88.82',4),('mattis semper, dui',5,2012,'$88.86',1),('neque sed dictum',15,1981,'$19.66',8),('tellus. Aenean egestas',79,1965,'$95.91',1),('eget, venenatis a,',92,2006,'$10.04',1);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('libero. Proin mi.',42,1989,'$72.51',4),('est. Mauris eu',18,1950,'$47.96',5),('sit amet, faucibus',76,1957,'$31.41',6),('dictum. Proin eget',3,2003,'$64.31',9),('tristique pellentesque, tellus',37,2015,'$13.75',8),('ultricies ornare, elit',51,1986,'$8.26',6),('non sapien molestie',15,2018,'$52.20',1),('montes, nascetur ridiculus',11,2016,'$44.89',1),('vitae velit egestas',1,1992,'$62.31',1),('dolor egestas rhoncus.',36,2014,'$53.78',3);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('mauris sapien, cursus',6,1966,'$94.28',7),('egestas rhoncus. Proin',41,1977,'$96.42',8),('risus. Donec egestas.',80,1951,'$26.10',3),('aliquet, sem ut',69,1961,'$41.66',2),('ut, pellentesque eget,',88,1952,'$55.14',1),('magna a neque.',17,1956,'$76.07',6),('convallis convallis dolor.',14,2014,'$3.56',3),('dapibus quam quis',97,1957,'$94.80',6),('Donec vitae erat',72,2012,'$5.94',4),('magna. Phasellus dolor',52,1952,'$51.68',3);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('erat volutpat. Nulla',51,1967,'$78.48',8),('fringilla cursus purus.',42,1967,'$76.56',1),('quam. Pellentesque habitant',11,1950,'$58.08',7),('ultrices posuere cubilia',82,1956,'$66.75',1),('dui nec urna',34,1950,'$60.13',7),('consectetuer ipsum nunc',6,2012,'$51.78',8),('eu enim. Etiam',65,1987,'$34.54',8),('luctus lobortis. Class',32,1978,'$6.66',4),('mauris ut mi.',8,1991,'$67.17',6),('ornare. Fusce mollis.',13,1955,'$71.88',2);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('interdum. Sed auctor',12,2019,'$31.07',6),('vitae erat vel',53,1961,'$47.44',1),('fermentum risus, at',5,1977,'$86.97',4),('egestas hendrerit neque.',50,1957,'$66.12',7),('Ut tincidunt orci',2,1984,'$95.02',4),('Nunc sollicitudin commodo',14,1966,'$5.12',8),('neque tellus, imperdiet',15,1970,'$49.25',9),('ullamcorper viverra. Maecenas',37,1959,'$24.19',7),('elementum purus, accumsan',33,1975,'$56.35',3),('tincidunt aliquam arcu.',52,2000,'$47.46',8);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('nonummy ipsum non',65,1987,'$92.01',5),('placerat, orci lacus',85,2003,'$50.73',6),('Cras convallis convallis',85,1995,'$9.50',6),('nec, imperdiet nec,',81,2000,'$71.48',4),('Morbi metus. Vivamus',98,1971,'$10.56',4),('Nunc quis arcu',86,2013,'$9.43',6),('Vestibulum ante ipsum',49,1973,'$40.40',7),('aliquet libero. Integer',29,2007,'$43.12',4),('odio. Nam interdum',73,1991,'$80.57',1),('metus facilisis lorem',12,1998,'$78.63',8);
	INSERT INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('felis orci, adipiscing',1,1991,'$39.35',6),('inceptos hymenaeos. Mauris',25,1962,'$33.42',1),('nascetur ridiculus mus.',48,2019,'$73.89',9),('diam eu dolor',80,2002,'$69.84',9),('tellus sem mollis',25,1971,'$94.13',7),('ullamcorper eu, euismod',16,1981,'$1.95',2),('Vivamus molestie dapibus',53,1959,'$27.51',6),('ornare placerat, orci',97,2011,'$97.10',1),('ac turpis egestas.',68,2016,'$35.29',6),('rutrum urna, nec',61,1973,'$48.41',9);
	SET @count = @count - 100;
END



GO
CREATE VIEW ViewWarehouseReport AS
SELECT b.Name AS BookName, bc.Category AS BookCategoryName, CONCAT(RTRIM(a.FirstName), ' ', RTRIM(a.LastName)) AS Author, w.Count AS BookCount
FROM Book AS b 
LEFT JOIN Author AS a ON a.Id = b.AuthorId
LEFT JOIN Warehouse AS w ON w.BookId = b.Id
LEFT JOIN BookCategory AS bc ON  bc.Id = b.CategoryId

insert INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('consequat dolor vitae',7,2012,'$16.30',6)


--DROP TRIGGER Book_INSERT

GO
CREATE TRIGGER Book_INSERT
ON Book
AFTER INSERT
AS
BEGIN
UPDATE Warehouse
SET Count = Count + 1, LastUpdated = GETDATE()
from inserted AS i 
where i.Id = Warehouse.BookId
END;

insert INTO Book([Name],[AuthorId],[EditionYear],[Price],[CategoryId]) VALUES('consequat dolor vitae',7,2012,'$16.30',6)
