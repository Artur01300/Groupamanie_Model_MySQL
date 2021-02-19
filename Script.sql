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
  `isAdmin` TINYINT(1) NULL,
  `idimage` VARCHAR(255) NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`articles` (
  `id_article` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL,
  `create_at` DATETIME NOT NULL DEFAULT now(),
  `image` VARCHAR(255) NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`id_article`),
  UNIQUE INDEX `id_UNIQUE` (`id_article` ASC) VISIBLE,
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
  `id_comment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT now(),
  `users_id_user` INT NOT NULL,
  `articles_id_article` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_comment`),
  UNIQUE INDEX `id_UNIQUE` (`id_comment` ASC) VISIBLE,
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`likes` (
  `like` TINYINT UNSIGNED NULL DEFAULT 0,
  `dislike` TINYINT UNSIGNED NULL DEFAULT 0,
  `articles_id_article` INT UNSIGNED NOT NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`articles_id_article`, `users_id_user`),
  INDEX `fk_likes_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_likes_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_likes_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `groupomania`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
