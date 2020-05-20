-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ekinobase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ekinobase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ekinobase` ;

-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_actor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_cinema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `rating` DOUBLE NOT NULL,
  `place_id` VARCHAR(255) NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `latitude` DOUBLE NOT NULL,
  `website_link` VARCHAR(200) NOT NULL,
  `phone` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `cinema_rating` (`rating` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_cinemaimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_cinemaimage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_link` VARCHAR(200) NOT NULL,
  `cinema_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ekinoback_cinemaimage_cinema_id_30f3e107_fk_ekinoback_cinema_id` (`cinema_id` ASC),
  CONSTRAINT `ekinoback_cinemaimage_cinema_id_30f3e107_fk_ekinoback_cinema_id`
    FOREIGN KEY (`cinema_id`)
    REFERENCES `ekinobase`.`ekinoback_cinema` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `pseudo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE,
  INDEX `ekinoback_genre_pseudo_id_820c15b3` (`pseudo_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_movie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `trailer_link` VARCHAR(200) NOT NULL,
  `poster_link` VARCHAR(200) NOT NULL,
  `age` TINYINT(1) NOT NULL,
  `rating` DOUBLE NOT NULL,
  `duration` INT NOT NULL,
  `release_date` DATE NOT NULL,
  `country_production` VARCHAR(200) NOT NULL,
  `director` VARCHAR(200) NOT NULL,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) ,
  INDEX `movie_rating` (`rating` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_movie_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_movie_actors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ekinoback_movie_actors_movie_id_actor_id_2f821621_uniq` (`movie_id` ASC, `actor_id` ASC) ,
  INDEX `ekinoback_movie_actors_actor_id_51113f26_fk_ekinoback_actor_id` (`actor_id` ASC) ,
  CONSTRAINT `ekinoback_movie_actors_actor_id_51113f26_fk_ekinoback_actor_id`
    FOREIGN KEY (`actor_id`)
    REFERENCES `ekinobase`.`ekinoback_actor` (`id`),
  CONSTRAINT `ekinoback_movie_actors_movie_id_ebe45bce_fk_ekinoback_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `ekinobase`.`ekinoback_movie` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_movie_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_movie_genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ekinoback_movie_genre_movie_id_genre_id_1a7e02ed_uniq` (`movie_id` ASC, `genre_id` ASC) ,
  INDEX `ekinoback_movie_genre_genre_id_377ee090_fk_ekinoback_genre_id` (`genre_id` ASC),
  CONSTRAINT `ekinoback_movie_genre_genre_id_377ee090_fk_ekinoback_genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `ekinobase`.`ekinoback_genre` (`id`),
  CONSTRAINT `ekinoback_movie_genre_movie_id_0879da91_fk_ekinoback_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `ekinobase`.`ekinoback_movie` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_studio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_studio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_movie_studio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_movie_studio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `movie_id` INT NOT NULL,
  `studio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ekinoback_movie_studio_movie_id_studio_id_0ea4d2e7_uniq` (`movie_id` ASC, `studio_id` ASC),
  INDEX `ekinoback_movie_studio_studio_id_0c5af49e_fk_ekinoback_studio_id` (`studio_id` ASC),
  CONSTRAINT `ekinoback_movie_studio_movie_id_cbf548d0_fk_ekinoback_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `ekinobase`.`ekinoback_movie` (`id`),
  CONSTRAINT `ekinoback_movie_studio_studio_id_0c5af49e_fk_ekinoback_studio_id`
    FOREIGN KEY (`studio_id`)
    REFERENCES `ekinobase`.`ekinoback_studio` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ekinobase`.`ekinoback_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ekinobase`.`ekinoback_session` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` INT NOT NULL,
  `start_time` DATETIME(6) NOT NULL,
  `ticket_link` VARCHAR(200) NOT NULL,
  `language` VARCHAR(20) NOT NULL,
  `technology` VARCHAR(20) NOT NULL,
  `cinema_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ekinoback_session_cinema_id_d7882bf8_fk_ekinoback_cinema_id` (`cinema_id` ASC),
  INDEX `ekinoback_session_movie_id_17d4bf2c_fk_ekinoback_movie_id` (`movie_id` ASC),
  INDEX `ekinoback_session_price_10262086` (`price` ASC),
  CONSTRAINT `ekinoback_session_cinema_id_d7882bf8_fk_ekinoback_cinema_id`
    FOREIGN KEY (`cinema_id`)
    REFERENCES `ekinobase`.`ekinoback_cinema` (`id`),
  CONSTRAINT `ekinoback_session_movie_id_17d4bf2c_fk_ekinoback_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `ekinobase`.`ekinoback_movie` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
