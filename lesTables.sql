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
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `isAdmin` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idusers_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`articles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT CHARACTER SET 'ascii' NOT NULL,
  `create_at` DATETIME NOT NULL,
  `image` VARCHAR(255) NULL,
  `users_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articles_users_idx` (`users_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `groupomania`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`commentaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`commentaires` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `articles_id` INT UNSIGNED NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_commentaires_articles1_idx` (`articles_id` ASC) VISIBLE,
  INDEX `fk_commentaires_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_commentaires_articles1`
    FOREIGN KEY (`articles_id`)
    REFERENCES `groupomania`.`articles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commentaires_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `groupomania`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `groupomania`.`likes_dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groupomania`.`likes_dislikes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `like_dislike` TINYINT(1) NULL,
  `users_id` INT NOT NULL,
  `commentaires_id` INT NOT NULL,
  `articles_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_dislikes_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_commentaires1_idx` (`commentaires_id` ASC) VISIBLE,
  INDEX `fk_likes_dislikes_articles1_idx` (`articles_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_dislikes_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `groupomania`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_commentaires1`
    FOREIGN KEY (`commentaires_id`)
    REFERENCES `groupomania`.`commentaires` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_dislikes_articles1`
    FOREIGN KEY (`articles_id`)
    REFERENCES `groupomania`.`articles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
