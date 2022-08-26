-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema groupomania
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema groupomania
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `groupomania` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `groupomania` ;

-- -----------------------------------------------------
-- Table `groupomania`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `isAdmin` TINYINT(1) NOT NULL DEFAULT 0,
  `state` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`articles` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL,
  `create_at` DATETIME NOT NULL DEFAULT now(),
  `image` VARCHAR(255) NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`id_article`),
  INDEX `fk_articles_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_articles_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`comment` (
  `id_comment` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT now(),
  `users_id_user` INT NOT NULL,
  `articles_id_article` INT NOT NULL,
  PRIMARY KEY (`id_comment`),
  INDEX `fk_comment_users1_idx` (`users_id_user` ASC) VISIBLE,
  INDEX `fk_comment_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  CONSTRAINT `fk_comment_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `groupomania`.`articles` (`id_article`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`avatar` (
  `id_avatar` INT NOT NULL AUTO_INCREMENT,
  `img_avatar` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`id_avatar`),
  INDEX `fk_comment_copy1_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_comment_copy1_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `groupomania` ;

-- -----------------------------------------------------
-- Placeholder table for view `groupomania`.`v_getOneArticle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`v_getOneArticle` (`id_user` INT, `name` INT, `title` INT, `content` INT, `image` INT, `create_at` INT, `id_article` INT);

-- -----------------------------------------------------
-- Placeholder table for view `groupomania`.`v_get_one_comment_from_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`v_get_one_comment_from_user` (`name` INT, `content` INT, `created_at` INT, `id_comment` INT, `articles_id_article` INT, `users_id_user` INT);

-- -----------------------------------------------------
-- View `groupomania`.`v_getOneArticle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `groupomania`.`v_getOneArticle`;
USE `groupomania`;
CREATE  OR REPLACE VIEW `v_getOneArticle` AS
SELECT users.id_user, users.name,  articles.title, articles.content, articles.image, articles.create_at, articles.id_article 
FROM groupomania.users
RIGHT JOIN groupomania.articles
ON users.id_user = articles.users_id_user
ORDER BY articles.create_at DESC;

-- -----------------------------------------------------
-- View `groupomania`.`v_get_one_comment_from_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `groupomania`.`v_get_one_comment_from_user`;
USE `groupomania`;
CREATE  OR REPLACE VIEW `v_get_one_comment_from_user` AS
SELECT users.name, comment.content, comment.created_at, comment.id_comment, comment.articles_id_article, comment.users_id_user
FROM groupomania.comment
Right JOIN groupomania.users 
ON users.id_user = groupomania.comment.users_id_user
ORDER BY comment.created_at DESC;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
