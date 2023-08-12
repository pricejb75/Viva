
drop table picture;
drop table details;
DROP TABLE wishlist_item;
DROP TABLE  wishlist;
DROP TABLE  cart_item;
DROP TABLE  users;
drop table product;
drop table product_type;
drop table quality;
drop table country;



CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	name varchar(50) NOT NULL,
	address varchar(100) NULL,
	city varchar(50) NULL,
	state_code char(2) NULL,
	zip varchar(5) NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);


CREATE TABLE country (

country_id serial NOT NULL,
country_name varchar(10000) NOT NULL,
CONSTRAINT PK_country PRIMARY KEY (country_id)

);

CREATE TABLE quality (

quality_id serial NOT NULL,
quality_name varchar (10000) NOT NULL,
	
CONSTRAINT PK_quality PRIMARY KEY (quality_id)

);

CREATE TABLE product_type (

product_type_id serial NOT NULL,
product_type_name varchar(10000) NOT NULL,
	
CONSTRAINT PK_product_type_id PRIMARY KEY (product_type_id)

);

CREATE TABLE product (

product_id serial,
product_name varchar(10000) NOT NULL,
description varchar(10000) NOT NULL,
price decimal(5,2) NOT NULL,
inventory integer NOT NULL,
country_id integer NOT NULL,
product_type_id integer NOT NULL,

	
CONSTRAINT PK_product PRIMARY KEY (product_id),
CONSTRAINT FK_product_country FOREIGN KEY (country_id) REFERENCES country(country_id),
CONSTRAINT CHK_inventory CHECK (inventory > -1),
CONSTRAINT FK_product_product_type FOREIGN KEY (product_type_id) REFERENCES product_type (product_type_id)
);


CREATE TABLE picture (

picture_id serial NOT NULL,
product_id int NOT NULL,
picture_filepath varchar(10000),

CONSTRAINT PK_picture PRIMARY KEY (picture_id),
CONSTRAINT FK_picture_product FOREIGN KEY (product_id) REFERENCES product(product_id)

);

CREATE TABLE details (

product_id int NOT NULL,
quality_id int NOT NULL,
quality_details varchar(10000),

CONSTRAINT PK_details PRIMARY KEY (product_id,quality_id),
CONSTRAINT FK_details_quality FOREIGN KEY (quality_id) REFERENCES quality (quality_id),
CONSTRAINT FK_details_product FOREIGN KEY (product_id) REFERENCES product (product_id)
	
);

-- wishlist
CREATE TABLE wishlist (
	wishlist_id SERIAL,
	user_id int NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT PK_wishlist PRIMARY KEY (wishlist_id),
	CONSTRAINT FK_wishlist_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- wishlist item
CREATE TABLE wishlist_item (
	wishlist_item_id SERIAL,
	wishlist_id int NOT NULL,
	product_id int NOT NULL,
	CONSTRAINT PK_wishlist_item PRIMARY KEY (wishlist_item_id),
	CONSTRAINT FK_wishlist_item_wishlist FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id),
	CONSTRAINT FK_wishlist_item_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE UNIQUE INDEX IX_wishlist_item_wishlist_product ON wishlist_item(wishlist_id, product_id);

-- cart item
CREATE TABLE cart_item (
	cart_item_id SERIAL,
	user_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL DEFAULT(1),
	CONSTRAINT PK_cart_item PRIMARY KEY (cart_item_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_cart_item_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE UNIQUE INDEX IX_cart_item_user_product ON cart_item(user_id, product_id);



INSERT INTO country (country_name) VALUES ('Algeria');
INSERT INTO country (country_name) VALUES ('Argentina');
INSERT INTO country (country_name) VALUES ('Australia');
INSERT INTO country (country_name) VALUES ('Brazil');
INSERT INTO country (country_name) VALUES ('Canada');
INSERT INTO country (country_name) VALUES ('Chile');
INSERT INTO country (country_name) VALUES ('China');
INSERT INTO country (country_name) VALUES ('Cuba');
INSERT INTO country (country_name) VALUES ('Czech Republic');
INSERT INTO country (country_name) VALUES ('Egypt');
INSERT INTO country (country_name) VALUES ('Ethiopia');
INSERT INTO country (country_name) VALUES ('France');
INSERT INTO country (country_name) VALUES ('Germany');
INSERT INTO country (country_name) VALUES ('Ghana');
INSERT INTO country (country_name) VALUES ('Greece');
INSERT INTO country (country_name) VALUES ('Guatemala');
INSERT INTO country (country_name) VALUES ('Haiti');
INSERT INTO country (country_name) VALUES ('Hungary');
INSERT INTO country (country_name) VALUES ('India');
INSERT INTO country (country_name) VALUES ('Indonesia');
INSERT INTO country (country_name) VALUES ('Iran');
INSERT INTO country (country_name) VALUES ('Iraq');
INSERT INTO country (country_name) VALUES ('Ireland');
INSERT INTO country (country_name) VALUES ('Islands of the Pacific');
INSERT INTO country (country_name) VALUES ('Israel');
INSERT INTO country (country_name) VALUES ('Italy');
INSERT INTO country (country_name) VALUES ('Jamaica');
INSERT INTO country (country_name) VALUES ('Japan');
INSERT INTO country (country_name) VALUES ('Korea');
INSERT INTO country (country_name) VALUES ('Lebanon');
INSERT INTO country (country_name) VALUES ('Mexico');
INSERT INTO country (country_name) VALUES ('Pakistan');
INSERT INTO country (country_name) VALUES ('Peru');
INSERT INTO country (country_name) VALUES ('Philippines');
INSERT INTO country (country_name) VALUES ('Poland');
INSERT INTO country (country_name) VALUES ('Russia');
INSERT INTO country (country_name) VALUES ('Spain');
INSERT INTO country (country_name) VALUES ('Sweden');
INSERT INTO country (country_name) VALUES ('Thailand');
INSERT INTO country (country_name) VALUES ('Turkey');
INSERT INTO country (country_name) VALUES ('Ukraine');
INSERT INTO country (country_name) VALUES ('United Kingdom');
INSERT INTO country (country_name) VALUES ('Vietnam');




INSERT INTO quality (quality_name) VALUES ('Sweetness'); -- 1
INSERT INTO quality (quality_name) VALUES ('Acidity'); -- 2
INSERT INTO quality (quality_name) VALUES ('Tannin'); -- 3
INSERT INTO quality (quality_name) VALUES ('Body'); -- 4
INSERT INTO quality (quality_name) VALUES ('Color'); -- 5
INSERT INTO quality (quality_name) VALUES ('Alchohol By Volume'); -- 6
INSERT INTO quality (quality_name) VALUES ('Ingredients Included'); -- 7
INSERT INTO quality (quality_name) VALUES ('Dietary Consideration'); -- 8
INSERT INTO quality (quality_name) VALUES ('Cooking Instructions'); -- 9

-- Product Types
INSERT INTO product_type (product_type_name) VALUES ('food');
INSERT INTO product_type (product_type_name) VALUES ('drink');







-- Products
INSERT INTO product (product_name, description, price, inventory, country_id, product_type_id)
	VALUES ('Saffron and Raisin Couscous with Fresh Mint', 
			'An Algerian staple. This is a " go- to" for Algerian families. However, you will enjoy the fresh, herbacious taste!',
			21.46, 250, 1, 1); 
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Sahlab',
			'Sahlab is a Middle Eastern sweet milk pudding. It is quick and easy to make, and it is absolutely delicious!',
			14.99, 250, 1, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'FLEUR D ABOUKIR rosé',
			'Fleur dAboukir offers a glimmeringly pale pink color and a nose of citrus fruit (lemon, grapefruit) of superb intensity. 
			The fresh, acidulous palate is of great length, and its aromatic finish is the sign of a truly great rosé.',
			24.99, 250, 1, 2);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'SAHARA Red',
			'Deep ruby red in color, with aromas of very ripe red fruit and plump tannins and a long, luscious finish.', 
			24.99, 250, 1, 2);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Chimichurri (Dipping Sauce)',
			'The flavor is super fresh because of all those herbs, and also bright, garlicky, piquant, and tangy due to the acidity from limes and vinegar.',
			24.99, 250, 2, 1);
	
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Alamos Malbec',
			'The 2021 Malbec offers varietal and regional typicity at a very affordable price. 
			There are violets, berries and a touch of sweet spices with a juicy and round palate with almost unnoticeable tannins.',
			24.99, 250, 2, 2);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Empanadas (Little Meat Pies)',
			 'Empanadas are crescent-shaped, savory pastries made of dough and filled with a variety of ingredients.', 
			44.99, 250, 2, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Australian Meat Pie',
			 'An Aussie icon, this classic pie is made with a shortcrust base and a rich beef mince gravy',
			34.99, 250, 3, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Mr. Black Coffee Liqueur', 
			'Mr Black, won a gold medal at the London International Wine & Spirits Competition in 2012.',
			24.99, 250, 3, 2);
	
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Feijoada (Meat Stew)',
			'Feijoada is a black bean stew that is brewed with a variety of salted and smoked pork and beef products from carne-seca to smoked pork spare ribs',
			44.99, 250, 4, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pirassununga 51 Cachaca Brazilian Rum', 
			'Lauded by the producer as Brazils best selling cachaça, this easy-drinking cachaça surely would blend wonderfully with lime into caipirinhas and other cocktails.',
			24.99, 250, 4, 2);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Sweet Corn Pancakes',
			 'Western Canadians enjoy the products of the large ranches and farms in that part of the counrty. These sweet corn pancakes are a must.',
			24.99, 250, 5, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Crown Royal Regular Fine De Luxe Canadian Whisky', 
			' With a silky texture and hints of oak and sweet vanilla, our 80 proof whisky provides a refined flavor that enhances any cocktail party or celebration.',
			24.99, 250, 5, 2);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pastel de Choclo (Corn and Meat Pie)',
			'Pastel de choclo is a beef and corn casserole, a very traditional and popular dish in Chile.', 
			54.99, 250, 6, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Catan “Pisco Sour” Cocktail Kit', 
			'The world’s first Pisco Sour Kit is here, and 
			has been carefully curated by Catan Pisco, Chicago’s first local and Woman Owned pisco brand by the first Chilean female founder in history.',
			74.99, 250, 6, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Vinn Distillery 99 Baiju',
			'A traditional Chinse drink. Most Baiju is made from sorgum, VINN Baiju is made from 100% rice, which makes for a softer smoother expression of the spirit.',
			24.99, 250, 7, 2);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Wonton Soup',
			'Tender wontons filled with seasoned pork swim in a clear broth flavored with ginger, soy, sesame, and garlic.',
			24.99, 250, 7, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Moors and Christians (Black Beans and Rice)',
			'A Scrumptious Cuban Side Dish Introduce your family to the tantalizing flavors of Cuba.', 
			19.99, 250, 8, 1);


INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Fried Plantains',
			'Plantains (plátanos in Spanish) look like large bananas. 
			They are technically fruits, but much like the tomato and unlike the banana, they are eaten and cooked as if they were a vegetable',
			14.99, 250, 8, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'The Mojito Kit',
			 'Originating in Havana, the Mojito was originally designed as a medicinal drink to curb disease on the island of Cuba.  We wished all medicine tasted this delicious!',
			54.99, 250, 8, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Houbova Polevka Myslivecka (Hunters Mushroom Soup)',
			'The soup is typically seasoned with marjoram and cumin, and it is always served warm as a hearty appetizer.',
			34.99, 250, 9, 1);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'BECHEROVKA',
			 'Becherovka Is Original Czech Liquor. Its Mysterious Recipe Is Still Kept In Secret and
			there Are Only Two Persons In The World Who Know The Rights Ingredients And Herbs Used In Production.',
			34.99, 250, 9, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Koushari (Lentils, Macaroni, Rice, and Chickpeas)',
			 'A comforting bowl of simple pantry staples: spiced lentils and rice, combined with chickpeas and small pasta. 
			All smothered in a tomato sauce that has been spiked with vinegar (out-of-this-world tasty, by the way!)',
			44.99, 250, 10, 1);			
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'SAKARA Beer',
			 'Sakara Gold is a very smooth-tasting and refreshing lager beer Sakara Gold is particularly suitable for Egypt’s warm climate.',
			14.99, 250, 10, 2);		

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Kategna',
			 'Kategna is a traditional Ethiopian dish that has been around for centuries by generations of Ethiopians. 
			It is made of injera (a spongy, sourdough flatbread) topped with berbere and niter kibbeh, giving is the perfect blend of sweet, sour and spicy flavors.',
			14.99, 250, 11, 1);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Amarula Cream Liqueur',
			 'Made from the delicious Marula fruit of sub-Equatorial Africa, the Marula spirit is distilled and aged in French oak for two years. 
			It is then blended with our velvety cream to create the smooth taste of Amarula - best savoured over ice, preferably with a view.',
			13.99, 250, 11, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Baguette (French Bread)',
			 'A baguette is a long, thin type of bread of French origin that is commonly made from basic lean dough. It is distinguishable by its length and crisp crust. ',
			14.99, 250, 12, 1);		
				

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Soupe à l Oignon Gratinée (Onion Soup)',
			 'French onion soup is a soup usually based on meat stock and onions,
			and often served gratinéed with croutons or a larger piece of bread covered with cheese floating on top.',
			34.99, 250, 12, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Brillet Belle de Brillet Liqueur',
			 'This liqueur is the fruit of a perfect blend of very flavorful “Poire Williams” produced mainly in the east of France, 
			fine Brillet Cognac Eau de Vie from the heart of the Cognac region, and a “special plus,” an ingredient whose secret is cautiously guarded by Maison Brillet.',
			44.99, 250, 12, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Bratwurst (Sausage)',
			 'Bratwurst is a type of German sausage made from pork or, less commonly, beef or veal.',
			34.99, 250, 13, 1);	
	
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Kartoffelknödeln (Potato Dumplings)',
			 'Translation of "Kartoffelknödeln" in English. potato dumplings.',
			44.99, 250, 13, 1);		

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Hofbrau Original Beer',
			 'Hofbruhaus is a symbol of Munichs hospitality and the Bavarian gift for creating a snug and cozy atmosphere.',
			14.99, 250, 13, 2);

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Jollof Rice',
			 'Jollof, or jollof rice, is a rice dish from West Africa. The dish is typically made with long-grain rice, tomatoes, onions, spices,
			vegetables and meat in a single pot, although its ingredients and preparation methods vary across different regions.',
			24.99, 250, 14, 1);		

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Emu Palm Wine',
			 'Palm wine is an alcoholic beverage produced from the fermentation of sap of different palm species. 
			Palm wine is a sweet, milky, effervescent, and alcoholic beverage. The Palm wine is composed by amino acids, proteins, vitamins, and sugars.',
			12.99, 250, 14, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Avgolemono (Egg-Lemon Soup)',
			 'Avgolemono is a family of sauces and soups made with egg yolk and lemon juice mixed with broth, heated until they thicken',
			34.99, 250, 15, 1);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Moussaka (Lamb-Eggplant Casserole)',
			 'Moussaka is an eggplant- or potato-based dish, often including ground meat, which is common in the Balkans and the Middle East, with many local and regional variations. 
			The best-known version in Europe and the Americas is the Greek variant created in the 1920s by Nikolaos Tselementes.',
			54.99, 250, 15, 1);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Metaxa Ouzo 750ml',
			 'A blend of 6 botanicals of the Mediterranean basin, including the rare mastic coming from the island of Chios. 
			Complex and balanced with rich aromas of iris flower, mastic, and anise.',
			22.99, 250, 15, 2);		

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Picado de Rabano (Radish Salad)',
			 'Guatemalan Radish Salad called Picado De Rabano is found on nearly every table there. 
			Almost like a condiment this crunchy delicious salad is used as a topping for many things.',
			24.99, 250, 16, 1);		

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Aguardiente - Guaro',
			 'Guaro is a liquor made in many places in Latin America. A clear liquid distilled from sugar cane juices, it has a slightly sweeter taste than comparable liquors.',
			22.99, 250, 16, 2);		
			
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pain Haïtien (Haitian Bread)',
			' Haitian bread is composed of a rather hard dough with a dense texture, which is prepared with sugar, butter, yeast, flour and salt. ',
			24.99, 250, 17, 1);			
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Riz Djon-Djon (Rice and Haitian Mushrooms)',
			' Djon Djon (Djon-djon) is an edible black mushroom, used as a delicacy in Haitian rice dishes and served with meat or fish on special occasions. ',
			34.99, 250, 17, 1);	
		
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Clairin - Haitian Rhum',
			'Clairin is made from the Madame Meuze species of cane which is fermented naturally 
			with wild yeasts from the fresh pressed juice shortly after harvest. Floral, herbaceous and saline.',
			26.99, 250, 17, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pörkölt (National Hungarian Stew)',
			'One of Hungarys most famous dishes, this slow-simmered Hungarian beef and onion stew (porkolt) is out of this world delicious!',
			54.99, 250, 18, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Zwack Unicum',
			'The inky, amber-tinted liquid inside is called Unicum, and with roots that delve back to the late 18th century, 
			it is one of the most revered national drinks in Hungary.',
			56.99, 250, 18, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Tandoori Chicken (Spicy Barbecued Chicken)',
			'Tandoori chicken is a South Asian dish of chicken marinated in yogurt and spices and roasted in a tandoor, a cylindrical clay oven. ',
			59.99, 250, 18, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'GOLDEN GINGER MARGARITA',
			'The Golden Ginger Margarita is perfectly balanced between sour and sweet! Espolòn Reposado Tequila, with fresh-squeezed lime juice, 
			apricot tea, a homemade cinnamon simple syrup and cold pressed ginger juice add a sharpness and complexity to this fresh tasting margarita.',
			54.99, 250, 19, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Tahu Goreng (Fried Tofu)',
			'Tahu Goreng Krispi is Indonesian fried tofu that is a staple in many Indonesian households.',
			39.99, 250, 20, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Bali Arak',
			'Arak is a distilled alcoholic, typically produced in Southeast Asia or South Asia. 
			 It is usually made from the fermented sap of sugarcane coconut flowers, and grain or fruit, depending upon the country of origin.',
			24.99, 250, 20, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Dolma (Stuffed Grape Leaves)',
			'What are Dolmas: Stuffed Grape Leaves? The word Dolma, from the Turkish verb Dolmak, 
			basically means "to be filled," referring to all sorts of stuffed foods from grape leaves to stuffed tomatoes, zucchini, or even bell peppers.',
			29.99, 250, 21, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Arak: Persian Empire Saggi',
			'Arak Saggi is a popular Persian drink that is made by distilling sultana raisins.',
			74.99, 250, 21, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Beef with Fruit',
			'The strong taste of beef is friendly to sweeter fruits, such as apricots, kiwis, mangoes, peaches, pineapple, plums, and prunes',
			69.99, 250, 22, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Bira 91 White Ale',
			'BIRA White Ale is a deliciously different wheat beer with low bitterness, 
			a hint of spicy citrus with a soft finish – a refreshing all day craft beer, brewed with the finest natural ingredients mixed with barrels of passion.',
			14.99, 250, 22, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Irish Soda Bread',
			'Soda bread is a variety of quick bread traditionally made in a variety of cuisines in 
			which sodium bicarbonate is used as a leavening agent instead of the traditional yeast. ',
			29.99, 250, 23, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Traditional Irish Stew',
			'The origins of Irish stew are somewhat shrouded in mystery, but it is believed to have originated in the 17th or 18th century. 
			At that time, the dish was often made by shepherds and rural farmers who had access to only a few ingredients but needed a nourishing meal
			to sustain them through long days of work.',
			59.99, 250, 23, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'GlENDALOUGH DOUBLE BARREL IRISH WHISKEY',
			'Upon its release, this whiskey won the double gold at The World Spirits Competition in San Francisco.',
			44.99, 250, 23, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Poisson Cru',
			'ʻOta ʻika is a Oceanian dish consisting of raw fish marinated in citrus juice and coconut milk. The Tongan, Tahitian, 
			and Samoan variants are essentially identical in that the raw fish is briefly marinated in lemon or lime juice until the surface of the flesh becomes opaque.',
			59.99, 250, 24, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Presidente 12oz Bottles',
			'A staple drink in the Pacific Islands, best enjoyed beachside!',
			14.99, 250, 24, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Shakshooka (Egg-and-Tomato Dish)',
			'“Shakshuka” broadly translates to “all mixed up,” and thats a fitting description for this flavorful 
			stewed blend of ripe tomatoes, roasted peppers, onion, garlic, extra virgin olive oil, cilantro, parsley, and secret blend of six Moroccan spices.',
			49.99, 250, 25, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Goldstar Dark Beer',
			'Israels most beloved and best selling beer. Red lager (in bottom fermentation) with a unique taste and aroma.',
			14.99, 250, 25, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pasta e Fagioli (Noodle and Bean Soup)',
			'Pasta e fagioli, meaning "pasta and beans", is a traditional Italian pasta soup.
			It is often called pasta fasul or pasta fazool in the New York Italian dialect, derived from its Neapolitan name, pasta e fasule.',
			49.99, 250, 26, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Fettucine Alfredo',
			'Fettuccine Alfredo or fettuccine al burro is an Italian pasta dish of fresh fettuccine tossed with butter and parmesan. 
			As the cheese melts, it emulsifies the liquids to form a smooth and rich cheese sauce coating the pasta.',
			59.99, 250, 26, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Bocelli Sangiovese',
			'This wine is from Italy, Tuscany region, Toscano sub-region.',
			24.99, 250, 26, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'La Fiera Montepulciano abruzzo Italy Abruzzo',
			'Montepulciano d Abruzzo is an Italian red wine made from the Montepulciano wine grape in the Abruzzo region of east-central Italy.',
			24.99, 250, 26, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Romana Sambuca Liqueur',
			'Tasting Notes: Romana Sambuca is a distinctive, flavorful and unique Italian liqueur. At 42% alcohol by volume, with a bold yet pleasingly sweet anise flavor.',
			34.99, 250, 26, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Jerk Chicken',
			' A historical jerk seasoning recipe calls for bird peppers, pimento and pepper elder, modern recipes may 
			include Scotch bonnet peppers, scallions, garlic, ginger, pimento, thyme and cinnamon.',
			59.99, 250, 27, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Appleton Estate - Rare Casks 12yr Jamaican Rum (750ML)',
			'Made of hand-selected, golden rums that have all been aged for at least 12 years. Its dark brown hue, assertive woody character,
			and smooth strong flavor come from years of tropical aging, all of which make a bold statement of exceptional quality.',
			64.99, 250, 27, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Miso Soup',
			 'Miso soup is a traditional Japanese soup consisting of a dashi stock into which softened miso paste is mixed. 
			In addition, there are many optional ingredients that may be added depending on regional and seasonal recipes, and personal preference.',
			29.99, 250, 28, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Sushi',
			'Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanied by a variety of ingredients, such as seafood—often raw—and vegetables.
			Styles of sushi and its presentation vary widely, but the one key ingredient is "sushi rice", also referred to as shari, or sumeshi',
			39.99, 250, 28, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'SOTO - Super Premium Junmai Daiginjo Sake (720ML)',
			'Award winning, Super Premium Junmai Daigingo sake from Niigata Japan. Fresh apple, cucumber and hint of lime zest, with a medium dry finish.',
			29.99, 250, 28, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Kimchi',
			'Kimchi, is a traditional Korean banchan consisting of salted and fermented vegetables, most commonly using napa cabbage or Korean radish.
			A wide selection of seasonings are used, including gochugaru, spring onions, garlic, ginger, and jeotgal, etc. Kimchi is also used in a variety of soups and stews',
			19.99, 250, 29, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Mandu (Korean Dumplings)',
			'Mandu are classic Korean dumplings filled with ground pork, tofu, garlic chives, and ginger.',
			24.99, 250, 29, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Soon Hari Korean Soju Bundle',
			'Get all the soju at once! Try all the flavors for a cheaper price and the the Korean Soju all in one standing!',
			29.99, 250, 29, 2);	
			
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Baked Kibbeh',
			'Kibbeh is an arabic word derived from “kubba”, which means ball. It is a combination of very lean ground meat, cracked bulgur wheat and spices.
			Some have likened kibbeh to meatloaf, which is a great way to describe it especially for this baked kibbeh version.',
			49.99, 250, 30, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Tabbouleh',
			'Tabbouleh, also transcribed tabouleh, tabbouli, tabouli, or taboulah, is a Levantine salad made mostly of 
			finely chopped parsley, with tomatoes, mint, onion, soaked uncooked bulgur, and seasoned with olive oil, lemon juice, salt and sweet pepper. 
			Some variations add lettuce, or use semolina instead of bulgur.',
			29.99, 250, 30, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Fakra Arak 750ml',
			'Arak or araq (Arabic: ﻋﺮﻕ) is a distilled Levantine spirit of the anise drinks family. It is translucent and unsweetened.',
			19.99, 250, 30, 2);		
			
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Rosca de Reyes (Three Kings Sweet Bread)',
			'Día de los Tres Reyes (Three Kings Day or Epiphany) on January 6 and Día de los Muertos (Day of the Dead)
			on October 30 are occasions for more celebration, including the consumption of specific foods. 
			On Día de los Tres Reyes, a special sweet bread, Rosca de Reyes, is eaten.',
			29.99, 250, 31, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Margarita Cocktail Kit ',
			  ' Mexicos most well-known cocktail is a deceptively simple combination of tequila, triple sec, and lime juice, served
			with salt on the rim of the glass. Either on the rocks or frozen, margaritas have become emblematic of not only Mexico, but of fiestas around the world.',
			69.99, 250, 31, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Shahi Tukra',
			 'Shahi tukda is a rich & festive dessert made with bread, ghee, sugar, milk and nuts.',
			24.99, 250, 32, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Mango Lassi 12oz six pack',
			 'Mango lassi is a delicious creamy drink with mango, yogurt, milk, a little sugar, and a sprinkling of cardamom.',
			22.99, 250, 32, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Picarones (Pumpkin Fritters)',
			'Peru Picarones (Pumpkin Fritters). Picarones is a Peruvian dessert that originated in Lima.',
			34.99, 250, 33, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pisco: Capel Sour Likor | 700ML',
			'Pisco Capel Sour is a traditional Peruvian cocktail made with Pisco (a type of brandy), lemon juice, sugar, and egg whites.',
			44.99, 250, 33, 2);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Leche Flan (Caramel Custard)',
			'Crème caramel, flan, caramel pudding, condensed milk pudding or caramel custard is a custard dessert with a layer of clear caramel sauce.',
			24.99, 250, 34, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'SAN MIGUEL 6PK NR',
			'This is the San Miguel from The Philippines. You need to see Pale Pilsen on the label. 
			It is made in The Philippines, Indonesia, Thailand, Vietnam, Nepal, Hong Kong and China.',
			14.99, 250, 34, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pierogi (Dumplings)',
			'Pierogi are filled dumplings made by wrapping unleavened dough around a savory or sweet filling and cooking in boiling water.
			Pierogi or their varieties are associated with the cuisines of Central, Eastern and Southeastern Europe.',
			44.99, 250, 35, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'KRUPNIK HONEY LIQUOR',
			'Krupnik. Dubbed as the favorite drink in Poland, krupnik is based on a neutral spirit, typically vodka of fruit brandy, which is enriched with honey.',
			24.99, 250, 35, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Salat Olivier (Russian Salad)',
			'Olivier salad is a traditional salad dish in Russian cuisine, which is also popular in other post-Soviet countries and around the world.',
			54.99, 250, 36, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Beluga Noble Vodka',
			'Beluga Vodka is a world famous premium luxury Vodka that proudly exudes being “created, not made.”',
			24.99, 250, 36, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Gazpacho (Cold Tomato Soup)',
			'Gazpacho is a cold soup that is made from blended raw vegetables, oil, and spices.',
			24.99, 250, 37, 1);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Cruz Garcia Real Red Sangria',
			  'Produced from fine Spanish red wine and a blend of natural citrus fruit flavors.
			It is predominantly made from Tempranillo and Garnacha grapes. This has an authentic Spanish sangria taste with aromas of fresh citrus.',
			19.99, 250, 37, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Köttbulla (Swedish Meatballs)',
			'Köttbullar med gräddsås (meatballs with cream sauce) is widely thought of as Swedens national dish. 
			Köttbullar are smaller and have a diferent flavour to Italian meatballs and are nearly always served with a cream sauce.',
			34.99, 250, 38, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Krogstad Aquavit',
			'Krogstad Aquavit is the spirit of exploration, inspired by the first Europeans to reach America and later passed down from generation
			to generation. Distilled from naturally gluten free American grain, flavored with a luscious blend of caraway and star anise,
			Krogstad was received a Double Gold and was voted best aquavit in the world at the San Francisco World Spirits Competition.',
			22.99, 250, 38, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Chicken Satay',
			 'Perfectly grilled and nicely charred chicken skewers with mouthwatering peanut sauce.',
			54.99, 250, 39, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pad Thai',
			'Pad thai, phat thai, or phad thai, is a stir-fried rice noodle dish commonly served as a street food in Thailand as part of the countrys cuisine. 
			It is typically made with rice noodles, shrimp, peanuts, a scrambled egg, and bean sprouts.',
			44.99, 250, 39, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Singha 11.2oz Bottles',
			 'To many beer lovers, Singha is obviously the better beer as its a 100% barley malt beer that has a rich body and a strong flavor.',
			14.99, 250, 39, 2);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Kaymakli Kuru Kayisi (Cream-Stuffed Apricots)',
			'Turkey: Kaymakli Kuru Kayisi (Cream-Stuffed Apricots) are made with apricots and pistachios, both of which are grown in Turkey.',
			44.99, 250, 40, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Yeni Raki Turkish Spec',
			'Rakı or raki is an alcoholic drink made of twice-distilled grapes. 
			It is the national drink of Turkey. It is also popular in other Balkan countries as an apéritif as well as in Kazakhstan. 
			It is often served with seafood or meze.',
			29.99, 250, 40, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Holubtsi (Stuffed Cabbage Rolls)',
			 'Ukrainian Holubtsi or Stuffed Cabbage Rolls are filled with hearty combination of ground beef, rice, and chopped onion.',
			44.99, 250, 41, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'UKRANIAN GORILOCHKA 750ML',
			 'Horilka is a Ukrainian alcoholic beverage. The word horilka may also be used in a generic sense in the Ukrainian
			  language to mean vodka or other strong spirits and etymologically
			  is similar to the Ukrainian word for burning - hority. Home-distilled horilka, moonshine, is called samohon',
			24.99, 250, 41, 2);
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Individual Mincemeat Pies',
			 'A mince pie is a sweet pie of English origin filled with mincemeat, 
			being a mixture of fruit, spices and suet. The pies are traditionally 
			served during the Christmas season in much of the English-speaking world.',
			39.99, 250, 42, 1);		
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'NEWCASTLE BROWN ALE 12OZ 6 PACK BOTTLES',
			 'Newcastle Brown Ale 12oz 6 Pack Bottles is amazing, wonderful, and truly fabulous.',
			14.99, 250, 42, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Pho Bo (Beef Noodle Soup)',
			 'Phở is a Vietnamese soup dish consisting of broth, rice noodles, herbs, and meat. Phở is a popular food in Vietnam where it is served in households, 
			street-stalls, and restaurants country-wide. Residents of the city of Nam Định were the first to create Vietnamese traditional phở',
			69.99, 250, 43, 1);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ( 'Saigon Export Beer',
			 'Vietnam- Euro Pale Lager- Bright clear pale straw gold in color. Pale grain aromas with hints of lemongrass',
			13.99, 250, 43, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ('Chateau Trians Provence Rose',
		   	'Chateau Trians Provence Rosé is made on a property dating back to the 18th century in the North of Toulon, France and is fully organic, with every grape carefully harvested by hand. 
			This labor of love is vinified from 60% grenache, 30% sinsault and 10% syrah grapes and boasts a beautiful aroma of lilacs, grapefruit and pomegranate.',
		    15.99, 250, 12, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ('Cune Cava Brut Rosé',
		   	'For a sparkling Spanish rosé, Nathan encourages you to pop a Cune Cava Brut Rosé. The Cune Winery, established in 1879, has a 
			long-standing commitment to crafting and aging high-quality wines, including this effervescent rosé. ',
		    11.99, 250, 37, 2);	

INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ('Terlan Gewurztraminer 2021',
		   	'Named after the winemaking village of Tramin in the South Tyrolean Unterland, Gewürztraminer is a familiar item in the region’s white wine repertoire.',
		    29.99, 250, 13, 2);	
			
INSERT INTO product(product_name, description, price, inventory, country_id, product_type_id)
	VALUES ('Disznoko Dry Furmint 2021',
		   	'Pale yellow with the greenish tint typical of the Furmint grape. Fresh and aromatic with hints of white flowers and grapefruit.',
		    19.99, 250, 18, 2);	
			
			
			
			
			
			
			
			
				
	
-- Details
INSERT INTO details (product_id, quality_id, quality_details)
	VALUES (1, 7, '½ teaspoon saffron, 1 teaspoon extra virgin olive oil, ½ teaspoon salt, 2 cups couscous, ¼ cup raisins, 3 Tablespoons,fresh mint');
INSERT INTO details (product_id, quality_id, quality_details)
	VALUES (1,8, 'vegan');
INSERT INTO details (product_id, quality_id, quality_details)
	VALUES (1,9, 
'In a saucepan, bring the 2 cups of water to a boil and add the saffron. Remove from the heat, cover, and let stand for 30 minutes.
Return the pan to the heat, return to a boil, and mix in the olive oil, salt, couscous, and raisins. 
Remove from the heat, cover, and let stand for 30 minutes. Top with the fresh mint. Makes 8 servings.');


INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (2, 7,
	'3 cups (8 ounces each) milk, 1 cup sugar, ½ cup cornstarch, ¼ cup raisins, ¼ cup coconut, ¼ cup walnuts or pistachios, chopped, 1 teaspoon cinnamon');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (2, 8,
			'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (2, 9, 
'In a small mixing bowl, dissolve the cornstarch in the water and set aside. In a heavy saucepan, bring the milk to a boil over low to medium heat.
As soon as the milk boils, reduce the heat. Stir in the sugar, and allow the milk to simmer until the sugar has dissolved (no more than 1 minute).
Slowly pour the cornstarch mixture into the milk, making sure to whisk rapidly to prevent the milk from sticking to the bottom of the saucepan. The milk will gradually thicken.
When it reaches the consistency of a thick gravy, remove from heat. Pour sahlab into decorative small bowls, glasses, or mugs.
Sprinkle with raisins, coconut, chopped nuts, and cinnamon, if desired. Serve hot.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 5, 'pink');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (3, 6, '12%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 5, 'red');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (4, 6, '12%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (5, 7,
'½ cup olive oil, 2 Tablespoons lemon juice, ⅓ cup fresh parsley, 1 clove garlic, 2 shallots (or 2 small onions),1 teaspoon minced basil, thyme, oregano
Salt and pepper');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (5, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (5, 9, 'Combine all ingredients in a bowl and let sit for at least 2 hours before serving');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 5, 'red');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (6, 6, '12%');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (7, 7,
			'1 pound ground beef, ½ cup onions, 8 green olives, 1 teaspoon salt, ¼ teaspoon oregano, 2½ cups flour, ¼ cup butter, 1 teaspoon vinegar, ½ teaspoon salt.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (7, 8, 'na');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (7, 9, 
'Brown the ground beef and onions in a frying pan until meat has lost all its pink color. Stir in the remaining ingredients. Drain the mixture well, and allow it to cool.
Preheat oven to 400°F. In a bowl, mix the flour, butter, egg, yolk, and vinegar together by hand.
Stir the salt into the water and sprinkle water, a little at a time, over the flour mixture.
Knead the dough until it is smooth. (To knead, flatten the dough on a surface that has been dusted with a little flour. Fold the dough in half and flatten again.
Turn. Repeat the process for about 15 minutes.) For each empanada , roll ¼ cup of dough into a 9-inch circle. Put ½ cup filling on the circle, and fold it in half.
Press the edges of the dough together, and poke a small hole in the top using a toothpick. Place on a cookie sheet. Repeat process until all the dough and filling are used up.
Bake 10–15 minutes. Serve hot with chimichurri .');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (8, 7,
'2 pounds ground beef, 1 cup ketchup ,1 cup onion, chopped, 1 teaspoon salt, 1 cup milk, ⅔ cup bread crumbs, 1 teaspoon oregano, ½ teaspoon pepper
, 2 Tablespoons Worcestershire sauce, 2 cups cheddar cheese, shredded, 2 prepared pie shells, 8-inch');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (8, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (8, 9, 
'Preheat oven to 350°F.Combine ground beef, ketchup, onion, salt, milk, breadcrumbs, oregano, and pepper in a bowl. Mix well.Divide mixture into 2 pie shells 
and bake for about 45 minutes. While the pies are baking, mix together Worcestershire sauce and cheese in another bowl. After about 45 minutes, remove pies from oven.
Spread Worcestershire sauce and cheese mixture on top of pie shells. Bake for about 10 more minutes, or until cheese is melted.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 5, 'black');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (9, 6, '25%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (10, 7,
'3 strips of raw bacon, 2 onions, 3 cloves garlic (or 1 teaspoon garlic powder), 1 pound smoked sausage, 1 pound boneless beef (any cut of meat)
, 1 can (14-ounce) stewed tomatoes, 1 Tablespoon yellow mustard, 4 cups canned black beans, Salt and pepper');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (10, 8, 'low carb');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (10, 9,
'Cut the bacon strips into big pieces. Fry them in a large pot over medium-high heat for about 3 minutes, stirring often.
Turn the heat down to medium. Cut the onion in half. Peel off the skin and outer layer. Chop both halves into small pieces.
Peel the cloves of garlic. Chop them into small pieces. Add the onions and garlic to the bacon in the pot. Stir until the onions are soft, about 3 minutes.
Cut the sausage and beef into 1-inch pieces. Add them to the onions and garlic. Cook until the meat is brown on all sides.
Add the stewed tomatoes (with juice), hot water, yellow mustard, and some salt and pepper. Turn the heat down to simmer. Cover the pot.
Cook for about 45 minutes, stirring often. If it looks too thick, add more water, ¼ cup at a time. Add the black beans (with liquid).
Cover the pot, and cook for 10 more minutes.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (11, 6, '40%');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (12, 7, 
'6 eggs, ¼ cup half-and-half, 1 Tablespoon sour cream, ⅓ cup flour, 1 teaspoon baking soda, 1 teaspoon baking powder, ½ cup corn, Vegetable oil to oil the pan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (12, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (12, 9, 
'Beat the egg whites until they hold soft peaks when the beaters are lifted up. In another bowl, combine the egg yolks, half-and-half, and sour cream.
Gradually add the dry ingredients to the egg yolk mixture. Add the beaten egg whites, using a gentle stirring motion to combine them with the yolk mixture.
Add the corn, and stir gently. Pour a small amount of oil into a non-stick pan and heat it over medium heat. Drop batter, about 1 Tablespoonsful at a time, 
into the pan for each pancake and cook until golden brown on each side.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (13, 6, '40%');	

	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (14, 7, 
'4 cups frozen corn, 8 leaves fresh basil, 1 teaspoon salt, 3 Tablespoons butter, 1 cup milk, 4 large onions, chopped, 3 Tablespoons oil
, 1 pound ground beef, Salt and pepper, 1 teaspoon ground cumin, 1 cup black olives, 1 cup raisins, 2 pieces of cooked chicken breast, 2 Tablespoons confectioners sugar');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (14, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (14, 9, 
'Preheat oven to 400°F. Heat the corn, basil, salt, and butter in a large pot.
Slowly add the milk, stirring constantly until the mixture thickens. Cook over low heat for 5 minutes.
Set aside while the meat filling is prepared. Fry the onions in oil until they are soft. Add the ground meat and stir to brown.
Drain grease from pan. Add salt, pepper, and ground cumin.
Use an oven-proof dish to prepare the pie. Spread the onion and ground meat mixture on the bottom of the dish, then arrange the olives and raisins on top.
Place chicken pieces over the top. Cover the filling with the corn mixture, then sprinkle on the confectioners sugar.
Bake in the oven for 30 to 35 minutes until the crust is golden brown. Serve hot.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 6, '40%');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (15, 7, 
'-1 Full Bottle of Catan Pisco
-1 Bottle of Catan Simply Syrup
-1 Bottle of Fee Brothers Bitters
-1 Bottle of Fee Foam (for the amazing froth!)
-1 Jigger for measuring
-3 Fresh Limes (since the best pisco sour has to have fresh limes!)
-1 Recipe card with detailed instructions');
	
	INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 1, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 3, '5');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (16, 6, '50%');


INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (17, 7,
'½ pound pork or beef, ground, 1 Tablespoon scallions, 1 egg, 1 teaspoon salt, 1 Tablespoon soy sauce
, 1 Tablespoon sugar, 1 teaspoon sesame oil, 1 Tablespoon water, 2 packages wonton skins, 3 cans chicken broth.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (17, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (17, 9,
'Mix ground pork (or beef), scallions, egg, salt, soy sauce, sugar, sesame oil, and water in a bowl.
Place 1 teaspoon of meat mixture in the center of a wonton skin. Moisten the edges of wonton skin with water and fold it to form a triangle. Press the edges together to seal.
Fill and fold the rest of the wonton skins. Bring a large pot of water to a boil to cook the wontons.
In another pot, heat the broth. (Wontons will be cooked first in the boiling water and then added to the broth.)
Add a few wontons at a time to the boiling water, giving them room to float freely. Cook over medium heat 8 to 10 minutes.
Add the cooked wontons to hot broth. Use about 3 dozen wontons for 6 cups of broth.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (18, 7, 
'2 cans of black beans, 1 large onion, diced, 3 garlic cloves, 3 teaspoons cumin, 1 green pepper, 2 cups chicken broth, 3 Tablespoons tomato paste, 1 cup long-grain white rice');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (18, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (18, 9, 
'If you are using canned beans, drain the water from them and set them aside.
If you are using dry beans, cover them with water. Bring to a boil, remove from heat, and let stand 1 hour. Drain the beans.
Use a large, covered cooking pot and sauté the onion, garlic, and green pepper in the olive oil until tender.
Add the tomato paste, black beans, cumin, and chicken broth.
Add rice, cover and cook over low heat, stirring occasionally until rice if fully cooked (about 30 minutes). Add salt and pepper to taste.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (19, 7, 
			'4 firm-ripe plantains, Vegetable oil for frying, spice packet');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (19, 8, 'vegan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (19, 9, 
'With a small, sharp knife, cut ends from each plantain. Slice through the peel and remove it.
Cut the fruit into very thin slices, about ⅛-inch thick.
In a large, deep skillet, heat oil (about ¼-inch deep) and fry 12 to 15 plantain slices at a time for 2 to 3 minutes, or until golden, turning them over once.
Use a slotted spoon or spatula to remove cooked slices and place them on paper towels to drain. Season the slices with salt. Plantain slices should be slightly
crisp on outside but soft on inside.
Reheat plantain slices on a rack in a shallow baking pan in a preheated 350°F oven for 5 minutes, or until heated through.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20, 3, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20, 6, '40%');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (20,7,
'Premium Dark Rum (750ML)
Craft Mojito Mixer
Fever Tree Club Soda (500ML)');
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (21, 7, 
'¾ pound mushrooms, 1 onion, chopped, 1 Tablespoon vegetable oil, 2 strips bacon, ¼ cup flour, 1 beef bouillon cube, ¼ cup heavy whipping cream, ¾ cup cooking wine');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (21, 8, 'low carb');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (21, 9, 
'In a large pot, heat oil over medium heat. Add the bacon pieces and fry until crispy. Add the mushrooms and onion and fry until tender, about 4 minutes.
Add the flour and stir until the flour begins to brown. Add the water and bring to a boil, then add the bouillon cube.
Stir until dissolved. Reduce heat to medium and simmer about 20 minutes, stirring occasionally.
Add cream, salt, pepper, and cooking wine (or water).
Simmer for an additional 15 minutes.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 5, 'Clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (22, 6, '40%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (23, 7, 
'1 cup lentils, 1 teaspoon salt, 1 cup elbow macaroni, 1 cup rice, 1 can (15-ounce) chickpeas (also called ceci), 
1 cup canned tomato puree, 1 cup olive oil, 2 onions, 1 garlic clove, pita bread');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (23, 8, 'vegan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (23, 9, 
'Prepare lentils: Place the lentils in a sieve and rinse thoroughly. Place them in a large saucepan with 3 cups of water and 1 teaspoon salt.
Heat until the water begins to boil. Lower the heat, and simmer for about 1 hour until lentils are tender. Drain and set the lentils aside.
Prepare the macaroni: Fill the same saucepan with water (add salt if desired). Heat until the water begins to boil.
Add the macaroni and boil about 12 to 15 minutes, until macaroni is tender. Drain and set the macaroni aside. (It is okay to combine the macaroni and lentils.)
Prepare the rice: Heat the 2 Tablespoons of olive oil in the same saucepan. Add the rice and cook for 2 or 3 minutes, thoroughly coating the rice with oil.
Add 2 cups of water and heat until the water begins to boil. Cover the saucepan and simmer until the rice is tender, about 15 minutes.
Remove from heat and allow to cool for about 5 minutes.
Assemble koushari: Drain chickpeas and rinse. Add chickpeas, lentils, and macaroni to cooked rice and toss very gently with a fork.
Make sauce: Peel the onions and cut them in half lengthwise. Slice each half crosswise into thin slices.
Heat ¼ cup olive oil in a skillet. Add onions and cook, stirring often with a wooden spoon, until onions are golden brown.
Add garlic clove and cook 1 or 2 more minutes. Stir in tomato puree and heat until bubbly.
Now pour the sauce over the lentil mixture and heat over very low heat for about 5 minutes, until completely warm.
Serve with pita bread.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (24,7,
'Six 12oz cans of Sahara beer included.');
	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (25, 7, 
'One large injera bread, 3 Tablespoons Cajun spices, 2 teaspoons garlic powder, ½ stick unsalted butter.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (25, 8, 'vegan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (25, 9, 
'Preheat oven to 250°F. Mix the garlic powder, spices, and butter together to make a spread.
Spread a thin layer over a piece of flat bread. Place the bread on a cookie sheet, and bake for about 20 minutes, until crispy.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 1, '5');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (26, 6, '22%');	
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (27, 7, 
'1 package dry yeast, 1 Tablespoon salt, 2 Tablespoons sugar, 7 cups flour, egg whites 1 container');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (27, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (27, 9, 
'Grease two cookie sheets.
Dissolve the yeast, salt, and sugar in water in a large mixing bowl.
Stir in the flour until a stiff dough forms. Turn the dough onto a floured surface (countertop or cutting board) and knead for 10 minutes.
Clean out the mixing bowl, lightly oil it, and return the dough to the bowl.
Cover the bowl with plastic wrap. Let the dough rise until doubled in size, ½ hour or so.
Dip your fist in flour and push your fist into the center of the dough to "punch" it down. Remove from the bowl, and knead 3 or 4 more times.
Separate the dough into 4 equal pieces. Form each piece into a long loaf. Place 2 on each of the greased cookie sheets.
Carefully slash the top diagonally every few inches with a knife.
Brush the loaves with the egg white. Cover lightly with plastic wrap and let the loaves rise again for about 30 minutes.
Preheat oven to 400°F. Bake loaves for 10 minutes.
Lower heat to 350°F and bake 20 more minutes.');


INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (28, 7, 
'½ pound onions, cut into thin slices, 3 ounces Swiss cheese, grated, 1 Tablespoon butter
, 3 Tablespoons olive oil, 1 cup white wine, 1 Tablespoon flour
, 1 beef bouillon cube and a dash of Worcestershire sauce, 1 block French Muenster Cheese');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (28, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (28, 9, 
'Melt the butter and olive oil in large saucepan over medium heat and add the onions.
Brown the onions for about 5 minutes.
Sprinkle the flour on onions and stir until dissolved, heating 5 more minutes.
Add the wine (if desired) and the water.
Add salt and pepper to taste.
Add the bouillon cube and dash of Worcestershire sauce (if desired).
Simmer for 20 minutes.
Pour soup into bowls. Float a slice of bread in each bowl.
Top the hot soup with cheese.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (29, 6, '30%');	
	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (30, 7, 
'6 slices bacon, 1 small onion, chopped, 1 clove garlic, 1 can of sauerkraut (32-ounces), 2 medium potatoes,
, ½ cup white grape or apple juice, 1 Tablespoon brown sugar, 1 cube chicken bouillon
, 1 bay leaf, 1 teaspoon caraway seed, 1 pound bratwurst, 1 large apple, 6 pack buns.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (30, 8, 'na');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (30, 9, 
'In a deep skillet, cook the bacon, drain most of the fat, and crumble into pieces.
In the same skillet, fry the onion and garlic in the remaining bacon fat over medium-low heat until tender.
Add the sauerkraut, potatoes, water, white grape (or apple) juice, brown sugar, bouillon, bay leaf, and caraway seed.
Add enough water to cover potatoes and bring to a boil.
Add the bratwurst to the mixture.
Cover and simmer for 20 to 30 minutes.
Add apple slices and simmer 5 to 10 more minutes.');
	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (31, 7, 
'8 medium potatoes, 3 egg yolks, beaten, 3 Tablespoons cornstarch, 1 cup bread crumbs, ½ teaspoon pepper, 1½ teaspoons salt, Flour');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (31, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (31, 9, 
'Peel the potatoes. Place them into a large pot and fill the pot with enough water to cover them.
Bring the water to a boil, lower the heat, and simmer until the potatoes are soft (about 20–30 minutes).
Drain the potatoes well in a colander, place them in a bowl, and mash them, using a hand mixer or potato masher.
Add the egg yolks, cornstarch, breadcrumbs, salt, and pepper.
Rinse out the pot and refill it with water and heat the water to boiling.
While the water is heating, shape the potato mixture into golf-ball sized dumplings.
Roll the dumplings in flour, and drop immediately into boiling water for 15 to 20 minutes.
Serve with butter and salt.');
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (32,7,
'Six 12oz bottles of beer included.');


INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (33, 7, 
'1¼ cups white rice, 1 medium onion, chopped, 1 pound boneless, skinless chicken breast
, 2 teaspoons vegetable oil, 1 can (6-ounce) tomato paste, 3 cups chicken broth');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (33, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (33, 9, 
'In a saucepan sauté rice and onion in oil.
Cover and cook until onion is translucent and soft.
Cut chicken into ½-inch cubes and add to sauté mixture.
Mix in tomato paste and then broth.
Bring mixture to a boil.
Cover pan and reduce heat to low.
Cook until rice is tender, liquid is absorbed, and chicken is cooked, about 20 to 25 minutes.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 5, 'white');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (34, 6, '10%');		

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (35, 7, 
'8 cups (4 cans) chicken broth, 1 cup uncooked rice, 3 eggs, 3 Tablespoons lemon juice, 2 Tablespoons salt.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (35, 8, 'na');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (35, 9, 
'In a large pot, bring broth to a boil over medium to high heat and add salt.
Add rice, cover, and simmer on low heat for 20 minutes. Remove from heat.
In a mixing bowl, beat eggs well. Add lemon juice to eggs while stirring constantly.
Slowly pour 1½ cups of hot chicken broth into egg-lemon mixture, stirring constantly.
Add egg mixture to rest of broth-rice mixture. Continue to stir. Heat on low heat without boiling.
Serve with toasted pita bread.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (36, 7, 
'2 medium eggplants, thinly sliced, 3 Tablespoons olive oil, 2 medium onion, diced, 2 green peppers, seeded and diced
, 4 cloves garlic, minced, 1½ pounds ground lamb or beef, 2 teaspoons paprika, ½ teaspoon black pepper
, ¼ teaspoon salt, ½ teaspoon cinnamon, ¾ cup plain yogurt, 4 egg yolks, 1 Tablespoon flour');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (36, 8, 'na');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (36, 9, 
'In a large skillet, heat the olive oil and brown the onion, peppers, and garlic.
Add the ground meat, paprika, pepper, salt, and cinnamon.
When the meat is crumbled and cooked, put it in a bowl and set aside.
Sauté the eggplant slices in the skillet, adding more oil if needed.
Brown on both sides, remove, and set aside.
In a large casserole dish, alternate layers of the eggplant and the meat mixture.
Preheat oven to 350°F.
Place cover or aluminum foil over the dish. Bake for 45 minutes.
In a mixing bowl, beat together the yogurt, egg yolks, and flour. Remove the casserole from the oven and remove cover.
Spread the yogurt mixture over the top of the moussaka.
Return uncovered casserole to the oven and bake for 15 minutes. Serve hot.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (37, 6, '40%');	
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (38, 7, 
'½ pound radishes (about 20), 12 fresh mint leaves, finely chopped, Our mix containing ⅔ orange juice and ⅓ lemon juice');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (38, 8, 'vegan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (38, 9, 
'Trim the ends and slice the radishes.
Combine sliced radishes with mint leaves, salt, and orange and lemon juice mix in a bowl and serve as a salad.');
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 1, '5');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (39, 6, '30%');	
	
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (40, 7, 
'2 packages active dry yeast, ¼ cup honey, 2 Tablespoons vegetable oil, 1 teaspoon salt
, ¾ teaspoon ground nutmeg, 4 cups flour, ¼ teaspoon instant coffee, 2 Tablespoons milk');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (40, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (40, 9, 
'Preheat oven to 350°F.
Dissolve the yeast in a large bowl in warm water.
Stir in honey, oil, salt, nutmeg, and 2 cups of the flour.
Beat until very smooth, about 1 minute.
Gradually add enough of the remaining flour to make a stiff dough.
Turn dough onto a lightly floured surface; knead until smooth, about 5 minutes.
Place in a greased bowl, cover, and let rise in a warm place until about double in size, about 50 minutes. Punch down on dough.
Press in greased jelly roll plan (about 15x10x1-inch).
Cut dough into about 2½-inch squares with a sharp knife, cutting two-thirds of the way through the dough.
Cover and let rise until double in size, about 30 minutes.
Dissolve the instant coffee in the milk and brush over the dough.
Bake until the bread is golden brown, about 35 minutes.
Break the bread into squares to serve.');
	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (41, 7, 
'2 cups long grain rice, 1 cup Haitian black mushrooms (or dried, black European mushrooms), 2 cloves garlic, finely chopped, 4 Tablespoons butter');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (41, 8, 'vegetarian');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (41, 9, 
'Preheat oven to 350°F.
Dissolve the yeast in a large bowl in warm water.
Stir in honey, oil, salt, nutmeg, and 2 cups of the flour.
Beat until very smooth, about 1 minute.
Gradually add enough of the remaining flour to make a stiff dough.
Turn dough onto a lightly floured surface; knead until smooth, about 5 minutes.
Place in a greased bowl, cover, and let rise in a warm place until about double in size, about 50 minutes. Punch down on dough.
Press in greased jelly roll plan (about 15x10x1-inch).
Cut dough into about 2½-inch squares with a sharp knife, cutting two-thirds of the way through the dough.
Cover and let rise until double in size, about 30 minutes.
Dissolve the instant coffee in the milk and brush over the dough.
Bake until the bread is golden brown, about 35 minutes.
Break the bread into squares to serve.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 1, '5');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (42, 6, '30%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (43, 7, 
'2 Tablespoons olive oil, 2 Tablespoons butter, 3 onions, finely chopped, 1 pound lean beef stew meat, 4 potatoes, peeled and sliced thin
, 1 cup beef broth, 1 small can tomato paste, 4 Tablespoons paprika, 1 bay leaf, 1 cup sour cream, loaf of hungarian bread');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (43, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (43, 9, 
'Heat olive oil and butter in a large pot.
Add onions and beef, and cook until beef is browned on all sides and onions are softened.
Add remaining ingredients, except sour cream, and stir gently with a wooden spoon.
Heat until liquid begins to bubble.
Reduce heat to low, cover, and simmer stew 1½ to 2 hours.
Stir in sour cream and simmer about 15 more minutes.
Serve with crusty bread.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 5, 'black');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (44, 6, '30%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (45, 7, 
'2 pounds boneless chicken thighs or breasts, skin removed, ½ cup plain yogurt, 2 teaspoons turmeric, ground, 1 teaspoon paprika
, ½ teaspoon chili powder, ½ teaspoon garlic powder, ½ teaspoon garam masala , 1 lemon, 1 Onion, instant rice');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (45, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (45, 9, 
'Prick each piece of chicken with a fork. Rub the pieces with salt and black pepper.
In a separate bowl, combine the yogurt, ground turmeric, paprika, chili powder, garlic powder, salt, and garam masala. Mix well.
Drop each piece of chicken into a bowl and coat with the yogurt mixture.
Place the chicken in a glass baking dish and cover with plastic wrap; refrigerate for at least 1 hour. (The chicken can be refrigerated overnight).
Preheat the oven to 350°F. Bake the chicken, uncovered, for about 30 to 40 minutes. (When pricked with a fork, the juice that runs out of the chicken should be clear.)
When thoroughly cooked, place the chicken on a serving plate.
Slice the lemon and squeeze the juice on top before serving. Top with the sliced onions if desired.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 5, 'tan');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46, 6, '40%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (46,7,
'A bottle of Espolòn Tequila Reposado (size dependent on your choice)
A bottle of the Golden Ginger Margarita cocktail ingredients batched together
A jigger to help you measure out each cocktail
A menu with instructions on how to mix your cocktail
High-quality Sourced branded cups.');
	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (47, 7, 
'Vegetable oil, to deep-fry the tofu, 1 cup tofu, cut into bite-sized cubes, 1 container dark soy sauce, Coriander, parsley leaves,  scallions to garnish.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (47, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (47, 9, 
'Heat the oil in a deep fry pan and deep-fry the tofu cubes until crispy and golden brown.
Remove the cubes and drain on paper towels; place on a serving dish.
Pour the soy sauce over the cubes, garnish, and serve.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (48, 6, '40%');		
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (49, 7, 
'1 jar grape leaves, 1½ cups uncooked rice, 1 medium onion, diced, ¼ cup olive oil, ½ cup fresh parsley, chopped
, 2 Tablespoons fresh dill, chopped, 1 teaspoon fresh mint, chopped, ¼ cup feta cheese, crumbled, ½ cup pine nuts, ½ cup raisins, ½ cup lemon juice');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (49, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (49, 9, 
'In a saucepan, sauté the onion in olive oil until light brown.
Add rice and brown lightly.
Add the water, salt, and pepper.
Bring the water to a boil and simmer for 5 to 7 minutes, or until water is absorbed but rice is only partially cooked.
Make certain rice does not stick or burn.
Add all the ingredients except the lemon juice and mix well.
Drain the grape leaves and place 1 Tablespoon of filling in the center of each leaf.
Fold the sides in and roll the leaf up.
Place stuffed leaves in a pot in even and tight rows covering the bottom of the pan. When the bottom layer is complete, 
start another layer. Continue rolling dolmas until all of the filling is used.
Add ½ of the lemon juice and enough water to cover half of the rolled leaves.
Place a plate on the top layer to hold the stuffed leaves down and to prevent them from unrolling while cooking.
Simmer over low heat until most of the liquid is absorbed, about 45 minutes.
Remove the plate and dolmas from the pan, drizzle with olive oil and lemon juice, and serve. May be served warm or at room temperature. Serve with Yogurt and Mint Sauce');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 5, 'white');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (50, 6, '40%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (51, 7, 
'1 cup dried prunes, pits removed, 1 cup dried apples, 1 cup dried apricots, 2 pounds beef, cut into cubes, 3 Tablespoons vegetable oil
, 1 Tablespoon sugar, 1 Tablespoon cinnamon, 1 teaspoon black pepper, ½ teaspoon salt, ⅓ cup tomato sauce, 1 pre cooked rice package');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (51, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (51, 9, 
'In a saucepan, sauté the onion in olive oil until light brown.
Add rice and brown lightly.
Add the water, salt, and pepper.
Bring the water to a boil and simmer for 5 to 7 minutes, or until water is absorbed but rice is only partially cooked.
Make certain rice does not stick or burn.
Add all the ingredients except the lemon juice and mix well.
Drain the grape leaves and place 1 Tablespoon of filling in the center of each leaf.
Fold the sides in and roll the leaf up.
Place stuffed leaves in a pot in even and tight rows covering the bottom of the pan. When the bottom layer is complete, 
start another layer. Continue rolling dolmas until all of the filling is used.
Add ½ of the lemon juice and enough water to cover half of the rolled leaves.
Place a plate on the top layer to hold the stuffed leaves down and to prevent them from unrolling while cooking.
Simmer over low heat until most of the liquid is absorbed, about 45 minutes.
Remove the plate and dolmas from the pan, drizzle with olive oil and lemon juice, and serve. May be served warm or at room temperature. Serve with Yogurt and Mint Sauce');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (52,7,
'Six 12oz bottles of beer included.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (53, 7, 
'4 cups flour, 1 teaspoon baking soda, 1 teaspoon salt, ¾ cup raisins, 2 Tablespoons caraway seeds, 1 cup buttermilk');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (53, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (53, 9, 
'Preheat oven to 425°F.
Mix flour, baking soda, and salt in a bowl. Add raisins and caraway seeds.
Add buttermilk all at once and mix.
Knead the dough on a lightly floured board. (To knead, press the dough flat, fold it in half, turn the dough, and repeat.) Form into a round loaf on a well-greased baking sheet.
With a knife, carefully mark an X across the top of the loaf. Lay a piece of foil over the loaf. Bake for 5 minutes.
Lower heat to 250°F and bake 30 minutes more. Remove foil and bake another 10 minutes, until the loaf is slightly browned.
Cut into wedges and serve with butter.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (54, 7, 
'4 potatoes, thinly sliced, 4 medium onions, thinly sliced, 6 carrots, sliced
, 1 pound Canadian bacon, , 3 pounds lamb chops, 1-inch thick, trimmed, and cut into small pieces, 4 potatoes,, Fresh parsley');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (54, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (54, 9, 
'To make Irish stew, all the ingredients are assembled in layers in a large stew pot.
Begin with layers of sliced potatoes, onions, and carrots.
Top with a layer of Canadian bacon and lamb.
Sprinkle liberally with salt and pepper.
Repeat these steps until all the ingredients are used.
Add enough water to just cover the ingredients.
Arrange the halved potatoes on top of the stew, but not in contact with the water, so they can steam as the rest is cooking.
Simmer over a very low heat for about 2 hours.
Sprinkle liberally with the chopped parsley and serve in soup bowls.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (55, 6, '40%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (56, 7, 
'1 pound fresh halibut, ½ cup fresh lime juice, ⅓ container cocount milk, 2 carrots
, 1 cucumber, 2 small vine-ripe tomatoes,, ½ bunch green onions, , chives and parsley, , 2 limes');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (56, 8, 'low carb');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (56, 9, 
'Cut the tuna into ½-inch thick strips about 2 inches long.
In a large bowl (preferably glass or stainless steal) combine the lime juice, coconut milk, and salt; stir to mix.
Add the tuna, carrot, cucumber, tomato, green onions, chives, and lime zest. Stir to mix. The lime juice "cooks" the fish. Taste for seasoning.
Serve immediately.');



INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57, 6, '7%');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (57,7,
'Six 12oz bottles of beer included.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (58, 7, 
'5 ripe tomatoes, large green pepper, 3 cloves of garlic, 1 medium onion
, 2 Tablespoons oil, for frying, 2 Red peppers, 6 eggs');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (58, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (58, 9, 'Cut the tomatoes into cubes and the green pepper into thin strips. Place them in the bowl.
Peel the garlic and onion, and chop both into tiny pieces. Heat oil in the frying pan until it sizzles. Add the onion and garlic.
Turn the heat down to medium and fry vegetables until they turn golden brown.
Add tomatoes, green pepper, salt, and red pepper. Cover the pan, and simmer the mixture over low heat until the tomatoes are soft.
Carefully crack open the eggs (try not to break the yolks) and drop them on the vegetables.
Cover the pan and keep cooking the mixture at the lowest heat for 10 more minutes or until the eggs are set.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59, 6, '7%');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (59,7,
'Six 12oz bottles of beer included.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (60, 7, 
'2 cups dried white beans, 1 onion, , 2 cups canned Italian-style tomatoes, with juice, 1 cup each of celery and carrots, 
, 3 cloves garlic, , ½ pound cooked smoked ham, , 3 bay leaves, 1 cup macaroni , ½ cup Parmesan cheese');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (60, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (60, 9, 
'Place water and beans in saucepan.
Bring to a boil over high heat for 3 minutes and remove from heat.
Cover and set aside for 1 hour.
Add the onion, tomatoes, celery, carrots, garlic, smoked ham, and bay leaves.
Mix well and bring to a boil over high heat.
Reduce to simmer, cover, and cook until beans are tender (about 1½ hours). Stir frequently.
Add macaroni and mix well. Cover and continue simmering until macaroni is tender (about 12 minutes).
Remove and throw out bay leaves before serving.
Serve hot soup in individual bowls with a side dish of Parmesan cheese for the guests to sprinkle into their soup. Serve with crusty bread to dip in the soup.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (61, 7, 
'1 cup butter , ½ cup heavy cream, ½ cup Parmesan cheese, , 1 pound fettuccini ');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (61, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (61, 9, 
'Cook pasta according to directions on package. Warm a serving bowl in the oven set to the lowest temperature until ready to use.
Place butter or margarine in a mixing bowl, and using a wooden spoon, beat until light and fluffy. Gradually add cream and mix until well blended.
Add the cheese by Tablespoon, beating well after each addition.
Using oven mitts, remove the heated serving bowl from oven and place on a heatproof work surface.
Place the drained, cooked pasta in the warm bowl and add cheese mixture.
Make sure all the pasta is coated with the sauce.
Add salt, pepper, and nutmeg to taste and continue to coat pasta.
Serve while very hot with a side dish of grated cheese.
The dish goes well with a green salad with Italian dressing and warm garlic bread.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 5, 'red');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (62, 6, '12%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 2, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 4, '3');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 5, 'red');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (63, 6, '12%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (64, 6, '60%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (65, 7, 
'1 pound skinless chicken breasts, 1 jalapeno pepper, seeded and diced, 2 limes
, 2 lemons, 2 teaspoons allspice, 4 cloves garlic, 1 small onion, chopped, ½ teaspoon ginger
, ½ teaspoon cumin, ¼ teaspoon dried thyme');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (65, 8, 'low carb');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (65, 9, 
'Combine all ingredients except the chicken into a blender and blend to a paste.
Pour into a shallow baking dish or sealable plastic bag.
Add chicken and turn to coat.
Cover and place in refrigerator to marinate for at least 2 hours, or overnight.
Remove chicken from marinade and pour marinade into a saucepan. Bring to a boil.
Chicken may now be cooked on a grill or baked in the oven. To grill, preheat the grill. 
Remove chicken and place chicken on a grill. 
Cook approximately 7 to 10 minutes per side until done, basting with boiled marinade.
To bake: Preheat oven to 350°F. Place chicken in a baking dish and bake 20 to 25 minutes. After 15 minutes, baste with remaining marinade.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (66, 6, '40%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (67, 7, 
'4 scallions, 1 pound tofu, 2 cups dashi (Japanese fish stock), 2 Tablespoons red miso');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (67, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (67, 9, 
'Wash the scallions and cut the green parts into 1½-inch lengths.
Cut the tofu into small cubes and place the scallions and tofu in soup bowls.
Boil the dashi (broth) in a saucepan.
Put a little of the boiling liquid in a bowl and mix with the miso .
Pour back into the saucepan, then ladle into the soup bowls.
Serve immediately.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (68, 7, 
'Small bamboo mat (makisu) for preparing sushi, Dry seaweed sheets (nori), 1 Tablespoon vinegar
, Wasabi (dried horseradish powder), Strips of avocado, cucumber, and carrot, Cooked crab meat.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (68, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (68, 9, 
'Place a sheet of nori (dry seaweed), shiny side down, on the makisu (bamboo mat).
Wet your right hand (or left hand, if you are left-handed) in the bowl of vinegar water, and use it to scoop up a ball of rice.
Spread the rice out in an even layer on one side of the nori .
Sprinkle a line of wasabi (horseradish powder) down the center of the rice.
Arrange the strips of vegetables and seafood over the line of wasabi .
Using the mat to support the nori , lift one end of the mat to gently roll the nori over the rice and other ingredients.
Use gentle pressure to compact the rice and other ingredients so that they hold together.
Continue rolling until a long cylinder is formed, completely encased in nori .
Carefully slice through the nori and other ingredients to make the bites of sushi .
Serve immediately so the nori will still be crispy.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (69, 6, '30%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (70, 7, 
'1 cup medium cabbage, chopped, 1 cup carrots, thinly sliced, 1 cup cauliflower, 
, 2 green onions, 3 cloves garlic, , 1 teaspoon crushed red pepper1 teaspoon fresh ginger');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (70, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (70, 9, 
' Combine cabbage, carrots, and cauliflower in strainer and sprinkle with salt.
Toss lightly and set in sink for about one hour and allow to drain.
Rinse with cold water, drain well and place in a medium-size bowl.
Add onions, garlic, red pepper and ginger.
Mix thoroughly.
Cover and refrigerate for at least 2 days, stirring frequently to mix flavors.
Allow kimchi to sit for 1 or 2 days to ferment. The longer it sits, the spicier it will become.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (71, 7, 
' 1 pound ground beef, 1 cup vegetable oil, 1 Tablespoon vegetable oil, small onion
, ¾ cup cabbage, shredded, ½ cup bean sprouts, 1 green onion,
, 25 wonton wrappers 1 egg');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (71, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (71, 9, 
'In a large frying pan or wok, cook meat until brown, mashing with a fork to break into small pieces. Remove meat, using a slotted spoon to drain off fat, and set meat aside in a bowl.
Once cool, wash frying pan or wok and dry thoroughly.
Heat 1 Tablespoon vegetable oil over high heat for 1 minute.
Add onions and cook 2 to 3 minutes or until crisp and tender.
Add cabbage and continue to cook, stirring frequently until cabbage is crisp and tender.
Add bean sprouts and green onion, mix well, and cook for 1 to 2 minutes more.
Remove pan from the heat and drain vegetable mixture.
In a large bowl, combine meat, vegetables, salt and black pepper and mix well to make the filling.
Place 1 wonton wrapper on a flat surface and cover remaining wrappers with a damp paper paper towel (not dish towel) so they wont dry out.
Beat the egg in a small bowl. Brush all 4 edges of the wonton wrapper with the beaten egg.
Place about 1 Tablespoon of the filling mixture just above the center of the wonton wrapper.
Fold wrapper in half over filling and press the edges together to seal, forming a dumpling.
In a large frying pan or wok, heat 1 cup vegetable oil over medium heat for 1 minute.
Carefully place 6 dumplings into oil with tongs and fry 3 to 4 minutes or until golden brown.
Turn and fry the other side, 2 to 3 minutes.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (72, 6, '30%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (73, 7, 
'2 cups cracked wheat (bulgur), 2 pounds lean ground beef or lamb, 1 medium onion, very finely chopped
, ½ teaspoon allspice , half stick of butter.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (73, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (73, 9, 
'Preheat oven to 375°F.
Place cracked wheat in a large mixing bowl and cover with the cold water.
Let stand 5 minutes, and then drain. Press on grains to remove water.
Add the remaining ingredients and mix well.
Process in batches in a food processor fitted with the chopping blade or a blender.
Butter a 9x12-inch baking pan.
Spread the mixture into the pan, smoothing the top with wet hands.
Cut into 2-inch squares. It is traditional to cut the kibbeh into a diamond pattern.
Pour melted butter over the top. Bake for 50 minutes.
Serve with pita bread.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (74, 7, 
'¾ cup cracked wheat, finely ground, 1 container of fresh tomatoes, diced, 2 Tablespoons dried mint
, 2 bunches of parsley, , 1 bunch of green onions,, one lemon, ¼ cup olive oil, 1 pack of pita bread');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (74, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (74, 9, 
'In a bowl, cover cracked wheat with warm water and let stand about 15 minutes. Drain thoroughly.
Mix tomatoes, mint, parsley, onions, lemon juice, olive oil, and salt and pepper in a separate bowl.
Add the drained wheat and mix well.
Add more lemon juice and olive oil, if needed. Refrigerate at least 1 hour.
Serve in a bowl, or on a bed of lettuce leaves, with pita bread cut into triangles.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (75, 6, '60%');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (76, 7, 
'1½ ounces compressed yeast, 3 cups sugar, ⅛ teaspoon cinnamon
, 3 cups butter, at room temperature, 10 cups flour, 9 eggs, canned fruits to decorate.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (76, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (76, 9, 
'Make the dough: Crumble the yeast into the warm water and set aside.
In a large mixing bowl, mix together sugar, cinnamon, and butter.
Add the eggs, mixing thoroughly.
Add the dissolved yeast.
Slowly add the flour, a little at a time, until the dough is smooth and stretchy.
On a large baking sheet, shape the dough into a ring, pressing the ends together to make a full circle.
Cover the ring with a clean cloth or dish-towel and let sit in a warm place (to rise) for 2 hours.
Preheat oven to 350°F just before baking.
Make the paste : Mix together the butter and sugar, add in the egg, and gradually mix in flour.
This paste can be used to decorate the top of the cake once it has risen but before it is baked. The typical decoration is rays that come out from the center.
Candied fruits may be pressed into the cake before baking.
Bake 30 to 40 minutes, until cake is golden brown.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 6, '40%');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (77, 7, 
'Set of Rocks Glasses, Stainless Cocktail Shaker & Jigger,  Citrus Squeezer,  Rokz Lime Infused Margarita Salt, Recipe Cards.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (78, 7, 
'5 slices bread, 2 Tablespoons oil, 4 Tablespoons sugar
, 4 cups milk, Saffron powder, to taste (optional), Raisins or prunes (dried plums)');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (78, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (78, 9, 
'Remove the crusts from the bread with a knife. Cut the bread into four triangular pieces.
Heat the oil in a frying pan (over medium heat) and fry the bread pieces one at a time on both sides until golden brown.
In a saucepan, add the milk and sugar and bring to a boil, making a slightly thick sauce.
Add the saffron to the sauce (optional). Reduce heat to low.
Soak the bread slices in the milk sauce and garnish with the raisins or prunes (dried plums). Serve immediately.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 4, '5');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 5, 'orange');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (79, 6, '0%');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (80, 7, 
'1 package dry yeast, 2 Tablespoons sugar, 1 egg, lightly beaten
, 1 can (16-ounce) pumpkin, ½ teaspoon salt, 4 cups flour, Maple syrup');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (80, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (80, 9, 
'In a large bowl, sprinkle the yeast over the lukewarm water and stir to dissolve.
Add the sugar, egg, pumpkin, and salt; combine thoroughly.
Add the flour, ½ cup at a time, until the dough becomes too stiff to beat with a wooden spoon.
Turn the dough out onto a lightly floured board and knead in enough of the remaining flour to prevent the dough from sticking to your fingers.
Continue kneading until the dough is smooth and elastic (about 8 minutes).
Shape it into a ball and place in a greased bowl. Cover and let rise in a warm place for 1 hour, or until doubled in size.
Punch down the dough and tear off pieces, shaping into doughnut-like rings, about 3 inches in diameter.
Heat about 1-inch of oil in a deep skillet and fry the fritters for about 5 minutes, turning them once, until crisp and golden brown.
Drain on paper towels and serve immediately with warm maple syrup.');		
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (81, 6, '24%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (82, 7, 
'12 eggs, 2 (13-ounce) cans evaporated milk, 1 (14-ounce) can sweetened condensed milk, 1 teaspoon vanilla, 2 cups sugar');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (82, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (82, 9, 
'Separate the egg yolks from the egg whites one at a time. Place the egg yolks in a large mixing bowl. (Discard the egg whites or reserve them for another use.)
Add the rest of the custard ingredients to the mixing bowl.
Stir lightly when mixing to prevent bubbles or foam from forming. Remove the caramel-lined dish from the refrigerator and pour the custard mixture slowly into it.
Preheat oven to 325°F.
Cover the custard dish with aluminum foil. Set it into a large shallow pan (such as a cake pan). Pour water into the larger pan until it is about one-inch deep. 
This is called a water bath.
Bake in oven for 1 hour, or until the custard is firm. Cool to eating temperature. May be served warm or chilled');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 5, 'brown');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83,7,
'Six 12oz cans of beer included.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (84, 7, 
'3 cups flour, 1 egg, Dash of salt, 3 medium apples, peeled, cored, and cut up in small pieces
, 2 Tablespoons plain breadcrumbs, Sour cream and confectioners sugar as garnish');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (84, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (84, 9, 
'Make dough: Combine the flour with the egg, a dash of salt, and as much water as needed to form a smooth, loose dough that is easy to handle.
Roll with a rolling pin or bottle until it is very thin. Using a drinking glass or biscuit cutter, cut out circles 2 inches in diameter.
Make filling: Mix the cut-up apples with the breadcrumbs.
Assemble pierogi: Place a spoonful of apple mixture in the center of each dough circle.
Fold the dough circle in half and press around the edges firmly to seal.
Fill a large pot with water and heat until the water begins to boil.
Drop the pierogi gently into the boiling water and cook until they float to the surface.
Remove with a slotted spoon, allow the water to drain off, and place the pierogi on a serving platter.
Top with sour cream or confectioners sugar.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (85, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (85, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (85, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (85, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (85, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (83, 6, '35%');		

	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (86, 7, 
'4 large potatoes, 2 carrots, 4 hardboiled eggs, 1 onion, 2 dill pickles
, 1 container frozen peas, 1 container bologna, 1 container mayonnaise, 6 large lettuce leaves');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (86, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (86, 9, 
'Peel the potatoes, cut them in half, and place them in a saucepan. Cover the potatoes with water, heat over high heat until the water boils, and simmer until the potatoes can be pierced with a fork (about 15 to 20 minutes). Drain and allow to cool.
Repeat the same process with the two carrots.
When both are cooled, cut into cubes and place in a large mixing bowl.
Add remaining ingredients (except mayonnaise) and toss gently to combine.
Stir in 2 Tablespoons of mayonnaise, or enough mayonnaise to hold ingredients together.
Arrange clean, dry lettuce leaves on a platter, and mound the salad in a pyramid shape in the center.
Spread more mayonnaise over the top of the salad like frosting.
Garnish with hardboiled egg slices.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 1, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 2, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 3, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 4, '1');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (87, 6, '45%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (88, 7, 
' 6 large fresh tomatoes, 1 medium green pepper, 1 small white onion, 1 large cucumber, 4 Tablespoons red wine vinegar
, ¼ teaspoon tarragon, 1 teaspoon sugar, 3 cloves garlic, 1 cucumber, 1 avacado, 1 loaf of bread');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (88, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (88, 9, 
'Place ingredients in a blender or food processor and blend until almost smooth.
Transfer to a large bowl, cover with plastic wrap, and chill at least 2 hours or overnight.
Serve in small bowls. Top with the diced cucumber, and diced avocado. Served with bread, gazpacho makes an excellent summer meal or first course.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 3, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 5, 'red');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (89, 6, '14%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (90, 7, 
' 1½ pounds ground beef, ½ pound ground lean pork, 2 eggs
, ½ cup breadcrumbs, 1 onion, half stick of butter');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (90, 8, 'vegan');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (90, 9, 
'Combine ground beef and ground pork in a large mixing bowl.
Melt butter in a saucepan, add chopped onion, and cook until onion is golden (do not burn).
Add cooked onions and all the other ingredients to the ground meat and mix thoroughly by hand until smooth.
Shape the mixture into balls with a spoon dipped in hot water or using your hands.
Place the balls in the remaining butter in the same saucepan used to prepare the onions, and brown evenly.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (91, 6, '45%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (92, 7, 
' 1 pound skinless, boneless chicken breast, 1 teaspoon black pepper, 1 teaspoon ground cumin, 1 teaspoon ground coriander
, ½ teaspoon turmeric, 1 teaspoon chopped garlic, 1 Tablespoon sugar, 1 Tablespoon vegetable oil, 1 Tablespoon soy sauce
, 1 Tablespoon lemon juice, 1 teaspoon fish sauce, Container of coconut milk, Fresh coriander leaves, Lettuce');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (92, 8, 'low carb');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (92, 9, 
'Slice chicken breasts into thin slices lengthwise. Each slice should be about 4 inches by 1 inch by ¼ inch. (Optional: place chicken in freezer for 15 to 20 minutes to make it easier to slice.) Place the chicken strips in a mixing bowl.
Add remaining ingredients, first the solids, then the liquids, to the bowl. Toss until well mixed.
Let the chicken marinate (absorb the flavoring) in the refrigerator for at least 2 hours and as long as 24 hours.
When ready to cook the satay, stir the chicken in the sauce and remove.
Thread each slice onto a skewer, pushing the skewer in and out down the middle of the slice.
Baste (rub) the chicken with oil or coconut milk and grill on a barbecue or under the broiler.
Cook for about 2 minutes on each side, watching carefully and turning to keep the chicken from burning.
Baste once more with oil or coconut milk. The satay is done when its golden brown and crispy along the edges. Serve with optional garnish with fresh coriander leaves.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (93, 7, 
'12 ounces of Pad Thai noodles, ¼ cup olive oil, garlic , 16 medium shrimp, shelled and deveined, 2 ounces firm brown tofu, cut into ¼-inch cubes
, 2 eggs, , ¼ cup crushed unsalted peanuts, 3 Tablespoons fish sauce, 2½ Tablespoons rice vinegar, 1 Tablespoon sugar 
, 1½ Tablespoons honey, 2 teaspoons paprika, ½ teaspoon crushed red pepper or cayenne pepper, 3 ounces fresh bean sprouts
, ¼ cup leeks, cut into 1½ to 2-inch-long shreds');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (93, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (93, 9, 
'In a large bowl, soak noodles in cold water 45 minutes.
Drain in a colander (special bowl with holes for draining) and set aside.
Heat olive oil in a large skillet over high heat.
Add garlic and sauté until lightly browned, about 1 minute.
Add shrimp and tofu and sauté 1 minute.
Add eggs and stir 30 seconds.
Add noodles, peanuts, fish sauce, vinegar, sugar, paprika, and red pepper and stir constantly for 3 minutes.
Remove from heat and transfer to a platter. Sprinkle with bean sprouts and leeks and serve.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (94,7,
'Six 12oz cans of beer included.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (95, 7, 
'1 pound dried apricots, 2½ cups sugar, 3 lemons
, 1 pound marscapone (sweet cheese); , 1 cup pistachio nuts ');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (95, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (95, 9, 
'Soak the apricots in cold water overnight and drain.
Heat the sugar and water together over medium heat for 10 minutes, then add apricots.
Cook the apricots until they are tender and syrup is formed.
Add the lemon juice and remove from heat. With a slotted spoon, transfer apricots to a plate to cool.
With a spoon, open the apricots halfway and fill the inside with cream or sweet cheese.
Arrange the apricots (slit side up) on a platter, pouring over them as much syrup as they can absorb. Garnish with grated nuts.');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 5, 'clear');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (96, 6, '45%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (97, 7, 
' 1 pound ground beef
1 medium onion, 4 Tablespoons vegetable oil, 1 container - microwave rice 1 container tomato juice
, 1 medium cabbage, core removed, 1 Tablespoon vinegar');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (97, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (97, 9, 
'To make filling: cook rice according to package directions.
In a frying pan, add the oil and heat over medium heat.
Brown the onions and hamburger.
Combine rice, onion, and hamburger in a mixing bowl. Season with salt and pepper. Set aside.
Preheat oven to 350°F.
In a large pot, bring the water and vinegar to a boil.
Place the cabbage into the pot and simmer long enough for the cabbage leaves to become limp, about 5 to 10 minutes. Do not overcook.
Remove cabbage and tear off cabbage leaves from the cabbage head.
Remove the hard center part of the leaf.
Place a spoonful of the rice mixture into the center of the leaf and roll tightly.
Place cabbage rolls into a casserole dish and cover with the tomato juice.
Bake for 1 to 1½ hours.');	

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (98, 6, '40%');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (99, 7, 
'1 cup flour, 1 stick of butter, 2 eggs, 2 cans mincemeat
, 1 container of milk, 1 container of powdered sugar.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (99, 8, 'vegetarian');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (99, 9, 
'Preheat oven to 400°F.
Make pastry (may use commercial piecrust instead, and skip steps 2 through 6).
Measure flour and salt into a bowl.
Add butter, and rub the flour and butter together with very clean fingertips or a large fork until crumbly.
Mix egg yolk with water and add to flour mixture, and combine well.
Wrap the dough in wax paper and refrigerate for about 30 minutes, or for up to 24 hours.
Dust the counter or cutting board lightly with flour, and roll out dough, using a floured rolling pin.
Cut into rounds about 3 inches in diameter.
Fit a round of dough into each cup of a 12-cup muffin pan.
Gather up the dough scraps and cut out a second set of rounds for the top crusts. (These can be slightly smaller).
Put 1 tablespoon of canned mincemeat into each cup.
Dampen the edges of the pastry with a little water or milk, place the second round on the top, pinching the edges together to seal.
Using the tip of a sharp knife, make a small hole in the pastry top of each pie.
Using a pastry brush, brush the pastry with milk and dust with a little powdered sugar.
Bake for about 25 minutes, until light golden brown. Cool before serving.');	
	
	
INSERT INTO details(product_id, quality_id, quality_details)
VALUES (100, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (100,7,
'Six 12oz cans of beer included.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (101, 7, 
'3 cans beef broth, 2 carrots, fresh ginger, 1 cinnamon stick, 1 star anise
, 2 whole cloves, 2 cloves garlic, 2 teaspoons black peppercorns, 3 Tablespoons fish sauce, ½ pound roast beef 
, 1 onion, bean sprouts, fresh cilantro, 1 bunch fresh basil, 2  chilies, 2 limes, 1 package rice noodles.');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (101, 8, 'na');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (101, 9, 
'Make broth by pouring contents from three cans of broth into a large saucepan.
Add carrots, ginger, cinnamon, star anise, cloves, garlic, and peppercorns.
Simmer covered for 20 minutes.
Add fish sauce and simmer about 5 more minutes.
Strain by pouring through a colander.
To serve, arrange the following on a platter: beef, onion, bean sprouts, cilantro, basil, chilies, lime wedges, and noodles.
Ladle the broth into bowls, and serve.
Each person chooses items from the platter to add to his or her bowl of broth.');
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 1, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 3, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 4, '4');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 5, 'brown');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102, 6, '7%');		
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (102,7,
'Six 12oz cans of beer included.');

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 5, 'pink');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (103, 6, '7%');		

INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 1, '4');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 2, '1');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 5, 'pink');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (104, 6, '7%');		
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 5, 'white');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (105, 6, '7%');	
	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 1, '3');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 2, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 3, '2');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 4, '2');	
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 5, 'white');
INSERT INTO details(product_id, quality_id, quality_details)
	VALUES (106, 6, '7%');	
	
	
	
	
	
	
	
	
	
	
	
	
--Picture
INSERT INTO picture(product_id, picture_filepath)
	VALUES (1, '/Algeria/Food/Saffron and Raisin Couscous with Fresh Mint.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES (2,'/Algeria/Food/Sahlab.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 3, '/Algeria/Drink/fleur-d-aboukir-rose.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 4, '/Algeria/Drink/sahara-wine-from-algeria.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 5, '/Argentina/Food/Chimichurri-Sauce-SQ-1.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 6, '/Argentina/Drink/001398026-1.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 7, '/Argentina/Food/Chicken-Empanada-14.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 8, '/Australia/Food/classic-meat-pies-2.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 9, '/Australia/Drink/Best-Australian-liquor-Brands-mr-black.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 10, '/Brazil/Food/brazilian-beef-feijoada-127520-1.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 11, '/Brazil/Drink/large.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 12, '/Canada/Food/Sweet-Corn-Pancakes-2-1.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 13, '/Canada/Drink/deluxe_1080x_5bbe4b77-7f97-4d7b-9028-1d18dac80380_720x.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 14, '/Chile/Food/Receta-de-pastel-de-choclo-chileno.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 15, '/Chile/Drink/CATAN-PISCO-PISCO-SOUR-KIT-01-copy-scaled-458x458.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 16, '/China/Drink/vinnbaijiu99.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 17, '/China/Food/wonton-soup-1.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 18, '/Cuba/Food/download.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 19, '/Cuba/Food/fried-ripe-plantains-recipe-2138201-hero-01-3966461e0fa14261a80d4eb634d1ccab.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 20, '/Cuba/Drink/The-Mojito-Deluxe-Kit_976fc00e-57b4-43c2-aea9-515331363cc1_375x.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 21, '/Czech Republic/Food/bila-houbova-polevka120625705-jpg_irecept-full.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 22, '/Czech Republic/Drink/becherovka-420x458.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 23, '/Egypt/Food/kushari-koushari-egyptian-dish-lentils-rice-pasta-chickpeas-tomato-sauce-crispy-onions-arabic-cuisine-kushari-119686692.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 24, '/Egypt/Drink/SakaraGoldCan500mlBazarSakara_grande.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 25, '/Ethiopia/Food/s965967428771160256_p37_i1_w1863.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 26, '/Ethiopia/Drink/shopping.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 27, '/France/Food/8-3-large.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 28, '/France/Food/edcf022021ae486cb7c6978f65ead60a.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 29, '/France/Drink/11937.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 30, '/Germany/Food/14524_wisconsin-brats_ddmfs_4x3_1149-3bbb0beec69942ada6e196d2e0602a53.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 31, '/Germany/Food/bayerische-kartoffelknoedel-rezept-bild-nr-2.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 32, '/Germany/Drink/large.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 33, '/Ghana/Food/583d2633-65c0-43d6-9b52-cba0c8fa1399--2019-1210_nigerian-jollof-rice_3x2_rocky-luten_006.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 34, '/Ghana/Drink/shopping.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 35, '/Greece/Food/Avgolemono-Soup...Greek-Chicken-Soup-with-Lemon-3-of-7.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 36, '/Greece/Food/Moussaka-recipe-Traditional-Greek-Moussaka-with-Eggplants-750x497.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 37, '/Greece/Drink/12205792034846.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 38, '/Guatamala/Food/44-image_web.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 39, '/Guatamala/Drink/D734ABC1AC1F169100000000CF21190CAguardiente__Antioqueno_600x600.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 40, '/Haiti/Food/Haitian-bread-1.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 41, '/Haiti/Food/a54a2c36691f6179a9530271c18d9fca.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 42, '/Haiti/Drink/clairin-vaval-haitian-rhum-agricole-750ml-607697.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 43, '/Hungary/Food/hungarian-beef-goulash-marhaporkolt.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 44, '/Hungary/Drink/shopping.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 45, '/India/Food/tandoorichicken-8.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 46, '/India/Drink/shopping.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 47, '/Indonesia/Food/DWELL-tahu-Goreng-Krispi-Indonesian-Crispy-Fried-Tofu.jpeg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 48, '/Indonesia/Drink/arak-bali-dewi-sri-680ml.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 49, '/Iran/Food/Dolmas.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 50, '/Iran/Drink/shopping.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 51, '/Iraq/Food/brisket-with-fall-fruits-59-jpg.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 52, '/Iraq/Drink/large.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 53, '/Ireland/Food/Simply-Recipes-Irish-Soda-Bread-LEAD-02-2c255a6fe8f5409fb3333f9589db139d.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 54, '/Ireland/Food/traditional-irish-stew-recipe-435757-hero-01-7ec7d4b8688a424d93b080f000ab53ff.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 55, '/Ireland/Drink/whiskey.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 56, '/Islands of the Paciffic/Food/PoissonCru_a.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 57, '/Islands of the Paciffic/Drink/large.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 58, '/Israel/Food/Shakshuka-19.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 59, '/Israel/Drink/large.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 60, '/Italy/Food/pasta-fagioli-6.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 61, '/Italy/Food/Fettuccine-Alfredo-Recipe-1.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 62, '/Italy/Drink/sangiovese.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 63, '/Italy/Drink/mda.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 64, '/Italy/Drink/Romana-Sambuca-Liqueur_720x.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 65, '/Jamaica/Food/jamaican-jerk-chicken1-1662431390.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 66, '/Jamaica/Drink/appleton-estate-rare-casks-12yr-jamaican-rum-750ml-802670.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 67, '/Japan/Food/miso-soup-horizontal-jpg-1529350400.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 68, '/Japan/Food/crunchy-sushi-roll-recipe-6-480x360.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 69, '/Japan/Drink/soto-super-premium-junmai-daiginjo-sake-720ml-933551.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 70, '/Korea/Food/korean-sriracha-kimchi-recipe-2118867-hero-011-f6964d865b6246b180ddb843cdeb132d.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 71, '/Korea/Food/korean-dumpling-mandoo-2118676-hero-01-2e60dd10c6404f44ba00d6be80b63c0f.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 72, '/Korea/Drink/ScreenShot2022-07-22at10.56.09PM_3faaa568-0b60-4723-9b4d-211c50044841.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 73, '/Lebanon/Food/Kibbeh-Bil-Sanieh-15.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 74, '/Lebanon/Food/tabbouleh-recipe.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 75, '/Lebanon/Drink/Fakra-Arak_600x.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 76, '/Mexico/Food/three_kings_bread_2000x1125.jpeg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 77, '/Mexico/Drink/81d0sVRiynL._AC_SL1500_.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 78, '/Pakistan/Food/Shahi-Tukda-Thumbnail.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 79, '/Pakistan/Drink/mango lassi.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 80, '/Peru/Food/Pumpkin-fritters-ns.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 81, '/Peru/Drink/pisco-capel-sour-70cl_540x.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 82, '/Phillipines/Food/keto-flan2.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 83, '/Phillipines/Drink/433063-SAN-MIGUEL-PALE-PILS-BOTTLE03.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 84, '/Poland/Food/p06vw6pp.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 85, '/Poland/Drink/KRUPNIKHONEYLIQUOR.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 86, '/Russia/Food/Russian-Salad-Olivie-7.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 87, '/Russia/Drink/russian vodka.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 88, '/Spain/Food/bigstock-Spanish-Cold-Tomato-based-Soup-159395825.jpg');

INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 89, '/Spain/Drink/sangria.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 90, '/Sweden/Food/IMG_6419-4.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 91, '/Sweden/Drink/shopping.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 92, '/Thailand/Food/chicken-satay-thumb.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 93, '/Thailand/Food/pad-thai.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 94, '/Thailand/Drink/singha.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 95, '/Turkey/Food/4ef89add-2_1fce3940-960x960.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 96, '/Turkey/Drink/drink.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 97, '/Ukraine/Food/Holubtsi.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 98, '/Ukraine/Drink/96936-UKRANIAN-GORILOCHKA-750ML144.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 99, '/United Kingdom/Food/mincemeat-pie-3fp.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 100, '/United Kingdom/Drink/45259_1582d699-d0e1-46c4-82af-21177bdb3fa0_2000x.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 101, '/Vietnam/Food/pho.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES ( 102, '/Vietnam/Drink/beer.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES( 103, '/France/Drink/111636__89930.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES( 104, '/Spain/Drink/844655-CuneCavaRoseBrut.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES( 105, '/Germany/Drink/eiteehwvmp732usnymyn.jpg');
	
INSERT INTO picture(product_id, picture_filepath)
	VALUES( 106, '/Hungary/Drink/md3hpm33nem7wir9sjwf.jpg');
	

	