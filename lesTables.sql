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
CREATE SCHEMA IF NOT EXISTS `groupomania` DEFAULT CHARACTER SET utf8 ;
USE `groupomania` ;

-- -----------------------------------------------------
-- Table `groupomania`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`users` (
  `id_user` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `isAdmin` TINYINT(1) NULL,
  `idimage` VARCHAR(255) NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `idusers_UNIQUE` (`id_user` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`articles` (
  `id_article` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT CHARACTER SET 'ascii' NOT NULL,
  `create_at` DATETIME NOT NULL,
  `imarge` VARCHAR(255) NULL,
  `users_id_user` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_article`),
  UNIQUE INDEX `id_UNIQUE` (`id_article` ASC) VISIBLE,
  INDEX `fk_articles_users_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`commentaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`commentaires` (
  `id_comment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `articles_id_article` INT UNSIGNED NOT NULL,
  `users_id_user` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_comment`),
  UNIQUE INDEX `id_UNIQUE` (`id_comment` ASC) VISIBLE,
  INDEX `fk_commentaires_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_commentaires_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_commentaires_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `groupomania`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commentaires_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`likes_dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`likes_dislikes` (
  `id_likedislike` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `like_dislike` TINYINT(1) NULL,
  `commentaires_id_comment` INT UNSIGNED NOT NULL,
  `articles_id_article` INT UNSIGNED NOT NULL,
  `users_id_user` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_likedislike`, `articles_id_article`, `users_id_user`),
  UNIQUE INDEX `id_UNIQUE` (`id_likedislike` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_commentaires1_idx` (`commentaires_id_comment` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_articles1_idx` (`articles_id_article` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_likes_dislikes_commentaires1`
    FOREIGN KEY (`commentaires_id_comment`)
    REFERENCES `groupomania`.`commentaires` (`id_comment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_articles1`
    FOREIGN KEY (`articles_id_article`)
    REFERENCES `groupomania`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `groupomania`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
