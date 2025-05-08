CREATE TABLE `Foci csapat`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `jatekosszam` BIGINT NOT NULL,
    `csapatnev` VARCHAR(255) NOT NULL,
    `Iskolanev` BIGINT NOT NULL,
    `jatekosId` BIGINT NOT NULL,
    `merkozes_Id` BIGINT NOT NULL
);
CREATE TABLE `fJatekos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mezszam` SMALLINT NOT NULL,
    `gol_Id` BIGINT NOT NULL,
    `nev` VARCHAR(255) NOT NULL,
    `buntetes_Id` SMALLINT NOT NULL,
    `szulev` DATE NOT NULL
);
CREATE TABLE `fGólok`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL
);
CREATE TABLE `fszabálytalanság`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `falyta` VARCHAR(255) NOT NULL,
    `sarga` BIGINT NOT NULL,
    `piros` BIGINT NOT NULL,
    `idopont` DATETIME NOT NULL
);
CREATE TABLE `fMerkozes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL,
    `helyszin` VARCHAR(255) NOT NULL
);
CREATE TABLE `Kezilabda_csapat`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `jatekosszam` BIGINT NOT NULL,
    `csapatnev` VARCHAR(255) NOT NULL,
    `Iskolanev` BIGINT NOT NULL,
    `jatekos_Id` BIGINT NOT NULL,
    `merkozes_Id` BIGINT NOT NULL
);
CREATE TABLE `kJatekos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mezszam` SMALLINT NOT NULL,
    `gol_Id` BIGINT NOT NULL,
    `nev` VARCHAR(255) NOT NULL,
    `buntetes_Id` SMALLINT NOT NULL,
    `szulev` DATE NOT NULL
);
CREATE TABLE `kGólok`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL
);
CREATE TABLE `kszabalytalansag`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `falyta` VARCHAR(255) NOT NULL,
    `sarga` BIGINT NOT NULL,
    `piros` BIGINT NOT NULL,
    `idopont` DATETIME NOT NULL
);
CREATE TABLE `kMerkozes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL,
    `helyszin` VARCHAR(255) NOT NULL,
    `csapat_Id` BIGINT NOT NULL
);
CREATE TABLE `Ijasz_csapat`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Iskolanev` VARCHAR(255) NOT NULL,
    `jatekos_Id` BIGINT NOT NULL
);
CREATE TABLE `iJatekos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nev` VARCHAR(255) NOT NULL,
    `szulev` DATE NOT NULL,
    `kategoria` BOOLEAN NOT NULL,
    `pontok_Id` BIGINT NOT NULL
);
CREATE TABLE `loveszetpont`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `egyenitalalat` BIGINT NOT NULL,
    `egyenipont` BIGINT NOT NULL,
    `csapattalat` BIGINT NOT NULL,
    `csapatpont` BIGINT NOT NULL
);
CREATE TABLE `iMerkozes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL,
    `helyszin` VARCHAR(255) NOT NULL,
    `csapat_Id` BIGINT NOT NULL
);
CREATE TABLE `rMerkozes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idopont` DATETIME NOT NULL,
    `helyszin` VARCHAR(255) NOT NULL,
    `csapat_Id` BIGINT NOT NULL
);
CREATE TABLE `roplabda_csapat`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Iskolanev` VARCHAR(255) NOT NULL,
    `csapatnev` VARCHAR(255) NOT NULL,
    `jatekosszam` BIGINT NOT NULL,
    `jatekos_Id` BIGINT NOT NULL
);
CREATE TABLE `rJatekos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mezszam` BIGINT NOT NULL,
    `nev` VARCHAR(255) NOT NULL,
    `szulev` DATE NOT NULL,
    `buntetes_Id` BIGINT NOT NULL,
    `pontok_Id` BIGINT NOT NULL
);
CREATE TABLE `buntetes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `falyta` VARCHAR(255) NOT NULL,
    `sulyossag` SMALLINT NOT NULL
);
CREATE TABLE `pontok`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `szervak` BIGINT NOT NULL,
    `hibasszervak` BIGINT NOT NULL,
    `szerzettpont` BIGINT NOT NULL
);
ALTER TABLE
    `rJatekos` ADD CONSTRAINT `rjatekos_buntetes_id_foreign` FOREIGN KEY(`buntetes_Id`) REFERENCES `buntetes`(`id`);
ALTER TABLE
    `rMerkozes` ADD CONSTRAINT `rmerkozes_csapat_id_foreign` FOREIGN KEY(`csapat_Id`) REFERENCES `roplabda_csapat`(`id`);
ALTER TABLE
    `rJatekos` ADD CONSTRAINT `rjatekos_pontok_id_foreign` FOREIGN KEY(`pontok_Id`) REFERENCES `pontok`(`id`);
ALTER TABLE
    `roplabda_csapat` ADD CONSTRAINT `roplabda_csapat_jatekos_id_foreign` FOREIGN KEY(`jatekos_Id`) REFERENCES `rJatekos`(`id`);
ALTER TABLE
    `Ijasz_csapat` ADD CONSTRAINT `ijasz_csapat_jatekos_id_foreign` FOREIGN KEY(`jatekos_Id`) REFERENCES `iJatekos`(`id`);
ALTER TABLE
    `kJatekos` ADD CONSTRAINT `kjatekos_gol_id_foreign` FOREIGN KEY(`gol_Id`) REFERENCES `kGólok`(`id`);
ALTER TABLE
    `fJatekos` ADD CONSTRAINT `fjatekos_buntetes_id_foreign` FOREIGN KEY(`buntetes_Id`) REFERENCES `fszabálytalanság`(`id`);
ALTER TABLE
    `fJatekos` ADD CONSTRAINT `fjatekos_gol_id_foreign` FOREIGN KEY(`gol_Id`) REFERENCES `fGólok`(`id`);
ALTER TABLE
    `kMerkozes` ADD CONSTRAINT `kmerkozes_csapat_id_foreign` FOREIGN KEY(`csapat_Id`) REFERENCES `Kezilabda_csapat`(`id`);
ALTER TABLE
    `kJatekos` ADD CONSTRAINT `kjatekos_buntetes_id_foreign` FOREIGN KEY(`buntetes_Id`) REFERENCES `kszabalytalansag`(`id`);
ALTER TABLE
    `iJatekos` ADD CONSTRAINT `ijatekos_pontok_id_foreign` FOREIGN KEY(`pontok_Id`) REFERENCES `loveszetpont`(`id`);
ALTER TABLE
    `Kezilabda_csapat` ADD CONSTRAINT `kezilabda_csapat_jatekos_id_foreign` FOREIGN KEY(`jatekos_Id`) REFERENCES `kJatekos`(`id`);
ALTER TABLE
    `Foci csapat` ADD CONSTRAINT `foci csapat_jatekosid_foreign` FOREIGN KEY(`jatekosId`) REFERENCES `fJatekos`(`id`);
ALTER TABLE
    `Foci csapat` ADD CONSTRAINT `foci csapat_merkozes_id_foreign` FOREIGN KEY(`merkozes_Id`) REFERENCES `fMerkozes`(`id`);
ALTER TABLE
    `iMerkozes` ADD CONSTRAINT `imerkozes_csapat_id_foreign` FOREIGN KEY(`csapat_Id`) REFERENCES `Ijasz_csapat`(`id`);