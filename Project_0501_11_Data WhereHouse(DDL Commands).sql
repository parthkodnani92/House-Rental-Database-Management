USE BUDT703_Project_0501_11;

BEGIN TRANSACTION;


DROP TABLE IF EXISTS [Review.Write];
DROP TABLE IF EXISTS [Review.Reviewer];
DROP TABLE IF EXISTS [Review.Amenity];
DROP TABLE IF EXISTS [Review.Unit];
DROP TABLE IF EXISTS [Review.Apartment];

CREATE TABLE [Review.Apartment] (
	aptId CHAR(4) NOT NULL,
	aptName VARCHAR(50),
	aptStreet VARCHAR(40),
	aptCity VARCHAR(20),
	aptState CHAR(2),
	aptZipCode CHAR(5),
	CONSTRAINT pk_Department_aptId PRIMARY KEY (aptId) 
);

CREATE TABLE [Review.Unit] (
	unitId CHAR(4) NOT NULL,
	aptId CHAR(4) NOT NULL,
	unitBuilding VARCHAR(10),
	unitFloor VARCHAR(2),
	unitNumber VARCHAR(8),
	unitBeds NUMERIC(2),
	unitBaths NUMERIC(2),
	unitFurnished VARCHAR(70),
	unitRent NUMERIC(6,2),
	CONSTRAINT pk_Unit_unitId_aptId PRIMARY KEY (unitId, aptId),
	CONSTRAINT fk_Unit_aptId FOREIGN KEY (aptId)
		REFERENCES [Review.Apartment] (aptId)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE [Review.Amenity] (
	amenId CHAR(5) NOT NULL,
	aptId CHAR(4) NOT NULL,
	amenElectricity CHAR(1),
	amenGas CHAR(1),
	amenWater CHAR(1),
	amenMaintenance CHAR(1),
	amenGym CHAR(1),
	amenPool CHAR(1),
	amenClub CHAR(1),
	CONSTRAINT pk_Amenity_amenId_aptId PRIMARY KEY (amenId, aptId),
	CONSTRAINT fk_Amenity_aptId FOREIGN KEY (aptId)
		REFERENCES [Review.Apartment] (aptId)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Review.Reviewer] (
	rwerId CHAR(4) NOT NULL,
	rwerName VARCHAR(50),
	CONSTRAINT pk_Reviewer_rwerId PRIMARY KEY (rwerId)
);

CREATE TABLE [Review.Write] (
	revId CHAR(6) NOT NULL,
	revRate NUMERIC(2),
	revContent VARCHAR(2000),
	revDate DATE,
	aptId CHAR(4) NOT NULL,
	rwerId CHAR(4) NOT NULL,
	CONSTRAINT pk_Write_revId PRIMARY KEY (revId),
	CONSTRAINT fk_Write_aptId FOREIGN KEY (aptId)
		REFERENCES [Review.Apartment] (aptId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Write_rwerId FOREIGN KEY (rwerId)
		REFERENCES [Review.Reviewer] (rwerId)
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO [Review.Apartment] VALUES
	('a001','Lync at Alterra','3420 Toledo Terrace',' Hyattsville','MD','20782'),
	('a002','Verde at Greenbelt Station','8010 Greenbelt Station Pkwy','Greenbelt','MD','20770'),
	('a003','Vie Towers','6515 Belcrest Rd','Hyattsville','MD','20782'),
	('a004','Seven Springs Apartments','9310 Cherry Hill Road',' College Park','MD','20740'),
	('a005','Camden College Park','9600 Milestone Wy',' College Park','MD','20740'),
	('a006','Westchester Tower Apartments','6200 Westchester Park Drive',' College Park','MD','20740')

INSERT INTO [Review.Unit] VALUES
	('u001','a001','3420','3','324',1,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner',1684),
	('u002','a001','3420','1','c41',1,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner, Balcony',1807),
	('u003','a001','3420','4','442',2,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner, Balcony',2520),
	('u004','a001','3420','3','302',3,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner, Balcony',2790),
	('u005','a001','3420','2','243',2,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner, Balcony',2255),
	('u001','a002','8000','1','114',1,1,'Air Conditioning, Fireplace,Washer/Dryer,Balcony',1740),
	('u002','a002','8010','1','124',1,1,'Air Conditioning, Fireplace,Washer/Dryer,Balcony',1745),
	('u003','a002','8010','3','312',2,2,'Air Conditioning, Fireplace,Washer/Dryer,Balcony',2245),
	('u004','a002','8000','4','417',2,2,'Air Conditioning, Fireplace,Washer/Dryer,Balcony',2415),
	('u005','a002','8020','2','204',2,2,'Air Conditioning, Fireplace,Washer/Dryer,Balcony',2220),
	('u001','a003','6515','2','223',2,2,'Washer, Dryer, appliances and internet',2538),
	('u002','a003','6515','3','315',2,2,'Washer, Dryer, appliances and internet',3198),
	('u003','a003','6515','1','103',3,3,'Washer, Dryer, appliances and internet',4350),
	('u004','a003','6515','3','305',4,4,'Washer, Dryer, appliances and internet',4556),
	('u001','a004','9310','2','314217',0,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1265),
	('u002','a004','9310','3','314318',1,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1435),
	('u003','a004','9310','6','314607',2,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1710),
	('u004','a004','9310','6','314609',3,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',2175),
	('u001','a005','9600','2','2015',1,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1699),
	('u002','a005','9600','2','2093',2,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1902),
	('u001','a006','6200','6','1608',0,1,'Washer, Dryer, appliances and internet',1739),
	('u002','a006','6200','7','1710',1,1,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',2019),
	('u003','a006','6200','8','1815',2,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',1988),
	('u004','a006','6200','2','1812',3,2,'Full-size Washer/Dryer In Unit,Heat, Air Conditioner,Balcony',2099)


INSERT INTO [Review.Amenity] VALUES
	('am001','a001','Y','N','Y','N','Y','Y','Y'),
	('am002','a002','Y','N','Y','N','Y','Y','Y'),
	('am003','a003','Y','N','Y','N','Y','Y','Y'),
	('am004','a004','Y','Y','Y','N','Y','Y','Y'),
	('am005','a005','N','N','N','Y','Y','Y','Y'),
	('am006','a006','N','N','N','N','N','N','N')

INSERT INTO [Review.Reviewer] VALUES
	('r001','Abdul Adil'),
	('r002','Angelica Johnson'),
	('r003','Mia Aldridge'),
	('r004','hassan osumah'),
	('r005','David Merrifield'),
	('r006','Abigail B'),
	('r007','Dickey Comeaux'),
	('r008','Desmond Goodloe'),
	('r009','A Peete'),
	('r010','Evan Bray'),
	('r011','Avery H'),
	('r012','Brandon Camille'),
	('r013','Imt4poem'),
	('r014','D. Whitney'),
	('r015','Tashena Maxwell'),
	('r016','Darcella Lopez'),
	('r017','RMT'),
	('r018','Ratyana Downing'),
	('r019','nadiah alyamni'),
	('r020','Katrina Rogers'),
	('r021','Yang Fu'),
	('r022','jennifer torres'),
	('r023','Sylvia Ratliff'),
	('r024','Angela Barnes'),
	('r025','Cassandra Duncan'),
	('r026','Shanash DanielSever'),
	('r027','Nik Tramel'),
	('r028','Chen Peter'),
	('r029','Chensheng Wu'),
	('r030','Cuiyin Wu'),
	('r031','Marina Ni'),
	('r032','Sylvester Okere'),
	('r033','Karisha Harvey'),
	('r034','Keisha Gilmore'),
	('r035','Maria Faizan'),
	('r036','Beth Jackelen'),
	('r037','John Barnhardt'),
	('r038','Anthony Spriggs'),
	('r039','Shuman Li'),
	('r040','Jen E'),
	('r041','Makailah Gause'),
	('r042','Paulette'),
	('r043','Hadiya Presswood'),
	('r044','Jielle Denton'),
	('r045','Aiyasia Peoples'),
	('r046','Choonoomoonoo X.D.'),
	('r047','Child Of God'),
	('r048','Nia Larry'),
	('r049','Lasha-Lee Wilson'),
	('r050','Jasmine H'),
	('r051','belikethat.'),
	('r052','Jamar Jasper'),
	('r053','Katherine Osere'),
	('r054','Khadi Akins'),
	('r055','Tayler Christian'),
	('r056','Joshua Davis'),
	('r057','Mariah Cooley'),
	('r058','Jasmine Nuo'),
	('r059','Darin Clowden'),
	('r060','Leiny Carranza'),
	('r061','John Hall'),
	('r062','Sam Smith'),
	('r063','Raynette Scoggins'),
	('r064','J Walk'),
	('r065','Life Changing'),
	('r066','Barbara Boone'),
	('r067','JaLena Jackson'),
	('r068','deborah henson'),
	('r069','Rocky'),
	('r070','akinade akinmide'),
	('r071','N Holmes'),
	('r072','First Last'),
	('r073','Kitty Meow')

INSERT INTO [Review.Write] VALUES
	('rev001',5,'This is the best apartment I have lived-in for reasons below. 1. Responsive management. 2. Clean hallways and amenities. I have toured multiple luxury apartments before moving here, all expect this apartment had weed smell in hallways during my tour. Since my last month move-in, I did not smell any weed or smoke in hallways or garage. 3. Quick maintenance response. 4. Apartment is brand new and and I love they have exhaust fan in the kitchen which exhaust air out of building, instead of recirculating with-in kitchen. 5. They had special move-in offer.','06/02/21','a001','r001'),
	('rev002',2,'I’m leaving 2 stars for the amenities and the beautiful units. The leasing office staff, including management, are unprofessional. I have had numerous issues from application to move-out charges.  Many staff members lack knowledge about Maryland’s landlord-tenant laws. I have had particularly negative experiences with the new assistant manager, Indu. She is unprofessional, rude, and incompetent.','10/30/21','a001','r002'),
	('rev003',1,'One star is very generous! I am a current resident and have been battling with the leasing office on multiple occasions for multiple issues that could easily be resolved. My car has been towed when I parked in my assigned spot and paid my rent and dues on time. The leasing office has denied the residents access to the beautiful amenities on multiple occasions with no explanation and there is VERY VERY minimal guest parking.They are now charging hundreds of dollars to use some of the common spaces, leaving us with no spots to entertain our guests. Despite their close regulations with the common areas they can not seem to control the hallways from smelling like cigarettes and weed on a daily basis despite that being their main selling point of this being a non smoking building!!  I am extremely disappointed and held this management company to a higher standard than they deserve.','11/02/21','a001','r003'),
	('rev004',5,'I am extremely happy with my move-in experience at Lync at Alterra. The manager,  Saybah kolako, was very professional and respectful. She especially ensured my move in process was comfortable and easy. She listened to my wants and concerns and followed up swiftly. As far as the building, it is well maintained. Nicely decorated and has great amenities. I often do not leave a review but my experience has been soo great thus far, I had to share with the public. Thanks Saybah you and your team are doing a great job.','09/09/21','a001','r004'),
	('rev005',5,'This review is for the management and staff at Lync at Alterra.  We moved into the building just over two weeks ago, and the management has been very helpful in assisting with a few problems we have had.  They made themselves available, listened to our concerns, and provided concrete solutions.  Furthermore, they made us feel very comfortable in expressing our concerns, and indicated a willingness to accept feedback (positive or negative).  Simply being so attentive to our issues made us feel better, and  we very much appreciate their desire to make this a building where the residents feel safe, comfortable, and at home.','04/21/21','a001','r005'),
	('rev006',5,'I have lived here for almost 3 months now and it has been a great experience thus far. I went through a some challenges with my application but Nadine was nothing short of amazing! She went ABOVE AND BEYOND to help me with everything. Nadine is a wonderful lady and very warm. She will do her best and more to provide all the help you need with applying, moving in and even after that. Thanks Nadine!  I love the community so far . Beautiful with lots of amenities. I especially love the library and gym. I hope to keep enjoying my stay here at Lync.','08/22/20','a001','r006'),
	('rev007',2,'I want to start off by saying the apartments look amazing!!! The amenities are heavenly. I wanted to tour a few apartments, as they were offering self guided tours, supper convenient during these times. I called to schedule a tour, but could not get through. I tired over a few days and could not get a response. After no answer, I decided to drive over to see if I could get in and see an apartment. I arrived and used the call box to gain access to the building and got no response. Makes sense, it is probably the same one I was calling. Luckily, I could see the a few members of the office staff, so I waved over to get access. Waited about 15 mins in the call box room to see the place. They were rude to me and a current resident. talked with 4 residents along my tour who all confirmed that management was awful, but the community looked nice and was well kept.','01/05/20','a001','r007'),
	('rev008',5,'At the Lync at Alterra, the costumer service was excellent. Saybah Kolako and Nadie Makala were friendly, helpful and professional. The building is a very nice and clean building. I highly recommend this building!','06/11/21','a001','r008'),
	('rev009',1,'Beautiful apartment community, BUT... my upstairs neighbors are very loud. To the point, I hear them walking/stomping and chairs screeching consistently. I know when they wake up in the morning and come home in the afternoon. I’ve formally notified the leasing office and nothing has changed. If you’re looking for a quiet community with little to no disturbances, I would recommend another place to call home. It’s unfortunate that I’m having such a negative experience in a beautiful community.','05/19/20','a001','r009'),
	('rev010',5,'I have been living here for about a year now and just decided to check reviews on a whim. I am genuinely shocked at the fraction of upset reviewers (even though a 50/50 split between 1-star and 5-star reviews is pretty standard for EVERY apartment complex...) I will address some of the major concerns I saw from others below: -Staff: I have had nothing but 5-star experiences with the staff (front office, concierge, and maintenance). On several occasions they have helped me with things that would not normally fall under their job description and have been wonderfully professional in every way. Occasionally there will be emails/notices with obvious typos or grammatical errors, but it is nothing to lose your head over. -Noise: The building went up in 2018. The walls are thick and heavy. Upset at hearing your upstairs neighbor walk around or watch a movie at a reasonable time on a Friday night? Deal with it, that is a part of living in a multi-family residence. Neighbor having a rave at 2am on a Tuesday? Complain, and management sends out a stern mass-email the next day reminding everyone to be mindful or face consequences. -"The staff lied to me about the lease": Not explaining something is not lying, and it is not their job to explain every sentence of a standard 20-page lease. Read what you are signing. If you have a question, they will happily explain. -Parking garage safety: I drive to work every day, and have been for the duration of my stay here. There are security cameras in the parking garage and I have never once seen a car with its wheels missing/windows broken. Nor has my car ever been towed wrongfully from its designated spot.','09/10/21','a001','r010'),
	('rev011',5,'The place is QUIET and the residents are really friendly. The entire Office staff is super professional, prompt in response & accommodating....yes...EVEN DURING A PANDEMIC. The concierge does a great job with packaging and is always providing great customer service to each person that passes by. Move in was a breeze & they give you a really cool goody bag! Secure in the building. Once you are in you are in! all keys are computerized. Parking is $100 on top of your rent but ask about specials, they have move in specials that are advertised on their site so look into that. I Love it here.. Come live the #LyncLife','11/01/20','a001','r011'),
	('rev012',1,'While I do enjoy living here, I figured I would be able to escape the reported issues with the leasing office as long as I simply paid my rent on time. My biggest issues have been with a young lady named Nadine who currently handles a large portion of the lease signings. My advice is to get EVERY SINGLE DETAIL that you discuss with her written in email or else she WILL LIE and management will take her side despite a history of lying. I promise that it is a risk not worth taking, I would not say that you should never live here, but make sure you get everything you speak about in email or they will straight up lie to you about major details and act like the conversation never happened. This leasing office is terrible with their tenants however, the complex is very nice. I am sure they will respond here with some BS making it seem like they actually care, but that is all cap, I promise you.','08/22/20','a001','r012'),
	('rev013',5,'I have been living here for more than one year.This is one of the best place to live in.The management is very responsive and professional especially Saybah.For maintenance there are very prompt and even exceeds my expectations.I have referred more than two persons to this apartment and they love it so far','04/23/20','a001','r013'),
	('rev014',5,'Nadine is simply amazing.  Be sure to speak with her if you want the best consultant.','05/25/20','a001','r014'),
	('rev015',5,'Thanks to Nadine I fell completely in love with this place. This was our last stop on our apartment hunt and this place made me forget completely about the others. Very clean and updated, the amenities are absolutely amazing. As college student myself I was personally touched by the inclusion of a study room. I think it’s an amazing place and I am really looking forward to living here pending availability in a few months.','10/24/20','a001','r015'),
	('rev016',5,'This is a beautiful community with all the amenities that you could ever want!! The maintenance staff is very professional, prompt and courteous. The office staff is managed by Saybah Kolako who is always nice and pleasant and she always greets everyone with a smile. I was new to area and she made me feel welcome. Thank you again Ms. Saybah and your excellent staff for making me feel welcomed!!!','08/30/20','a001','r016'),
	('rev017',1,'Was considering this property, and even went as far as applying and getting approved, but ultimately decided to move somewhere else after dealing with the horrible management while attempting to coordinate a lease. Specifically a leasing agent named Nadine was the biggest headache. She was very rude and condescending, and delivered poor customer service that completely turned me off. No wonder this nice place is offering all this free stuff to move in...','11/12/20','a001','r017'),
	('rev018',1,'I wish I could give 0 stars, and I hate to complain. I truly do, please do not move here. They will smile in your face to make you sign your lease but they are so rude and condescending. One of my guests was asked what she had in her bag also what was going on in my apartment. I run a legal business where i provide a service and have had at least 10 people complaining about the service up front. The property is beautiful but not worth the trouble.','06/01/20','a001','r018'),
	('rev019',5,'I am only giving 5 stars only to Marla Hammond she is very welcoming and kind. I wish she was the senior manager. Best one and most professional MARLAAA','01/23/20','a001','r019'),
	('rev020',1,'If you care about customer service or accountability....DO NOT MOVE HERE! The management team is very unprofessional and not helpful at all. The place is gorgeous, but the management ruins the excitement of a newly built complex. I applied to live here and shortly after contacted the office to let them know that I applied and was looking to move-in in the next 5 days. I was pre-approved same day. Long story short, Diamond did not process my application, gave me an apartment that was unavailable and when contacting the management team, they were more concerned with telling me their staff did the right thing than resolving the issue, which was failure to process my application prior to my move-in date and giving me an apartment that was unavailable. I even spoke with the manager of the apartment she continued to say her staff did not do anything wrong and I failed to provide proper documentation. I sent her all the emails showing when I sent in the information, then she proceed to tell me that my official offer letter has to have two signatures on it. I questioned why, she wourld not answer, then I asked her to confirm what she stated and her response was can she call me back in an hour. She called back 7 hours later. Never apologizing or admitting what they had done wrong. She did not even acknowledge the mishap at all. Btw my moving company was on site and I took off work to move in. I reached out to eh regional manager as well no answer or response to my email.','02/15/20','a001','r020'),
	('rev021',5,'Nice apartment to live in! The neighbor is beautiful. The apartment has free parking for residence which is very convenience. The apartment has great lobby with comfortable meeting places and excellent gyms. The leasing apartment try the best to assist the need of the residences. It is a good experience of living at Verde.','11/05/21','a002','r021'),
	('rev022',1,'I lived at Verde for 6 months and during my first move out inspection I was told that nothing was wrong with the apartment and that the carpet which was dirty  would be replaced when I moved out.  A month later I am being charged $1600.00 for a carpet replacement which I was not financially prepared for specially during these trying times. I honesty thought they would take in consideration that there only one small area where the carpet was dirty as I was explained at the pre inspection move out walk through. The only thing I can say is great about living here is that Amy which is an employee at Verde went above and beyond for her residents.','08/23/21','a002','r022'),
	('rev023',5,'I have been living at Verde for over 4 years.  I LOVE IT HERE!  The covered parking space on my floor is wonderful.  Most of what I need on a regular basis is on one floor and in my unit, like the stacked washer/dryer.  I love the space in my unit. I wish there were  more closets and a third bedroom, though. I would move into one of those! units!  The neighborhood is quiet, clean and I feel safe. I really enjoy the Verde parties, even when they are virtual.  Leasing Center staff makes sure the parties are fun and entertaining.  There is always good food, too!  It is nice to meet people that live in other buildings or finding out that someone lives above or below you. Maintenance staff is courteous and responsive to my needs.  Having a GYM and AMAZON HUB on site is AWESOME!!   Having a trash collection service 5 days a week  at my door is very convenient! This neighborhood is near great shopping and restaurants, parks, hiking/biking trails and lots of nature.','04/10/21','a002','r023'),
	('rev024',5,'Today is my one year anniversary here at the Verde Greenbelt. I love the staff and the amenities here. I do not drive so the location is perfect for myself with the near by Beltway Plaza Mall and shopping center where I get my groceries. I love the way the apartment is designed and it is a very quiet community. I love it here so much that I decided to renew my lease for another year. I am so happy about my apartment home.','04/22/21','a002','r024'),
	('rev025',4,'Verde at Greenbelt Station is a great place to live. My daughter and I feel safe and it is really quiet. If you are thinking a beautiful and safe place to live, reach out to the leasing office. Tina K. is awesome!','04/02/21','a002','r025'),
	('rev026',4,'We have lived at Verde for four years and it was a home for us. Yes, we have seen the differences between when we first moved in and when we moved out. At first, the leasing office and management was very responsive but then it slowed down. The maintenance team is fabulous and the lady, Tina who works in the leasing team is also awesome. I hope the company recognizes how hard Tina and the maintenance team works. I’d recommend anyone living at Verde.','03/30/21','a002','r026'),
	('rev027',4,'Beautiful, welcoming, and generally well-run apartment complex. I understand that covid has changed access to amenities, but I wish that we had access to the pool table at all and that the gym was available after office hours. Residents pay to use these amenities, so they should be available. Also wish that there was easier access to the metro, such as shuttle service.','05/01/21','a002','r027'),
	('rev028',5,'Nice apartment with beautiful neighborhood!','11/03/21','a002','r028'),
	('rev029',5,'My family moved in Verde since its opening and it has been 4 years now! What I like about this place are: 1. The apartment complex sits in a nice townhome community and is well maintained by a professional team. It has many security cameras around the property and electronic keys for entering the building. We feel safe all the time. 2. The location is unique, almost close to everything we need, shopping center, university, urgent care, lake, and the metro. I would say this location is a top choice for young professionals. 3. Staff is very friendly and willing to help. Tina is exceptionally good in management and solving resident issues. Tina is our go-to person whenever we have questions regarding the property. Others are very helpful too. Michael is impressive in his swiftness fixing things. The team hosts games and special festivals for Verde residents a few times a year. 4. Each room is spacious and the ceilings are high (about half meter higher than normal homes), this provides better lighting conditions. The two bedrooms have two walk-in closet and two additional closet for storage. The living area is very generous for the price. 5. The apartment has high energy efficiency, my average electric bill is ~$50 for a 2 bedroom and gas ~$30 given that I use the dishwasher and washer/dryer frequently and WFH during the pandemic. 6. No insect problem so far. What I wish would be better are: 1. Visitor parking is very limited and the community only allows for no-permit parking along its two main roads. 2. The ceilings are not as soundproof as the side walls. 3. Someone occasionally smokes inside the building and leaves bad smell in public area. 4. The community has only 1 lane in and 1 lane out, and sometimes traffic can cause delays up to a few minutes.','05/10/21','a002','r029'),
	('rev030',5,'We moved in 2017 and live there till now. We lived at other places before on Route 1 who treated you like king when they tried to convince you to move in but not so much when you need their help. Verde is nothing like that. They host party at least once per year and they would really investigate who is smoking and send letters out. The property manager is patient and nice as long as you pay your rent on time and cause no trouble. Maintenance folks always come on time and fix things for you (they also cos Santa for Christmas lol). The entire management team should get a raise because they are awesome! The only thing to complain is that we know exactly when the people upstairs wake up, when goes to sleep. The sound proof from the ceiling is not great but there is no much you can do about it.','05/22/21','a002','r030'),
	('rev031',2,'I am a future residents. This place looks nice and safe. However, one thing I completely cannot understand is that office has a huge hesitation to send me lease after I submitted all the legal documents they need.(they received everything a week ago ) I asked the lady whether there is something wrong with my application, she said everything is fine. And I asked her about when I can get my lease, she said "not sure".  This kinds of behavior give me so much frustration, which gives a feeling this place is a scam lol. In every normal procedure  , landlord should provide lease immediately right after tenant submit the documents, or, even provide the lease before the documents. This place to trying to give you the lease right before you move in. The lease is the only legal documents to guarantee the deals you made with office. Two starts is how much frustration this place gave me so far. Really hope my mind can be changed later','06/12/21','a002','r031'),
	('rev032',5,'I love the community! It is convenient, conducive and calm environment to live. Smoke-free building, historic park, Greenbelt metro, secure garage parking, a walk to mall. The staff at VERDE are very kind and professional. Prior to moving into VERDE, I experienced outstanding customer services by Aminatu "Amy" Conteh.','04/30/21','a002','r032'),
	('rev033',1,'I don’t live here but I’ve been trying to lease. The leasing office is the laziest I’ve ever seen. We applied over a week ago and still haven’t heard anything. Any time I call to inquire about our application, I always get “don’t call us, we’ll call you”. If they’re like this at the leasing stage, I shudder to think about how they treat their residents. This place is already a nightmare.','07/16/21','a002','r033'),
	('rev034',5,'I recently put in my notice at my current complex and started researching apartments in the Greenbelt area. I came across Verde and scheduled a tour. The property was very accommodating and the customer service was top notch. I felt comfortable with their current safety measures and their cleanliness. The apartments were also really beautiful. The staff made me feel like I was already home- will definitely be putting in an application.','10/12/20','a002','r034'),
	('rev035',5,'This is my 3rd year started and I have a best experience living here.100%mentally satisfaction.All the management Sally,Tina,Emmi and Mentence doing gre8 job.we feel them like a family.never have a problem living here.thanks Verde.keep it up.','03/28/21','a002','r035'),
	('rev036',4,'The Verde is located in a community of Condo and Townhomes.  It has plenty of walking areas, plus a wonderful nature trail to walk as well.  Their service to residents (work orders, etc) has been quick, thorough and friendly.  They have complied with all Covid protocols as well. We completely enjoy our balcony space along with a fireplace during the winter. The space we have, two bedrooms plus a loft space is just perfect for our needs. The one item I would like them to improve upon is some of the appliances.  I would appreciate a kitchen faucet that has a sprayer, plus a flat cook top.The electric burners are not even, so they do not alway cook evenly.  Their claim is luxury living, but some of the appliances are not luxury.  Overall, The Verde at Greenbelt Station is a wonderful place to hang our hat:)','05/28/21','a002','r036'),
	('rev037',5,'Fantastic apartment complex! The front office team is organized and communicative. The building is very clean, grounds are well kept, and residents very warm and helpful. I would recommend this apartment complex to anyone.','09/29/20','a002','r037'),
	('rev038',5,'I have been at Verde for about 3 months. Love it so far! Quiet, safe and professional staff. Neighbors are give and take. Some speak some does not. A lot of them seem to complain about every little thing they can but this community is the best I came across during my home search. Could not be more happy with my decision. I hope this will be the last place I rent until I am ready to own.','01/14/21','a002','r038'),
	('rev039',5,'Great place to live. The staff here are nice and responsible. The maintenance team are professional and always ready to help.','08/23/20','a002','r039'),
	('rev040',1,'I usually do not make these, but after the horrible experience I have had I feel that I would have liked someone to have told me that: this place is not only unprofessional as they take forever to answer to emails, but they do not communicate clearly every charge. It took 2 months to get a refund and I had to keep insisting with a lot of emails, and text messages. Then the amount that was said was off, unfortunately I do not have proof as it was by a phone call that they relied the information. What may be worse is that the last person I spoke to was a female and they kept insisting that it was another male according to there records, and that they were sure that this information about paying this charge for subleasing was told to me. Not only were they dismissive, but I can swear that this information was never in any form communicated with me. I took notes during this call but I wish I would have done it by email because according to them I am lying or did on hear correctly. Yes this place seems great and the price is comfortable but do not be fooled. I regret not listening to the comments before this experience,  I would not recommend this place to any one. Stay away if you can, and keep records because they really only want your money.','10/29/21','a003','r040'),
	('rev041',1,'Unsafe living conditions. Maintenance worker yelled at me for reporting him after he walked into my apartment and was disrespectful.  colleagues only told me about how he is a “nice” person instead of comforting me for feeling unsafe','10/25/21','a003','r041'),
	('rev042',5,'We are thrilled to have our son at Vie Towers! The entire process from inquiry to move in was seamless. Everyone was so nice, professional and welcoming! The apartments are fantastic, the location is excellent and we are very happy the building has 24 hour security. Exceeded our expectations!','09/19/21','a003','r042'),
	('rev043',5,'I had a good experience moving into Vie Towers. Philip gave a nice tour of the property and helped me get settled. I had an issue with my bathroom and he called maintenance for me right away, and the maintenance man came to fix it soon after. So far, everything has been pleasant.','06/14/21','a003','r043'),
	('rev044',1,'Personally, living at Vie Towers and having it be my first apartment, I wouldn’t recommend it to anyone else. The mailroom is a mess and definitely needs more than just 1 worker at a time. I understand that it’s not his fault, but that of management because they are the ones responsible for making sure everything runs smoothly. As of late, the electric bill has been insanely high which doesn’t make sense because we now have one less roommate but it has nearly tripled since. Vie never has a clear answer when we ask about our electric bill and there’s no itemized list for us to look at. There’s no reason why we went from paying $12 each to $50+. Some of my friends are paying $91 (this is a 4 person suite which means $300+ for their unit). Lastly, the $300 transfer fee has not only affected me, but my friend who believes their living situation is taking a toll on their mental and emotional health and would like to switch units. Vie told both of us that this fee is so they can clean it before we move in, however, as they are essentially playing the role of a landlord, it is their job to prepare housing for tenants to move into. Why should we pay to clean the room when it should be expected that the room isn’t going to be vacant forever and it should be cleaned anyway. There’s no reason why we should be paying a transfer fee in a pandemic. This place has no heart and the people who run it are extremely money hungry and take advantage of the fact that we’re college students with little options of where to live.','04/22/21','a003','r044'),
	('rev045',1,'Please find elsewhere. They are money grabbers and do not care about the residents (which was clear during the pandemic). Plus the housing kept having problems and was not worth the money.','07/19/21','a003','r045'),
	('rev046',1,'Horribly unprofessional management (Melanie). She actively attempts to avoid interacting with us when we have a complaint or a question. Aside from her, the apartment building has external contracts for many things including maintenance and painting and dont seem to do their research on who they hire, so the jobs never get done. THE BUILDING ALSO TRIED to charge me for work that they never completed and that i never requested that they do.','09/01/21','a003','r046'),
	('rev047',4,'I am happy to report I was able to speak and work with the office manager, Melanie Harvey, to resolve issues with the ledger of the resident portal as well as unsubstantiated billing after my daughter move out. Melanie was extremely professional, immediately corrected the invoice, and admitted there are areas of opportunity she is trying to work through with her staff and accounting. My daughter was charged for cleaning expenses as the result of another tenant that moved out AFTER my daughter. My daughter was released from the cleaning bill because we took pictures of all the areas we cared for upon the move-out (pics of floors, inside cabinets, wall space, closets, tub, counter tops ,etc).  My advise to young people, is CYA (cover your a..) this can be done by keeping good records of your payments, document conversations (i.e. followup phone conversations with emails), and take detailed pictures when you leave the unit.  This will eliminate headaches and difficult conversations later.  I will say outside of the administrative issues, my daughter truly enjoyed her stay at Vie Towers.','08/06/21','a003','r047'),
	('rev048',1,'I did not have the best experience here at Vie Towers. Save your money (because that’s all they want) and move somewhere else that actually cares about your stay and not draining your pockets.','08/23/21','a003','r048'),
	('rev049',1,'If I could leave this place negative 1000 stars I would. Just as someone said in the other reviews the management is money hungry and the staff does not care about the residents. The security guard was rarely there which put many residents at risk. My apartment flooded not once but TWICE and ruined some of my things that management refused to address. The heat generator is so loud and broke down causing the bathrooms and rooms of 2/4 units to flood. Im not sure what management does with the money except put it in their pockets and pay security guards to let anyone in. After you move out they charge you a massive bill for PAINT which they already had stacked up in the hallways when you first moved in. My fellow Bison use this place as your last last last last last last resort. You are better off paying a little extra than stay in this horrible establishment. It is poorly run by incompetent people.','09/10/21','a003','r049'),
	('rev050',5,'If you are looking for a great place to live it is definitely Vie Towers. The amenities are amazing! Although the roof top pool is closed for the season , it is definitely the wow factor for the property. The staff is super friendly and severity is very helpful.','02/24/21','a003','r050'),
	('rev051',5,'Vie Towers is absolutely amazing!! I love living here! It is so close to everything I need and my commute to UMD is very short, 10 minutes max! Would definitely recommend to friends!','04/30/21','a003','r051'),
	('rev052',5,'The maintenance crew came in and fixed my washer plus the kitchen sink. The washer was completely broken so they had to haul it out and bring in a new one. They were pleasant the whole time and didn’t just barge in. Pus they were funny.','05/06/21','a003','r052'),
	('rev053',5,'I’ve been living here for 6mos now and I’ve had nothing but a delightful experience! I’m surrounded by all my friends and mimics the collegiate housing vibe. With covid it makes social life a bit harder, but with staff like Malia, they create really cool events for us to socialize!','01/20/21','a003','r053'),
	('rev054',2,'I would not recommend this place, I made several complaints and they did nit make repairs or update accounts, they are fraudulent.','10/09/21','a003','r054'),
	('rev055',5,'Vie towers was so clean when I recently went. They take extra measures to make sure all their residents are safe and healthy during lockdown!','04/07/21','a003','r055'),
	('rev056',5,'My blinds were not rotating anymore, and Derrick the maintenance guy was able to help me out and replace my blinds quick and easy.','05/02/21','a003','r056'),
	('rev057',5,'My roommates and I just moved in and we’ve had the best experience possible. They were very helpful during the entire moving process and gave us brand new furniture and appliances. Overall we couldn’t be more happy with VIE, thanks Priscilla!!!','01/19/21','a003','r057'),
	('rev058',2,'Leasing office and staff are really nice! Everything else is horrid!! Property manager (Melanie Harvey) is rude and not professional at all, there are roaches EVERYWHERE, everything breaks or just never worked in the first place. When you move in for the first few days, everything is sweet. But don’t let them fool you. I wish I could find someone to take over this lease because this place is trash and NOT worth the money spent on rent. Do yourself a favor and find a BETTER place. Any where else is better.','02/13/21','a003','r058'),
	('rev059',5,'I love being here. This is my home. I love all my neighbors. It reminds me of New York. I wish Ross would give incentives to the residents who take part in trying to improve our community. Maybe a couple of months of free rent would be nice. It would inspire residents to care for the community more just like myself. Thank you all for making this place a really great place to live. I pray that I will remain here until I get my first home','10/20/2021','a004','r059'),
	('rev060',1,'I have one complaint and it’s a serious one. They usually cut the a/c off way too early! I understand utilities are included but to have your residents in extremely hot apartments is torture!! Today is 84 degrees and it’s going to be extremely hot all week, this is not a safe living environment. No matter how many fans you have the home is always uncomfortably hot. If you have kids please stay away from here, they don’t deserve to live under these conditions. I will be reaching out to the county in regards to this and hopefully get a resolution','10/15/2021','a004','r060'),
	('rev061',5,'Community is in a great location, close to shopping, public transportation, the interstate and lots of great food options. Community is quiet and a great affordable rate for the area. The area and community is very diverse.','10/16/2021','a004','r061'),
	('rev062',1,'You guys messed with the wrong client will have this seven springs down to 1.5 stars and city contacting ross management. This apartment complex is a big safety hazard for people. They want you to wear a mask in the leasing office but have mice/roaches in every apartment. I know 3 people who live in this complex and all have cockroach or mice issues. I tried to be calm and work with you guys. you guys offer no solutions only excuses. DO NOT LIVE HERE! Save yourself the extra 100$ and move somewhere cleaner. There is holes all over my kitchen I had to purchase my own foam to seal up the holes and still having mice issues.','9/15/2021','a004','r062'),
	('rev063',1,'Typical Ross Management. I received this Apartment thread because I am in the market for a new apartment.When I found out Ross Management was the Management Company, why was I not surprised? They used to manage the property I live on now and they did a very poor job there too. We had a descent apartment rating before they took over and when they got fired, we now have a 1.9 rating. To say, the management company we have now is not that much better, but they walked into a mess after Ross Management was there, so I give them some grace. -Tenants, thank you for being honest about your reviews. Property Managers do not realizie prospective tenants take these reviews seriously. -On to the next...','9/16/2021','a004','r063'),
	('rev064',5,'I just received the most amazing customer service experience from Angel at Camden College! I walked into the leasing office worried about my options and with a few questions regarding my residency status - Angel took time to listen and clearly explain Camden’s policies to me. It’s rare to find an apartment rep with her skill set and an entire office of welcoming and caring staff. Go Angel!','10/15/2021','a005','r064'),
	('rev065',5,'I just joined in Camden College Park, I love the Excellent Amenities, had a few questions and regarding maintenance and they were Quick to respond. Well Organized, Jorge Ortiz Assistant Manager is very professional for service of the tenants and their needs. Also, the other staff members such as Angel and Kiyanna the Leasing Consultants are quick and responsive for any needs of the Camden community. I appreciate Camden Staffing and their service to the community it has all my needs Outstanding, Hospitality, Professional and Values are Excellent in Camden. you can stop by and they are more than willing to help. I have had no problems with missing or stolen packages or anything else like other residents on Yelp. Overall, the experience has been great and if I do not find a house to buy, I plan on renewing another year or so. Finally, I love Camden College Park. Awesome.','8/15/2021','a005','r065'),
	('rev066',5,'I looked at an apartment in college park and was very pleased with the amenities. Angel was very helpful and answered all my questions. I look forward to joining this apartment community.','10/15/2021','a005','r066'),
	('rev067',5,'Kiyanna made my FaceTime tour feel so personable as if I was there in person. I’ve been looking virtually for apartments for a while but this was by far my best tour!! Sad that I will no longer be relocating to the area. But happy Kiyanna was knowledgeable about other Camden communities in Florida. If my job assignment changes, this community is at the top of my list!!','10/20/2021','a005','r067'),
	('rev068',5,'Hello, I would like to share my experience with Adonis Arias. He is one of the people that helps keep everything running. He is always polite and always keeps in touch to let me know the progress of things that needs fixing . I feel comfortable knowing he is the one taking care of things. Thanks for all do','6/15/2021','a005','r068'),
	('rev069',1,'This apartment is bullshxt! dont ever choose it! Update 8/10/2018: The leasing manager called me again, and her attitude was extremely terrible after I said please keep calling the host for the rest of the payment. Update 04/25/2018: After the manager reached me, I felt disgusted, one of the employee said :" Thank you for notifying me that" after I told her "you guys are awful". its a really bad apartment, during the summer their cooler often has problems.','11/15/2018','a006','r069'),
	('rev070',1,'The worst apt in pg county. I am a future resident , I just got off work at 3:30am and I decided to stay at friends apartment in westchester until the leasing office opens at 9am because I had another shift to cover at noon, so I parked at the future resident but before the leasing office opened My car has been towed , I just paid $175 to get my car back , went to The staff and she said there was nothing she could do about it , please Don’t even think of going there , I am totally disappointed and angry at this moment .do not fall for the pictures online , this place is ridiculous.','9/15/2021','a006','r070'),
	('rev071',5,'I had the most pleasant encounter with the maintenance team - Tia and Mauricio this week. They are both superstars. Very friendly and professional. Mauricio went above and beyond to fix a few issues in my unit. Took the time to explain next steps for my issues and even took the time to also addressed another issue and fixed it right away for me. Tai is a new hire and he is so pleasant and friendly. Well mannered. I see him a lot of the elevators and hallways and I always ask him how is his day going. He always has a smile on his face and always has that "positive" vibe about him. I am not sure if the building have Employee of the month celebrations, if you do then you really need to appreciate these two guys. I really dislike poor customer service or lazy workers, so when I see the opportunity to recognize good workers I like to let their managers know that they have good workers. These guys are amazing.','10/15/2021','a006','r071'),
	('rev072',1,'Constantly seeing roaches. I had one crawl across my foot when I was in the kitchen (clean apartment by the way). All of the people giving 5 star reviews must be new or are friends of the staff trying to boost the ratings.','11/8/2021','a006','r072'),
	('rev073',4,'Ive lived here for a while now and haven’t had much trouble. Whenever I have an issue Emarjah would handle things quickly and efficiently. The Visitors Parking situation isn’t really up to pare but I know the staff try their best to rectify any issue at hand. They try to have small activities for us from time to time and provide treats for residence. The lobby always looks Nice and clean but sometimes there is an odd smell. I love it here.','11/1/2021','a006','r073')



--1.  What are the apartment id, apartment name and apartment address of the apartments with average rating over 4?
GO
DROP VIEW IF EXISTS Q1

GO
CREATE VIEW Q1 AS
	SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average Rating'
	FROM [Review.Apartment] a, [Review.Write] w
	WHERE a.aptId=w.aptId
	GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
	HAVING AVG(w.revRate) > 4

SELECT *
FROM Q1


--2. What is the apartment id, apartment name and apartment address of the apartment with the worst average rating?
-- Solution 1
GO
DROP VIEW IF EXISTS Q2_1

GO
CREATE VIEW Q2_1 AS
	SELECT TOP 1 a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average Rating'
	FROM [Review.Apartment] a, [Review.Write] w
	WHERE a.aptId=w.aptId
	GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
	ORDER BY AVG(w.revRate) ASC

SELECT *
FROM Q2_1

-- Solution 2
GO
DROP VIEW IF EXISTS Q2_2

GO
CREATE VIEW Q2_2 AS
	SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average_Rating'
	FROM [Review.Apartment] a, [Review.Write] w, (
		SELECT aa.aptId, AVG(ww.revRate) as 'AR'
		FROM [Review.Apartment] aa, [Review.Write] ww
		WHERE aa.aptId=ww.aptId
		GROUP BY aa.aptId) av
	WHERE a.aptId=w.aptId
	GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
	HAVING AVG(w.revRate) = MIN(av.AR)

SELECT *
FROM Q2_2

-- 3. What are the apartment name of the apartments that have a gym, a pool and a club?
GO
DROP VIEW IF EXISTS Q3

GO
CREATE VIEW Q3 AS
	SELECT a.aptName 
	FROM [Review.Apartment] a , [Review.Amenity] am
	WHERE a.aptId = am.aptId and (am.amenGym = 'Y' and am.amenPool = 'Y' and am.amenClub = 'Y')

SELECT *
FROM Q3

--4. What is the apartment name and its unit's full detail of the apartment that has the cheapest apartment units in college park area? 
GO
DROP VIEW IF EXISTS Q4

GO
CREATE VIEW Q4 AS
	SELECT TOP 1 a.aptName, u.*
	FROM [Review.Apartment] a ,[Review.Unit] u
	WHERE a.aptId=u.aptId
	ORDER BY  u.unitRent

SELECT *
FROM Q4

--5. What are the apartment name, user name and the content of the 5 longest reviews?
GO
DROP VIEW IF EXISTS Q5

GO
CREATE VIEW Q5 AS
	SELECT TOP 5 a.aptName ,r.rwerName, w.revContent
	FROM [Review.Write] w, [Review.Reviewer] r,[Review.Apartment] a
	WHERE w.rwerId = r.rwerId AND   w.aptId = a.aptId
	ORDER BY LEN(w.revContent) DESC

SELECT *
FROM Q5