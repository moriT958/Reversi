-- Create "games" table
CREATE TABLE `games` (`id` integer NULL PRIMARY KEY AUTOINCREMENT, `started_at` datetime NOT NULL);
-- Create "turns" table
CREATE TABLE `turns` (`id` integer NULL PRIMARY KEY AUTOINCREMENT, `game_id` integer NOT NULL, `turn_count` integer NOT NULL, `next_disc` integer NULL, `end_at` datetime NOT NULL, CONSTRAINT `0` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "turns_game_id_turn_count" to table: "turns"
CREATE UNIQUE INDEX `turns_game_id_turn_count` ON `turns` (`game_id`, `turn_count`);
-- Create "moves" table
CREATE TABLE `moves` (`id` integer NULL PRIMARY KEY AUTOINCREMENT, `turn_id` integer NOT NULL, `disc` integer NOT NULL, `x` integer NOT NULL, `y` integer NOT NULL, CONSTRAINT `0` FOREIGN KEY (`turn_id`) REFERENCES `turns` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create "squares" table
CREATE TABLE `squares` (`id` integer NULL PRIMARY KEY AUTOINCREMENT, `turn_id` integer NOT NULL, `x` integer NOT NULL, `y` integer NOT NULL, `disc` integer NOT NULL, CONSTRAINT `0` FOREIGN KEY (`turn_id`) REFERENCES `turns` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION);
-- Create index "squares_turn_id_x_y" to table: "squares"
CREATE UNIQUE INDEX `squares_turn_id_x_y` ON `squares` (`turn_id`, `x`, `y`);
-- Create "game_results" table
CREATE TABLE `game_results` (`id` integer NULL PRIMARY KEY AUTOINCREMENT, `game_id` integer NOT NULL, `winner_disc` integer NOT NULL, `end_at` datetime NOT NULL, CONSTRAINT `0` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION);
