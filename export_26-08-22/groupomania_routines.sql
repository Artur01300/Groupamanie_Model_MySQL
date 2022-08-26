-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Temporary view structure for view `v_articleswithuseravatars`
--

DROP TABLE IF EXISTS `v_articleswithuseravatars`;
/*!50001 DROP VIEW IF EXISTS `v_articleswithuseravatars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_articleswithuseravatars` AS SELECT 
 1 AS `id_user`,
 1 AS `name`,
 1 AS `title`,
 1 AS `content`,
 1 AS `image`,
 1 AS `create_at`,
 1 AS `id_article`,
 1 AS `img_avatar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_getonearticle`
--

DROP TABLE IF EXISTS `v_getonearticle`;
/*!50001 DROP VIEW IF EXISTS `v_getonearticle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_getonearticle` AS SELECT 
 1 AS `id_user`,
 1 AS `name`,
 1 AS `title`,
 1 AS `content`,
 1 AS `image`,
 1 AS `create_at`,
 1 AS `id_article`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_get_one_comment_from_user`
--

DROP TABLE IF EXISTS `v_get_one_comment_from_user`;
/*!50001 DROP VIEW IF EXISTS `v_get_one_comment_from_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_get_one_comment_from_user` AS SELECT 
 1 AS `name`,
 1 AS `content`,
 1 AS `created_at`,
 1 AS `id_comment`,
 1 AS `articles_id_article`,
 1 AS `users_id_user`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_articleswithuseravatars`
--

/*!50001 DROP VIEW IF EXISTS `v_articleswithuseravatars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_articleswithuseravatars` AS select `users`.`id_user` AS `id_user`,`users`.`name` AS `name`,`articles`.`title` AS `title`,`articles`.`content` AS `content`,`articles`.`image` AS `image`,`articles`.`create_at` AS `create_at`,`articles`.`id_article` AS `id_article`,`avatar`.`img_avatar` AS `img_avatar` from ((`articles` left join `users` on((`articles`.`users_id_user` = `users`.`id_user`))) left join `avatar` on((`articles`.`users_id_user` = `avatar`.`users_id_user`))) order by `articles`.`create_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_getonearticle`
--

/*!50001 DROP VIEW IF EXISTS `v_getonearticle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_getonearticle` AS select `users`.`id_user` AS `id_user`,`users`.`name` AS `name`,`articles`.`title` AS `title`,`articles`.`content` AS `content`,`articles`.`image` AS `image`,`articles`.`create_at` AS `create_at`,`articles`.`id_article` AS `id_article` from (`articles` left join `users` on((`users`.`id_user` = `articles`.`users_id_user`))) order by `articles`.`create_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_get_one_comment_from_user`
--

/*!50001 DROP VIEW IF EXISTS `v_get_one_comment_from_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_get_one_comment_from_user` AS select `users`.`name` AS `name`,`comment`.`content` AS `content`,`comment`.`created_at` AS `created_at`,`comment`.`id_comment` AS `id_comment`,`comment`.`articles_id_article` AS `articles_id_article`,`comment`.`users_id_user` AS `users_id_user` from (`users` left join `comment` on((`users`.`id_user` = `comment`.`users_id_user`))) order by `comment`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-26 19:05:34
