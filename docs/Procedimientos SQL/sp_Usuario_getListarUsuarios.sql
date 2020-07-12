-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.4-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para procedimiento laravel-vue.sp_Usuario_getListarUsuarios
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getListarUsuarios`(
	IN `cnombre` VARCHAR(50),
	IN `cusuario` VARCHAR(50),
	IN `ccorreo` VARCHAR(50),
	IN `cestado` CHAR(1)
)
BEGIN
	SELECT u.id, 
		CONCAT_WS('',u.firstname, u.secondname, u.lastname) AS fullname,
		u.firstname,
		u.secondname,
		u.lastname, 
		u.username, 
		IFNULL(u.email, '') AS email, 
		CASE IFNULL(u.state, '') WHEN 'A' THEN 'ACTIVO'
														ELSE 'INACIVO'
														END state_alias, 
		IFNULL(u.state, '') AS state
		
	
	FROM users u
	WHERE CONCAT_WS('',u.firstname, u.secondname, u.lastname) LIKE  CONCAT('%', cnombre, '%')
		AND CONCAT_WS('', u.username) LIKE CONCAT('%',cusuario,'%') 
		AND CONCAT_WS('', u.email) LIKE CONCAT('%', ccorreo, '%')
		AND (u.state = cestado OR cestado = '')
	ORDER BY u.id DESC; 	

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
