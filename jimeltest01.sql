-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Maio-2014 às 21:54
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jimeltest01`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_association`
--

CREATE TABLE IF NOT EXISTS `es_association` (
  `id_association` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '0:Club; 1:Federation; 2:Confederation',
  `id_parent_association` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_association`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `es_association`
--

INSERT INTO `es_association` (`id_association`, `name`, `type`, `id_parent_association`) VALUES
(5, 'IMeL Campinas', 1, 8),
(7, 'IMeL Sorocaba', 1, 8),
(8, 'Concílio Nikkei', 2, NULL),
(9, 'IMeL Apucarana', 1, 8),
(10, 'IMeL Diadema', 1, 8),
(11, 'IMeL Embura', 1, 8),
(12, 'IMeL Itapevi', 1, 8),
(13, 'IMeL Jaçanã', 1, 8),
(14, 'IMeL Jardim Planalto', 1, 8),
(15, 'IMeL Jordanópolis', 1, 8),
(16, 'IMeL Liberdade', 1, 8),
(17, 'IMeL Marília', 1, 8),
(18, 'IMeL Mogi das Cruzes', 1, 8),
(19, 'IMeL Novo Alvoecer', 1, 8),
(20, 'IMeL Pindamoiangaba', 1, 8),
(21, 'IMeL Pinheiros', 1, 8),
(22, 'IMeL Santana', 1, 8),
(23, 'IMeL São José dos Campos', 1, 8),
(24, 'IMeL São Remo', 1, 8),
(25, 'IMeL Saúde', 1, 8),
(26, 'IMeL Vila Mariana', 1, 8),
(27, 'IMeL Curitiba', 1, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_athlete`
--

CREATE TABLE IF NOT EXISTS `es_athlete` (
  `id_athlete` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_association` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT 'INATIVO; ATIVO',
  PRIMARY KEY (`id_athlete`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=548 ;

--
-- Extraindo dados da tabela `es_athlete`
--

INSERT INTO `es_athlete` (`id_athlete`, `id_user`, `id_association`, `id_event`, `status`) VALUES
(547, 540, 5, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_category`
--

CREATE TABLE IF NOT EXISTS `es_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `id_sport_type` int(11) DEFAULT NULL,
  `id_event` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(15) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `min_age` int(2) DEFAULT NULL COMMENT 'Minimum age (included) for this category; Leave blank for no limit.',
  `max_age` int(2) DEFAULT NULL COMMENT 'Maximum age (included) for this category; Leave blank for no limit.',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `es_category`
--

INSERT INTO `es_category` (`id_category`, `id_sport_type`, `id_event`, `name`, `description`, `status`, `gender`, `min_age`, `max_age`) VALUES
(1, 1, 0, 'Feminino', NULL, '1', 'F', NULL, NULL),
(2, 1, 0, 'Senior', NULL, '1', 'M', NULL, NULL),
(3, 1, 0, 'Junior', NULL, '1', 'M', 13, 17),
(4, 1, 0, 'Mirim', NULL, '1', 'X', 7, 12),
(5, 1, 1, 'Master', NULL, '1', 'M', 30, NULL),
(6, 1, 2, 'Veteranos', NULL, '1', 'M', 46, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_event`
--

CREATE TABLE IF NOT EXISTS `es_event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `expires` date NOT NULL,
  `id_venue` int(11) DEFAULT NULL COMMENT 'Venue ID',
  `id_sport_type` int(11) DEFAULT NULL COMMENT 'Sport Type ID',
  `id_association` int(11) NOT NULL,
  `www` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `es_event`
--

INSERT INTO `es_event` (`id_event`, `name`, `indate`, `outdate`, `expires`, `id_venue`, `id_sport_type`, `id_association`, `www`, `status`) VALUES
(1, 'Copa Futsal 2012', '2012-08-18 08:00:00', '2012-08-18 19:00:00', '2012-08-18', 1, 1, 8, 'http://www.imelesportes.com.br/futsal', 1),
(2, 'Copa Futsal 2014', '2014-08-16 08:00:00', '2014-08-16 19:00:00', '2014-06-30', 1, 1, 8, 'http://www.jimel.com.br', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_game`
--

CREATE TABLE IF NOT EXISTS `es_game` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `id_game_place` int(11) DEFAULT NULL,
  `id_user_keeper` int(11) DEFAULT NULL COMMENT 'game keeper user ID - Mesário/Apontador',
  `id_event` int(11) DEFAULT NULL,
  `id_team_a` int(11) DEFAULT NULL,
  `id_team_b` int(11) DEFAULT NULL,
  `score_a` int(11) DEFAULT NULL,
  `score_b` int(11) DEFAULT NULL,
  `id_winner` int(11) DEFAULT NULL,
  `is_finished` tinyint(4) DEFAULT '0',
  `id_group` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_game_place`
--

CREATE TABLE IF NOT EXISTS `es_game_place` (
  `id_game_place` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_venue` int(11) NOT NULL,
  PRIMARY KEY (`id_game_place`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `es_game_place`
--

INSERT INTO `es_game_place` (`id_game_place`, `name`, `id_venue`) VALUES
(4, 'A', 1),
(5, 'B', 1),
(6, 'C', 1),
(7, 'D', 1),
(8, 'E', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_group`
--

CREATE TABLE IF NOT EXISTS `es_group` (
  `id_group` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1' COMMENT '1 - ATIVO; 0 - INATIVO',
  `id_category` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `es_group`
--

INSERT INTO `es_group` (`id_group`, `status`, `id_category`) VALUES
('A', '1', 1),
('B', '1', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_score`
--

CREATE TABLE IF NOT EXISTS `es_score` (
  `id_score` int(11) NOT NULL AUTO_INCREMENT,
  `id_subscription` int(11) DEFAULT NULL,
  `id_game` int(11) DEFAULT NULL,
  `period` varchar(4) DEFAULT NULL COMMENT 'Template: #R or #T (R for regular period and T for tie period)',
  `id_score_type` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_score`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_score_type`
--

CREATE TABLE IF NOT EXISTS `es_score_type` (
  `id_score_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_score_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `es_score_type`
--

INSERT INTO `es_score_type` (`id_score_type`, `name`) VALUES
(1, 'Gol'),
(2, 'Falta'),
(3, 'Cartão Vermelho'),
(4, 'Cartão Amarelo'),
(5, 'Substituição'),
(6, 'Gol Contra');

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_sport_type`
--

CREATE TABLE IF NOT EXISTS `es_sport_type` (
  `id_sport_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `maxes_athlete` tinyint(4) DEFAULT NULL,
  `mines_athlete` tinyint(4) DEFAULT NULL,
  `num_athlete_line` tinyint(4) DEFAULT NULL,
  `playmode` tinyint(1) DEFAULT NULL COMMENT '0:single; 1:team',
  `num_period` tinyint(2) DEFAULT NULL,
  `duration_period` int(3) DEFAULT NULL COMMENT 'Duration of each regular period in minutes; leave blank if no time limit applies.',
  `num_tie_period` tinyint(1) DEFAULT NULL,
  `num_duration_tie` int(3) DEFAULT NULL COMMENT 'Duration of each tie period in minutes; leave blank if no time limit applies.',
  `num_initial_penaltie` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_sport_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `es_sport_type`
--

INSERT INTO `es_sport_type` (`id_sport_type`, `name`, `maxes_athlete`, `mines_athlete`, `num_athlete_line`, `playmode`, `num_period`, `duration_period`, `num_tie_period`, `num_duration_tie`, `num_initial_penaltie`) VALUES
(1, 'Futsal', 12, 6, 5, 1, 2, NULL, 2, NULL, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_subscription`
--

CREATE TABLE IF NOT EXISTS `es_subscription` (
  `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
  `id_athlete` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `jersey_num` int(3) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'INATIVO' COMMENT 'ATIVO; INATIVO',
  `id_event` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_subscription`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=624 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_team`
--

CREATE TABLE IF NOT EXISTS `es_team` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_association` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `jersey_main_color` varchar(50) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'ATIVO' COMMENT 'INATIVO; ATIVO',
  `group_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_user`
--

CREATE TABLE IF NOT EXISTS `es_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `profile` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:user; 1:club-representative; 2: team-representative; 3:admin',
  `gender` varchar(1) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:inactive; 1:active',
  `id_association` int(11) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=541 ;

--
-- Extraindo dados da tabela `es_user`
--

INSERT INTO `es_user` (`id_user`, `user_name`, `password`, `firstname`, `lastname`, `email`, `birthdate`, `phone`, `twitter`, `facebook`, `profile`, `gender`, `status`, `id_association`, `rg`, `cpf`, `is_staff`) VALUES
(533, 'emburaman', 'f146bde488269ec832d9da532bc0bbf1e0b1d207', 'Lincoln', 'Souza', 'emburaman@gmail.com', '1979-11-07', '(19) 9 8249-6232', NULL, NULL, 3, 'M', 1, 8, '', '', 1),
(534, 'rsimizu', '96664142e006e0bfc5e83bd3d21be6a3bba47f88', 'Reinaldo', 'Simizu', 'reinaldo.simizu@gmail.com', '1970-01-01', '', NULL, NULL, 3, 'M', 1, 8, '', '', 1),
(535, 'reinaldo1', '6a0cf770a1b737635a118af0b7e1f98a607597ab', 'Reinaldo', 'Representante 1', 'reinaldo.simizu@gmail.com', '1970-01-01', '', NULL, NULL, 1, 'M', 1, 7, '', '', NULL),
(536, 'reinaldo2', 'f878da5a09a104ac15a65d97a926b2076ddd8a3d', 'Reinaldo', 'Representante 2', 'reinaldo.simizu@gmail.com', '1970-01-01', '', NULL, NULL, 1, 'M', 1, 17, '', '', 1),
(537, 'lincoln', 'f146bde488269ec832d9da532bc0bbf1e0b1d207', 'Lincoln', 'Souza', 'emburaman@gmail.com', '1979-11-07', '', NULL, NULL, 1, 'M', 1, 5, '', '', NULL),
(540, 'atleta-01@teste.com', '9b4400aeec3998e4e4ccf5338c7bc14d5e0a251b', 'Atleta', 'Um', 'atleta-01@teste.com', '1979-11-07', NULL, NULL, NULL, 0, 'M', 1, NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `es_venue`
--

CREATE TABLE IF NOT EXISTS `es_venue` (
  `id_venue` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_venue`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `es_venue`
--

INSERT INTO `es_venue` (`id_venue`, `name`, `address`, `www`, `email`, `phone`) VALUES
(1, 'Paraiso 48', 'Estrada Municipal do Carmo, 1201 - Bairro do Carmo. Vargem Grande Paulista', 'http://www.paraiso48.com.br', 'paraiso48@paraiso48.com.br', '(11) 3763-6100');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_variables`
--

CREATE TABLE IF NOT EXISTS `sys_variables` (
  `var_key` varchar(255) NOT NULL,
  `var_value` longtext NOT NULL,
  `var_stringid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`var_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_variables`
--

INSERT INTO `sys_variables` (`var_key`, `var_value`, `var_stringid`) VALUES
('gender_both', 'X', ''),
('gender_fem', 'F', ''),
('gender_male', 'M', ''),
('play_mode_single', '0', ''),
('play_mode_team', '1', ''),
('status_active', '1', ''),
('status_inactive', '0', ''),
('type_club', '0', ''),
('type_conf', '2', ''),
('type_fed', '1', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_athletes`
--
CREATE TABLE IF NOT EXISTS `vw_athletes` (
`id_athlete` int(11)
,`id_user` int(11)
,`firstname` varchar(50)
,`lastname` varchar(50)
,`birthdate` date
,`age` int(9)
,`email` varchar(255)
,`user_name` varchar(255)
,`profile` tinyint(4)
,`status` tinyint(4)
,`id_association` int(11)
,`entity` varchar(255)
,`team_name` varchar(255)
,`jersey_main_color` varchar(50)
,`team_status` varchar(15)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_games`
--
CREATE TABLE IF NOT EXISTS `vw_games` (
`id_game` int(11)
,`date_time` datetime
,`id_game_place` int(11)
,`id_user_keeper` int(11)
,`id_event` int(11)
,`id_team_a` int(11)
,`id_team_b` int(11)
,`score_a` int(11)
,`score_b` int(11)
,`id_winner` int(11)
,`id_group` varchar(5)
,`quadra` varchar(50)
,`team_a` varchar(255)
,`team_b` varchar(255)
,`id_category` int(11)
,`category` varchar(255)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_score`
--
CREATE TABLE IF NOT EXISTS `vw_score` (
`id_subscription` int(11)
,`id_game` int(11)
,`id_score_type` int(11)
,`result` bigint(21)
,`id_team` int(11)
,`id_event` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_subscriptions`
--
CREATE TABLE IF NOT EXISTS `vw_subscriptions` (
`id_athlete` int(11)
,`id_association` int(11)
,`id_event` int(11)
,`athlete_status` int(1)
,`id_user` int(11)
,`lastname` varchar(50)
,`firstname` varchar(50)
,`birthdate` date
,`age` int(9)
,`user_status` tinyint(4)
,`id_subscription` int(11)
,`jersey_num` int(3)
,`subscription_status` varchar(15)
,`id_team` int(11)
,`name` varchar(255)
,`id_category` int(11)
,`group_id` varchar(11)
,`jersey_main_color` varchar(50)
,`team_status` varchar(15)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_teams`
--
CREATE TABLE IF NOT EXISTS `vw_teams` (
`id` int(11)
,`team_name` varchar(255)
,`color` varchar(50)
,`status` varchar(15)
,`group` varchar(11)
,`entity_id` int(11)
,`entity` varchar(255)
,`id_category` int(11)
,`category` varchar(255)
,`id_event` int(11)
,`num_athletes` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_athletes`
--
DROP TABLE IF EXISTS `vw_athletes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_athletes` AS select `a`.`id_athlete` AS `id_athlete`,`u`.`id_user` AS `id_user`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`email` AS `email`,`u`.`user_name` AS `user_name`,`u`.`profile` AS `profile`,`u`.`status` AS `status`,`e`.`id_association` AS `id_association`,`e`.`name` AS `entity`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from ((((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_association` `e` on((`e`.`id_association` = `a`.`id_association`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_games`
--
DROP TABLE IF EXISTS `vw_games`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_games` AS select `g`.`id_game` AS `id_game`,`g`.`date_time` AS `date_time`,`g`.`id_game_place` AS `id_game_place`,`g`.`id_user_keeper` AS `id_user_keeper`,`g`.`id_event` AS `id_event`,`g`.`id_team_a` AS `id_team_a`,`g`.`id_team_b` AS `id_team_b`,`g`.`score_a` AS `score_a`,`g`.`score_b` AS `score_b`,`g`.`id_winner` AS `id_winner`,`g`.`id_group` AS `id_group`,`p`.`name` AS `quadra`,`t1`.`name` AS `team_a`,`t2`.`name` AS `team_b`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category` from ((((`es_game` `g` left join `es_team` `t1` on((`t1`.`id_team` = `g`.`id_team_a`))) left join `es_team` `t2` on((`t2`.`id_team` = `g`.`id_team_b`))) left join `es_category` `c` on((`c`.`id_category` = `t1`.`id_category`))) left join `es_game_place` `p` on((`p`.`id_game_place` = `g`.`id_game_place`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_score`
--
DROP TABLE IF EXISTS `vw_score`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_score` AS select `es_score`.`id_subscription` AS `id_subscription`,`es_score`.`id_game` AS `id_game`,`es_score`.`id_score_type` AS `id_score_type`,count(`es_score`.`value`) AS `result`,`t`.`id_team` AS `id_team`,`t`.`id_event` AS `id_event` from ((`es_score` left join `es_subscription` `s` on((`s`.`id_subscription` = `es_score`.`id_subscription`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`))) group by `es_score`.`id_subscription`,`es_score`.`id_game`,`es_score`.`id_score_type`;

-- --------------------------------------------------------

--
-- Structure for view `vw_subscriptions`
--
DROP TABLE IF EXISTS `vw_subscriptions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_subscriptions` AS select `a`.`id_athlete` AS `id_athlete`,`a`.`id_association` AS `id_association`,`s`.`id_event` AS `id_event`,`a`.`status` AS `athlete_status`,`u`.`id_user` AS `id_user`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`birthdate` AS `birthdate`,floor(((to_days(now()) - to_days(`u`.`birthdate`)) / 365)) AS `age`,`u`.`status` AS `user_status`,`s`.`id_subscription` AS `id_subscription`,`s`.`jersey_num` AS `jersey_num`,`s`.`status` AS `subscription_status`,`t`.`id_team` AS `id_team`,`t`.`name` AS `name`,`t`.`id_category` AS `id_category`,`t`.`group_id` AS `group_id`,`t`.`jersey_main_color` AS `jersey_main_color`,`t`.`status` AS `team_status` from (((`es_athlete` `a` left join `es_user` `u` on((`u`.`id_user` = `a`.`id_user`))) left join `es_subscription` `s` on((`s`.`id_athlete` = `a`.`id_athlete`))) left join `es_team` `t` on((`t`.`id_team` = `s`.`id_team`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_teams`
--
DROP TABLE IF EXISTS `vw_teams`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_teams` AS select `t`.`id_team` AS `id`,`t`.`name` AS `team_name`,`t`.`jersey_main_color` AS `color`,`t`.`status` AS `status`,`t`.`group_id` AS `group`,`a`.`id_association` AS `entity_id`,`a`.`name` AS `entity`,`c`.`id_category` AS `id_category`,`c`.`name` AS `category`,`e`.`id_event` AS `id_event`,(select count(0) from `vw_subscriptions` `s` where (`s`.`id_team` = `id`)) AS `num_athletes` from (((`es_team` `t` left join `es_association` `a` on((`t`.`id_association` = `a`.`id_association`))) left join `es_category` `c` on((`t`.`id_category` = `c`.`id_category`))) left join `es_event` `e` on((`t`.`id_event` = `e`.`id_event`))) where (`e`.`status` = 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;