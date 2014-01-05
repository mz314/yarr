BEGIN;
CREATE TABLE `torrents_category` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    `parent_cat_id` integer
)
;
ALTER TABLE `torrents_category` ADD CONSTRAINT `parent_cat_id_refs_id_856fd9bd` FOREIGN KEY (`parent_cat_id`) REFERENCES `torrents_category` (`id`);
CREATE TABLE `torrents_torrent` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `title` varchar(255) NOT NULL,
    `description` longtext NOT NULL,
    `torrent_file` varchar(100) NOT NULL,
    `category_id` integer NOT NULL,
    `approved` bool NOT NULL,
    `user_id` integer
)
;
ALTER TABLE `torrents_torrent` ADD CONSTRAINT `category_id_refs_id_88ff109f` FOREIGN KEY (`category_id`) REFERENCES `torrents_category` (`id`);
ALTER TABLE `torrents_torrent` ADD CONSTRAINT `user_id_refs_id_136ebf2e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE TABLE `torrents_comments` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `user_id` integer NOT NULL,
    `torrent_id` integer NOT NULL
)
;
ALTER TABLE `torrents_comments` ADD CONSTRAINT `torrent_id_refs_id_1ff8695e` FOREIGN KEY (`torrent_id`) REFERENCES `torrents_torrent` (`id`);
ALTER TABLE `torrents_comments` ADD CONSTRAINT `user_id_refs_id_c1f28ba4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE TABLE `torrents_rates` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `user_id` integer NOT NULL,
    `rate` integer UNSIGNED NOT NULL,
    `torrent_id` integer NOT NULL
)
;
ALTER TABLE `torrents_rates` ADD CONSTRAINT `torrent_id_refs_id_a774856b` FOREIGN KEY (`torrent_id`) REFERENCES `torrents_torrent` (`id`);
ALTER TABLE `torrents_rates` ADD CONSTRAINT `user_id_refs_id_7513f3d1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
CREATE INDEX `torrents_category_18eb35da` ON `torrents_category` (`parent_cat_id`);
CREATE INDEX `torrents_torrent_6f33f001` ON `torrents_torrent` (`category_id`);
CREATE INDEX `torrents_torrent_6340c63c` ON `torrents_torrent` (`user_id`);
CREATE INDEX `torrents_comments_6340c63c` ON `torrents_comments` (`user_id`);
CREATE INDEX `torrents_comments_dacd18be` ON `torrents_comments` (`torrent_id`);
CREATE INDEX `torrents_rates_6340c63c` ON `torrents_rates` (`user_id`);
CREATE INDEX `torrents_rates_dacd18be` ON `torrents_rates` (`torrent_id`);

COMMIT;
