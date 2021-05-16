<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'user' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET', 'utf8' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';

/*WP debugging mode */
define( 'WP_DEBUG', true );

/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         ':n;B_,NA^/G[@[&}Z|rE>t.Z-=D5ly3B9V@([YJ__:y>_zol/@S@ikG||.)-og%#');
define('SECURE_AUTH_KEY',  't!luV7^9Ku[p}gk,v%LF&P-E!T]5`ltoqi 4g<TDhTOwS1!+;/${|S/2&nGvb(a5');
define('LOGGED_IN_KEY',    'xXV-t-!0X5%cg|1?<+TJ5O>e>92a-| !P]D+*b=F+7 Ft7Bg+P~b3NXYOml**zBP');
define('NONCE_KEY',        'd=6y&|{/e<,>W=xB[zK3{X3~W<USE//a?|krHRgb>0[UD+}zlCx8>C,9Lg3jg_<&');
define('AUTH_SALT',        '|~a6-`pLx-/}2iQZO8NC|B$+YgBCW~>73(GZMOxmU|n]W%H^Qq,tE-B|fbgW^+3t');
define('SECURE_AUTH_SALT', 'j[W3eXn/uWBlnId*t(60C;i+tVwv_-#EJpSb-8@Isl95Sq1Ir$1NW-z|VUok{_#`');
define('LOGGED_IN_SALT',   'gX}.Q)KT9692n0BL`Z6g(Kfvp0JSZ<. lYg@{E[?TMe4hGa}T[),rx#u8rTYjfjf');
define('NONCE_SALT',       'fOi>fdI g<yTCq>nSr=-`nM0o(]F1uW|+) gD<-QJ~7qm`jEkNm-i362mwO)&liZ');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');