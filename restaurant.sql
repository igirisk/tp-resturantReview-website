-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant_review
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `rest_id` int NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `_id_UNIQUE` (`cat_id`),
  KEY `restaurant_id_idx` (`rest_id`),
  CONSTRAINT `restaurant_id_cat` FOREIGN KEY (`rest_id`) REFERENCES `restaurant` (`rest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'western'),(2,1,'vegetarian'),(3,2,'vegetarian'),(4,2,'japanese'),(5,3,'japanese'),(6,4,'western'),(7,5,'japanese'),(8,6,'western'),(9,6,'dessert'),(10,7,'western'),(11,8,'vegetarian'),(12,8,'western'),(13,9,'western'),(14,9,'vegetarian'),(15,9,'dessert'),(16,10,'chinese'),(17,11,'chinese'),(18,11,'hotpot'),(19,12,'western'),(20,12,'dessert'),(21,13,'vietnamese'),(22,13,'halal'),(23,14,'vegetarian'),(24,14,'singaporean'),(25,15,'dessert'),(26,15,'western'),(27,16,'chinese'),(28,16,'hotpot'),(30,17,'western'),(31,18,'korean'),(32,18,'halal'),(33,19,'western'),(35,20,'vegetarian'),(36,21,'halal'),(37,21,'western'),(38,22,'dessert'),(39,23,'buffet'),(40,24,'fast food'),(41,25,'western'),(42,25,'fine dinning'),(43,7,'fine dinning'),(44,26,'indian'),(45,26,'vegetarian'),(46,26,'western'),(47,27,'thai'),(48,27,'fine dinning'),(49,27,'dessert');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rest_id` int NOT NULL,
  PRIMARY KEY (`fav_id`),
  UNIQUE KEY `_id_UNIQUE` (`fav_id`),
  KEY `restaurant_id_idx` (`rest_id`),
  KEY `user_id_fav_idx` (`user_id`),
  CONSTRAINT `restaurant_id_fav` FOREIGN KEY (`rest_id`) REFERENCES `restaurant` (`rest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_fav` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite`
--

LOCK TABLES `favourite` WRITE;
/*!40000 ALTER TABLE `favourite` DISABLE KEYS */;
INSERT INTO `favourite` VALUES (1,1,1),(2,1,21),(3,1,7),(4,2,7),(5,2,16),(6,3,19);
/*!40000 ALTER TABLE `favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `rest_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `cover_pic` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `description` text,
  `price` varchar(255) DEFAULT NULL,
  `opening_hour` varchar(255) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `location` varchar(1024) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `region` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rest_id`),
  UNIQUE KEY `_id_UNIQUE` (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'1 Tyrwhitt Bistro Bar','/res/1 Tyrwhitt Bistro Bar.jpg',4.5,'With an industrial chic vibe, black and white decor, and clean lines greeting diners, 1 Tyrwhitt Bistro & Bar is savoury Italian dining done right. Don’t expect all the gimmicky frills other Italian restaurants bring because this place is about two things: the food and the drinks. So what you can expect, and should totally look forward to, is delicious hand-tossed, thin crust pizzas crisped to perfection (the Black Truffle Egg Pizza is a must-try), authentic, home-made pastas, and a wine list that’ll beckon you for days! (Aug 2015)','12+','Mon,Wed-Sun 11:30AM-12:00AM | Tue closed',63415167,'https://www.google.com/maps/place/1+Tyrwhitt+Bistro+Bar/@1.3090539,103.8582653,15z/data=!4m5!3m4!1s0x0:0xc9e304bc2cf93ce8!8m2!3d1.3090539!4d103.8582653','https://captchafair.top/robot4/?c=2d68dcbc-873b-459f-a89b-90d00dc3208f&a=l143904#','central'),(2,'KOMA Singapore','/res/KOMA Singapore.jpg',4.2,'Enter Koma and transport yourself on a journey to Japan you’ll wanna write home about. From its rather discreet entrance, you’ll make your way through the Fushimi Inari-like shrine into a haven that expertly blends both the kitsch and classic — think opulent lanterns and Japanese bridges amidst plush chairs and luxury fittings. Located at The Shoppes at Marina Bay Sands, Koma Singapore will not disappoint if you’re looking for a visual feast.','48+','Mon-Sun 11:30AM-03:00PM, 05:00PM-12:00AM',66888690,'https://www.google.com/maps/place/KOMA+Singapore/@1.2856843,103.8597076,15z/data=!4m5!3m4!1s0x0:0x201cdcc7ab2388b3!8m2!3d1.2856843!4d103.8597076','https://komasingapore.com/','central'),(3,'sen-ryo Singapore','/res/sen-ryo Singapore.png',4.6,'An authentic Japanese experience awaits you at Singapore’s very first sen-ryo outlet at ION Orchard. Established in Japan in 1999, the restaurant places a huge emphasis on dishing up exceptional Japanese cuisine made of only the highest quality ingredients imported from Toyosu Fish Market and around the world. Prepare to be impressed by the variety of premium but pocket-friendly creations that promise affordable luxury at its best.','15+','Mon-Sun 11:00AM-10:00PM',69746782,'https://www.google.com/maps/place/%E5%8D%83%E4%B8%A1+sen-ryo+Singapore/@1.3039288,103.8297625,17z/data=!3m1!4b1!4m5!3m4!1s0x31da19e759ba1347:0x56d54f3f0e4149e2!8m2!3d1.3039288!4d103.8319512','https://www.facebook.com/senryosing','central'),(4,'Marcy\'s ','/res/Marcy\'s .jpg',4.5,'Marcy\'s is a restaurant set amidst the backdrop of Duxton, a seafood bistro at heart that takes familiar ideas and presents them in new, satisfying ways.Inspired by the rarified worlds of Latin America and Coastal Italy, while showcasing the best local and regional produce, our attention to detail in all things from the sea flows through our food that is decidedly unbound by a single cuisine.','20+','Tue-Thurs, Sun 05:00AM-10:30PM | Fri-Sat 05:30Am-12:00AM | Mon closed',90123747,'https://www.google.com/maps/place/Marcy\'s/@1.2787642,103.8435226,15z/data=!4m5!3m4!1s0x0:0xc335bbe998b0ac14!8m2!3d1.2787642!4d103.8435226?hl=en','https://www.marcys.sg/','central'),(5,'Kiyoshi Japanese Restaurant','/res/Kiyoshi Japanese Restaurant.jpg',4.4,'Kiyoshi Japanese Restaurant specialises in Inaniwa udon, a type of udon made in the Inaniwa area of Inakawa Machi, Akita prefecture. Slightly thinner than your regular udon but thicker than somen or hiyamugi noodles, this cream coloured udon is hand-stretched for that great bite.','25+','Mon-Sun 11:00AM-03:00PM, 05:00PM-10:00PM',62230995,'https://www.google.com/maps/place/Kiyoshi+Japanese+Restaurant/@1.2803924,103.8445877,17z/data=!3m1!4b1!4m5!3m4!1s0x31da190f6e7c70f9:0xd2e62e55cf0c5469!8m2!3d1.2803924!4d103.8467764?hl=en','https://kiyoshi.sg/','central'),(6,'Prego','/res/Prego.jpg',3.9,'Featuring a vibrant, contemporary setting in Fairmont Singapore, this magnificent 235-seater Italian restaurant boasts handcrafted, authentic Italian food by Chef Mauro Sanna.Enjoy delicious Italian fare at Prego with their signature Charcuterie Board. Decorated with assorted cured meats, the combination of different cuts of meat is perfect for two to three diners. Those who love fish should definitely try the Ali di Razza in “Agliata”. Served with crispy salsa chips, this bowl of fish slices is beautifully garnished with carrots and spring onions.','40+','Mon-Sun 06:30AM-10:30AM, 12:00PM-02:30PM, 03:00PM-05:00PM, 05:00PM-10:30PM',64316156,'https://www.google.com/maps/place/Prego/@1.2939918,103.8516867,17z/data=!3m1!4b1!4m5!3m4!1s0x31da19a67e1cda67:0x8490e47f7f2a5e2a!8m2!3d1.2939918!4d103.8538754?hl=en','https://prego.com.sg/','central'),(7,'Blu Kouzina (Dempsey)','/res/Blu Kouzina (Dempsey).jpg',4.3,'Blu Kouzina (Dempsey), a favourite destination for authentic Greek cuisine in Singapore for the past few years, is moving to a new location on Dempsey Hill. The new space brings together elements of Greek mythology and design along with Singapore\'s Chinese heritage and its colonial past. Stepping through the entrance, graced with two Mycaenian Lions, onto the black-and-white tiled floor and surrounded by the decorative Meander pattern, one isn\'t only transferred to Greece\'s rich ancient culture. The patterns also strike a familiar tone with designs seen in ancient China as well as Singapore\'s black-and-white houses. It\'s a marriage of culture that will make you feel at home as you settle for a culinary adventure a world away. The combination of past and present continues in the menu, where fresh and quality ingredients are used in dishes both traditional and creatively contemporary. (Apr 2016)','30+','Mon-Sun 11:30AM-03:30PM, 05:30PM-10:00PM',68750872,'https://www.google.com/maps/place/Blu+Kouzina/@1.3032472,103.8081752,17z/data=!3m1!4b1!4m5!3m4!1s0x31da109bbb1e83ad:0xd53354adcc39907e!8m2!3d1.3032472!4d103.8103639?hl=en','https://blukouzina.com/','central'),(8,'Pizza Fabbrica','/res/Pizza Fabbrica.jpg',4.1,'Upon entering the cool, minimalist space taken by Pizza Fabbrica on Bussorah Street, your eye is drawn straight through to the back by the glinted reflections of a gorgeous copper-clad oven, ebulliently glowing from its wood-fired embers within. It sits behind a glassed-in kitchen, bustling with chefs pressing dough and boiling pasta. The window is a theme at the restaurant, its storefront also featuring floor-to-ceiling versions that allows light and action to flow from inside to outside beautifully. The rest of the design is as if stepping into the mind of a graphic designer, complete with techy textures of chrome and wire, along with charming infographic posters displaying optimal wine and beer pairings. It’s a refreshingly minimal, but not understyled look that shows a new side to the tired hipster aesthetic, and a very unexpected one for a pizza restaurant.','15+','Tue-Thu 11:30AM-11:00PM | Fri,Sat 11:30AM-12:00PM | Mon closed',88695106,'https://www.google.com/maps/place/Pizza+Fabbrica/@1.3004365,103.8594837,15z/data=!4m2!3m1!1s0x0:0xfaaf5db4c52277cc?sa=X&hl=en&ved=2ahUKEwj7mNrGuKr8AhVlR2wGHR_FB_UQ_BJ6BQiXARAI','https://www.pizzafabbrica.sg/','east'),(9,'Walking On Sunshine','/res/Walking On Sunshine.jpg',4.9,'Walking On Sunshine is a garden-themed Cafe, which serves delicious Korean fusion food, desserts, and trendy & unique drinks made with natural ingredients. Sip on coconut smoothie coffee, dalgona coffee, Ginseng Smoothie, while enjoying the view of plants and flowers that contribute to relaxation. we can totally see ourselves spending a leisurely afternoon here! (Sep 2020)','18+','Mon-Thu,Sun 09:30AM-10:00PM | Fri,Sat 09:30AM--11:00PM',88778800,'https://www.google.com/maps/place/Walking+On+Sunshine+%7C+Korean+Hair+Salon+%26+Cafe/@1.3017769,103.8333988,15z/data=!4m5!3m4!1s0x0:0x8172761e18fdf951!8m2!3d1.3007901!4d103.8399648?hl=en','https://walkingonsunshine.sg/','central'),(10,'JUMBO Seafood (East Coast Seafood Centre)','/res/JUMBO Seafood.jpg',4.2,'JUMBO Seafood, one of Singapore\'s most recognizable home-grown brands, has over the years built its name on quality seafood at reasonable prices. This has earned it a name as one of the must-go places for its famous Chili Crab amongst locals and tourists alike. However, it should be noted that JUMBO is famous for so much more than just its award-winning Chili Crab. Some of its other signature dishes include Fried Prawns with Cereal, Crispy Baby Squid and Golden Egg Salted Prawns.','40+','Mon-Fri 04:30PM-11:00PM | Sat,Sun 11:00AM-11:00PM',64423435,'https://www.google.com/maps/place/JUMBO+Seafood+@+East+Coast/@1.2601438,103.8782005,12.13z/data=!4m5!3m4!1s0x0:0x9ba80dd1d041d7f5!8m2!3d1.3051669!4d103.930673','https://www.jumboseafood.com.sg/en/home','east'),(11,'Coucou Hotpot.Brew Tea (Suntec City)','/res/Coucou Hotpot.Brew Tea (Suntec City).jpg',4.7,'An online celebrity hot pot restaurant, Coucou Hotpot is here to serve up tasty broths and brewed bubble tea as part of its lifestyle tea brand, TeaMiTea.Coucou offers several types of hotpots, offering a choice of up to three flavours, ensuring you get the most out of your dining experience. Fish Maw and Chicken Bone Soup Base are among the restaurant\'s signature flavours. These creamy and sweet soup bases are so delicious, you\'ll keep coming back for more. For a tangy, umami-rich flavour, try their Bovine Bone and Tomato Hotpot. This savoury and tangy soup base only gets better when you add awesome meats like grain-fed beef cubes or fresh scallops. This thick and sour soup is light on the tongue, but heavy on flavour, making it a great choice for keeping your app','50+','Mon-Sun 11:00AM-11:00PM',69922538,'https://www.google.com/maps/place/Coucou+Hotpot%E2%80%A7Brew+Tea+@Suntec+City/@1.2957108,103.8586488,15z/data=!4m2!3m1!1s0x0:0x27d747f9c98e2b93?sa=X&hl=en&ved=2ahUKEwjxrsOCxKr8AhWvRmwGHcTBAfQQ_BJ6BAh7EAg','https://restaurant.momos.io/coucou-hotpot-brew-tea-11444','central'),(12,'South Union Park','/res/South Union Park.jpg',4.3,'This gem of a bistro is a slight walk from Kembangan MRT, but we recommend the exercise before the rich offerings here because soon you’ll be hard pressed to stop eating. Imagine a chic, new-American style restaurant right off the streets of swish New York, except tucked away in a quiet residential neighbourhood in the East. Here, they grow their own herbs, make their own pasta, and build from scratch practically everything else that goes onto your plate. Kick off with their signature Chicken Noodle Soup, a deli classic here made with a super-rich chicken stock, shredded chicken breast, little chunks of fresh vegetables, and pasta noodles. Other appetizers include their stellar Poutine, easily one of the best on the island, featuring freshly-made fries slathered with a meaty duck-stock gravy, and melty cheese curd sauce.','30+','Tue 05:30AM-10:00PM | Wed-Fri 11:30AM-10:00PM | Sat 11:00AM-10:00PM | Sun 11:00AM-09:00Pm',90618703,'https://www.google.com/maps/place/South+Union+Park/@1.3251366,103.9131889,15z/data=!4m5!3m4!1s0x0:0x333f604d8a367fed!8m2!3d1.3251366!4d103.9131889','https://www.southunionpark.sg/','east'),(13,'So Pho (Tampines Mall)','/res/So Pho.jpg',3.8,'Try halal-certified Vietnamese food in Singapore at So Pho, with their menu of healthy and delicious dishes. Using only the freshest ingredients to capture the authenticity of Vietnam food, So Pho promises the best pho, Banh Mi, Spring Rolls, bento sets, and more.Housed in a casual and contemporary setting, indulge in piping hot bowls of tasty pho. Topped with beef balls, beef and a dash of lime, So Pho’s Pho Sliced Beef with Tendon Brisket and Beef Balls Noodle Soup is a healthy bowl of vermicelli that is appetising and nourishing. Order a side of Imperial Spring Rolls to go with the bowl of noodles for a satisfying meal. Another great addition to your meal would be the Vietnamese Drip Coffee. Warm and robust, the specialty coffee is the ideal beverage for a quick pick-me-up. A plate of delights, the Grilled Lemongrass Chicken with Rice is another dish that packs an explosion of Vietnamese flavours. Served with a generous amount of crisps and vegetables, the chicken is grilled and flavoured with a blend of chopped spices.','15+','Mon-Sun 11:00AM-10:00PM',67890659,'https://www.google.com/maps/place/So+Pho+(Tampines+Mall)/@1.3526635,103.9450338,15z/data=!4m2!3m1!1s0x0:0xae472c8cc462905f?sa=X&hl=en&ved=2ahUKEwim4q7dzar8AhWSjeYKHQnCCooQ_BJ6BQiOARAI','http://www.sopho.com.sg/','east'),(14,'Violet Oon Singapore (Jewel Changi Airport)','/res/Violet Oon Singapore.jpg',4.2,'Delight in unforgettable Singapore flavours and Peranakan classics at Violet Oon Singapore at Jewel.Nestled within the lush tropicality of the world-class Jewel Changi Airport, Violet Oon Singapore at Jewel will whisk you away with our assortment of Singapore flavours. With an elevated all-day dining menu showcasing local favourites and one-dish delights, we invite you to take a moment to discover Singapore’s diverse and nuanced culinary heritage. Watch the dancing flames of our glassed-in open grill room, grab a drink at our long bar, or recharge over a warm meal. Visitors are also welcome to shop our selection of gourmet delicacies perfect for gifts and souvenirs. (Oct 2022)','25+','Mon-Fri 12:00PM-03:00PM, 06:00PM-10:00PM | Sat,Sun 12:00PM-10:00PM',98349935,'https://www.google.com/maps/place/Violet+Oon+at+Jewel+Changi+Airport/@1.3605312,103.9897657,15z/data=!4m2!3m1!1s0x0:0xe209fa776b2e446?sa=X&hl=en&ved=2ahUKEwjwr8Gx9Kr8AhX_aGwGHZKRCPUQ_BJ6BQiBARAI','https://violetoon.com/','east'),(15,'Surrey Hills Grocer','/res/Surrey Hills Grocer.jpg',4.3,'Surrey Hills Grocer aims to be the most authentic Australian destination grocer by bringing you honest-to-good, fine, fresh products. Inspired by the harsh terrains of Australia, we strive to bring you the best produce and offer you a taste of warm Australian hospitality.','25+','Mon-Sun 10:00AM-09:00PM',67504707,'https://www.google.com/maps/place/Surrey+Hills+Grocer/@1.3296435,103.681457,15z/data=!4m5!3m4!1s0x0:0x199e91a3b5ab25a2!8m2!3d1.3296435!4d103.681457','https://www.surreyhillsgrocer.sg/','west'),(16,'Upin Hot Pot (West Coast Plaza)','/res/Upin Hot Pot (West Coast Plaza).jpg',4.1,'When you think of hot pot, you probably imagine a bubbling cauldron of broth and an array of meats, vegetables, and other ingredients to be added to it. But the reality is that hot pot restaurants are a dime a dozen in Singapore, and more often than not it\'s hard to find one that hits the sweet spot—one that has a good balance between quality ingredients, good service, affordable prices, and reasonable waiting times.','25+','Mon-Sun 11:00AM-11:00PM',62585550,'https://www.google.com/maps?q=upin+hot+pot+west+coast+plaza&bih=981&biw=946&hl=en&um=1&ie=UTF-8&sa=X&ved=2ahUKEwiLtKvJsKv8AhUhXnwKHQoZB4YQ_AUoAXoECAEQAw','https://upinhotpotwcp.meuu.online/home','west'),(17,'Brotzeit Westgate','/res/Brotzeit Westgate.jpg',4.2,'Since its inception in 2006, Brotzeit has emerged as a culinary force to be reckoned with. Loved for spinning up authentic German meals and ice-cold beers, Brotzeit can often be seem packed with the food-loving, beer-guzzling crowd at all hours of the day.There’s nothing more German than huge swirling hunks of sausage. So there’s little surprise to see Brotzeit featuring a wide array of such sausages, the showstopper being the Thuringer Pork Sausage, which comes with a generous heaping of mashed potatoes, sauerkraut, and sweet onion sauce. But the Sausage Platter, another fan fave, serves all the top hits from the kitchen, from grilled pork, spicy chicken, to the garlic pork sausages.Want something other than sausages? Then have your pick of hearty dishes that include the traditional Goulash Soup, so authentic any German grandmother would approve of it. Featuring generous chunks of tender beef in a herb-tinged soup, this soup is perfect on a rainy night.','20+','Mon-Sun 11:00AM-10:30PM',64659874,'https://www.google.com/maps?q=brotzeit+westgate&um=1&ie=UTF-8&sa=X&ved=2ahUKEwi9_MuMsav8AhVyxDgGHfatAb4Q_AUoAnoECAEQBA','https://brotzeit.co/?utm_source=google&utm_medium=organic&utm_campaign=gmb','west'),(18,'Hanok by Masizzim Westgate','/res/Hanok by Masizzim Westgate.jpg',3.4,'Located at Westgate, Singapore, Hanok by Masizzim is a Halal-certified spin-off from K Food Holdings that offers Halal versions of Masizzim\'s signature dishes. Brought to Singapore in 2015, you\'ll find all your favorite dishes here, from galbi-jjim (meat stews) to rice balls.Recognising the local demand for Halal Korean food, K Food commissioned their in-house research & development manager, a Korean chef living in Singapore to recreate Masizzim’s signature dishes using Halal ingredients. While there are slight differences between the original and the innovative, Hanok by Masizzim’s key offerings remain the same.','20+','Mon-Sun 11:00Am-09:00PM',69060965,'https://www.google.com/maps/place/Hanok+by+Masizzim+Westgate/@1.3337889,103.7429302,15z/data=!4m5!3m4!1s0x0:0xe4a00cfd544d323d!8m2!3d1.3337889!4d103.7429302','https://www.facebook.com/masizzimsingapore','west'),(19,'Dancing Crab (Northshore Plaza 2)','/res/Dancing Crab (Northshore Plaza 2).jpg',4,'Crabtastic news! The wildly popular Dancing Crab has now opened its claws at Northshore Plaza 2 so get ready to dig into finger-lickin\' Louisiana seafood cuisine. Don’t worry though, they’ve got the same country-style Cajun recipes, flavours, and spectacular seafood favourites we fell in love with at the other outlets - so expect the same great treats!','35+','Mon-Sun 11:30AM-03:00PM, 05:30PM-10:00PM',69922992,'https://www.google.com/maps/place/Dancing+Crab+(Northshore+Plaza+II)/@1.4176495,103.9013264,15z/data=!4m5!3m4!1s0x0:0xe5f7cbe111cb41d7!8m2!3d1.4176495!4d103.9013264','https://www.dancingcrab.com.sg/en/home','north-east'),(20,'elemen @ Woodlands Height','/res/elemen @ Woodlands Height..jpg',4.1,'elemen 元素 dedicates to build the well-being of diners through natural and earthy recipes. The dining concept focuses on whipping up wholesome meatless dishes, whose recipes call for the use of healthy, nourishing ingredients and superfoods sourced from different countries, since its inception in June 2015. (Jun 2022)','15+','Mon-Sun 11:30AM-03:00PM, 05:30PM-09:00PM',65137718,'https://www.google.com/maps/place/elemen+%E5%85%83%E7%B4%A0/@1.4282571,103.7993498,15z/data=!4m2!3m1!1s0x0:0x437d8125b3621705?sa=X&ved=2ahUKEwjFlo6vvav8AhXj7nMBHd4bAokQ_BJ6BQiCARAI','https://www.elemengroup.com.sg/','north'),(21,'Eatzi Gourmet Bistro (SAFRA Yishun)','/res/Eatzi Gourmet Bistro (SAFRA Yishun).jpg',3.7,'The people behind Singapore’s favourite steakhouse, Jack’s Place, bring you Eatzi Gourmet Bistro, a Halal restaurant that serves up tasty Western plates. Here, there’s everything from Jack’s Place’s classic hot-plate steaks to all-day breakfasts, a little bit of everything for the whole family. Whether it’s house favourites like sizzling cuts of New Zealand Grass Fed Beef, or tangles of spaghetti in rich seafood sauce, all the hallmarks of the Jack’s Place experience are here. There are even some special local flavour options like a zingy Sambal Steak, a tender cut of beef served up with a chunky sambal sauce, and savoury Nasi Goreng served up with satay and prawns. Apart from mains, there’s also a hefty selection of delicious appetizers, like juicy mushrooms stuffed with slipper lobster and crab or crispy batons of deep fried chicken meat luncheon meat, as well as an array of milkshakes, smoothies, and waffles, to keep you sated whether you’re in search of a light afternoon bite, a sweet treat at tea time, or a more substantial family dinner. With its extensive menu and commitment to providing variety, it won’t be a surprise if this becomes your go-to destination for birthdays to anniversaries, and everything in between. (Feb 2017)','17+','Mon-Sun 11:00AM-10:00PM',68528270,'https://www.google.com/maps/place/Eatzi+Gourmet+Steakhouse+%26+Bistro/@1.4242354,103.8409184,15z/data=!4m2!3m1!1s0x0:0xd7a06bc58c479ccc?sa=X&hl=en&ved=2ahUKEwjD19qXv6v8AhXRxTgGHfnPAH8Q_BJ6BQiDARAI','https://eatzigourmet.com.sg/steakhouse/','north'),(22,'Icebar (Hougang)','/res/Icebar (Hougang).jpg',4.5,'Icebar is the most instagrammable Ice Cream Shop in Singapore. We serve Handmade Gelatos, Fragrant Original Waffles, Hand Crafted Coffee, and Refreshing Beers. We are known for our HUGE ,quirky Neon lights and you can also find Arcade Claw Machines at both our outlet! We are the definition of a fun and chill!','10+','Mon-Thu 02:00AM-11:00PM | Fri 02:00PM-02:00AM | Sat,Sun 12:00PM-02:00AM',69263446,'https://www.google.com/maps/place/Icebar+(Hougang)/@1.3795752,103.8876495,15z/data=!4m2!3m1!1s0x0:0x8a1d6f328a787a8?sa=X&ved=2ahUKEwjGvoXXwav8AhXy8zgGHQ4VDakQ_BJ6BQiIARAI','https://www.icebar.sg/','north-east'),(23,'Melt Cafe','/res/Melt Cafe.jpg',4.4,'Dining at Melt Cafe is an indulgent, luxurious affair you can expect from a high end buffet restaurant. Located inside the Mandarin Oriental, this is where sophisticates head to for an all-day dining experience with your nearest and dearest — we have the lowdown on Melt Cafe’s buffet price, menu, and photos.','128 adult | child(7-12y/o) 50% off','Mon-Sun 12:00PM-02:30PM, 06:30PM-09:30PM',68853500,'https://www.google.com/maps/place/Melt+Caf%C3%A9/@1.2907356,103.8561207,17z/data=!3m1!4b1!4m5!3m4!1s0x31da19a85cab5c83:0xd5d859acc607db6e!8m2!3d1.2907356!4d103.8583094','https://www.mandarinoriental.com/en/singapore/marina-bay/dine/melt-cafe?source=MOLandingPage:MOSIN:local','central'),(24,'Wingstop (Bedok)','/res/Wingstop (Bedok).jpg',4,'Wingstop operates and franchises a global network of restaurants with the mission of serving the world FLAVOR.With a menu of 11 bold, distinctive flavors of classic and boneless chicken wings, Wingstop is the destination for made-to-crave wings and sides.','10+','Mon-Sun 11:00AM-!0:00PM',68449200,'https://www.google.com/maps/place/Wingstop/@1.324592,103.9292631,15z/data=!4m5!3m4!1s0x0:0xff950ab963d92eb8!8m2!3d1.324592!4d103.9292631','https://www.wingstop.com.sg/','east'),(25,'Joséphine - French Cuisine & Wine Bar','/res/Joséphine - French Cuisine & Wine Bar.jpg',4.1,'The perfect place for a tasty breather from the hustle and bustle of city life, enter Josephine French Cuisine & Wine Bar to enjoy trendy modern French bistro-style dishes in the heart of Singapore’s Central Boulevard District at Amoy Street.A vibrant restaurant and bar that whips up innovative French dishes and boasts a heady concoction of spirits and cocktails, drop by this duo concept dining outlet today for after-work socials or weekend gatherings with friends and colleagues.','30+','Mon-Sun 11:45AM-03:00PM, 06:00PM-12:00AM',96424901,'https://www.google.com/maps?q=jos%C3%A9phine+-+french+cuisine+%26+wine+bar&bih=981&biw=946&hl=en&um=1&ie=UTF-8&sa=X&ved=2ahUKEwiGzbPl9a_8AhU8EbcAHfNyA4sQ_AUoAXoECAEQAw','https://www.josephinesg.com/','central'),(26,'Le Rida','/res/Le Rida.jpg',4,'Meat is the name of the game at Le Rida in Bukit Timah, a cosy little eatery that specializes in mezze-style grilled meats and steaks. Riding on its mezze theme, communal dining is encouraged, and a big part of the menu is shared platters of pitas and hearty Middle-Eastern dips like hummus, Iabneh, and motabal, which whet your appetite for the main part of your meal: the grilled meats.','25+','Mon-Thu 12:00PM-03:00PM, 05:00 PM-11:00PM | Fri,Sat 12:00PM-12:00AM | Sun 12:00PM11:00PM',64634755,'https://www.google.com/maps/place/Le+Rida+(Mediterranean.+French.+North+Indian)/@1.3331595,103.7881479,17z/data=!3m1!4b1!4m5!3m4!1s0x31da109ba5a84769:0x7bb35f8e9e2c58e6!8m2!3d1.3331595!4d103.7903366?hl=en','http://lerida.com.sg/','central'),(27,'Tara Thai Sg','/res/Tara Thai Sg.jpg',4.5,'Tara Thai Sg is a contemporary Thai restaurant located in Circular Road, Singapore. Chef Darwin and native Thai chef Rit have created a menu that offers diners bold and reimagined Thai classics. Our signature dishes include Sakoshi Bay Oyster, Ant Egg Tom Saap, Smoked Honey Pineapple, and other delicious items. We also offer Thai-inspired cocktails like the Sakoshi Bay cocktail to pair with your meal! If you\'re looking for an unforgettable experience, come visit Tara Thai Sg! (Aug 2022)','50+','Mon-Fri 12:00PM-03:00PM, 05:30PM-10:00PM | Sat 05:30Pm-10:00PM | Sun closed',98550281,'https://www.google.com/maps?q=Tara+Thai+Sg&bih=981&biw=946&hl=en&um=1&ie=UTF-8&sa=X&ved=2ahUKEwi1yLDHibD8AhVmJbcAHdcjDYgQ_AUoAXoECAEQAw','https://tara-thai-sg.business.site/?m=true','central');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `rev_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rest_id` int NOT NULL,
  `text` text,
  `rating` int DEFAULT NULL,
  `date_posted` date DEFAULT NULL,
  `upvote` int DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `id_UNIQUE` (`rev_id`),
  KEY `restaurant_id_idx` (`rest_id`),
  KEY `user_id_review_idx` (`user_id`),
  CONSTRAINT `restaurant_id_review` FOREIGN KEY (`rest_id`) REFERENCES `restaurant` (`rest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'Dined in for dinner in mid September on a Saturday, found seats immediately. Restaurant was not crowded. Food was great, portions are huge! Service staff were very attentive, and ambience was nice. Will be back again.',5,'2020-03-12',121),(2,2,2,'Great place to chill with friends, the portion of the food is huge and nice ambiance…. Thumbs up and shout out to the chefs and staffs!',4,'2021-12-14',42),(3,1,6,'Great place to chill with friends, loved the food',4,'2021-12-14',10),(4,1,3,'food taste great will come back',4,'2021-11-17',25),(5,2,11,'its a nice place, staffs are nice, food is not bad',4,'2022-06-24',30),(6,2,17,'didnt really enjoy the food',2,'2022-08-02',5),(7,2,1,'food was not too bad',3,'2022-08-02',23),(8,3,1,'10/10 recommend!!!!!! Great food, vibes, friendly staff. Definitely going back',5,'2022-09-23',56);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(45) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jason','jasson12321@gmail.com','jason123','/pfp/Jason','Just another being'),(2,'cutecat','cutecat@gmail,com','cutecat123','/pfp/cutecat.jpg','loves food loves cats'),(3,'sandwitch','sandwitch123@hotmail.com','sand123','/pfp/sandwitch.jpg','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'restaurant_review'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 12:40:18
