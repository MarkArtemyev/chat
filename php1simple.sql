
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `messages` (
  `id_message` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `dt_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `id_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `messages` (`id_message`, `name`, `text`, `dt_add`, `status`, `id_cat`) VALUES
(1, 'Test', 'Hi there!!!!!!!', '2020-03-12 15:20:43', 0, 0);

CREATE TABLE `sessions` (
  `id_session` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `token` varchar(128) NOT NULL,
  `dt_add` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sessions` (`id_session`, `id_user`, `token`, `dt_add`) VALUES
(1, 1, 'a9d542eaf68c3567cd3fde7b1d776419504586bd463a85b2895eea25f4406121bdb63f35908df92fda9513f14de0901329aca1d5e8a7a2151d0290848637bdbc', '2020-03-12 15:20:34');


CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `login` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`id_user`, `login`, `password`, `email`, `name`) VALUES
(1, 'admin', '$2y$10$nQ68//jiFxTD6YQpuYUPn.VqQ6.ZeaYv3TnwQ5YCOCFPBpT8cYoAG', '1@1', 'Admin Main'),
(2, 'manager', '$2y$10$nQ68//jiFxTD6YQpuYUPn.VqQ6.ZeaYv3TnwQ5YCOCFPBpT8cYoAG', '2@2', 'Not main');

ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`);


ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id_session`),
  ADD UNIQUE KEY `token` (`token`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`);


ALTER TABLE `messages`
  MODIFY `id_message` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `sessions`
  MODIFY `id_session` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
