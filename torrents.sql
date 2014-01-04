BEGIN;
drop table torrents_torrent;
CREATE TABLE `torrents_torrent` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `title` varchar(255) NOT NULL,
    `description` longtext NOT NULL,
    `torrent_file` varchar(100) NOT NULL,
    `category_id` integer NOT NULL,
    `approved` bool NOT NULL,
    `user_id` integer,
    `rating` integer UNSIGNED,
    `rate_count` integer UNSIGNED
)
;
ALTER TABLE `torrents_torrent` ADD CONSTRAINT `user_id_refs_id_136ebf2e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `torrents_torrent` ADD CONSTRAINT `category_id_refs_id_97db5c37` FOREIGN KEY (`category_id`) REFERENCES `torrent_categories_category` (`id`);
CREATE INDEX `torrents_torrent_6f33f001` ON `torrents_torrent` (`category_id`);
CREATE INDEX `torrents_torrent_6340c63c` ON `torrents_torrent` (`user_id`);

COMMIT;
