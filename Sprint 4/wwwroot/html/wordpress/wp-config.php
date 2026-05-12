<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'Betisware' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'Betisware5' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'qr%I0y k0{N-({bY-[] l!va%]TSi?Yb5Q<<m+BdwWfW5AAKk6Oqp(es!bhNE^DR' );
define( 'SECURE_AUTH_KEY',  '!3w(|P|Rxd$_%7vp6kLf;YK>5u$P}tJnKA1Dt6nEG|_c;3a!@=N<&,j]2z<]V:tH' );
define( 'LOGGED_IN_KEY',    '1&}-)tv)$O@[1MuS28**<^[F2WmEZl|]W.Fn<,7osL-y!a3*o54GB{ M|W+E#w0D' );
define( 'NONCE_KEY',        'C9-qd{tc}KxUhUP&fOUW5:plI|&xc$i(}Ir}oEAIG S[T6u-H9|5Eb2xp]37-Xm}' );
define( 'AUTH_SALT',        'OFpyfwqdr f4cvBuUr-x7|)o{hN2g@W+C(x bc&D3ln k)5EW_4`Bt#KhOF~+=0W' );
define( 'SECURE_AUTH_SALT', 'V8?)htY[Mr#auc~=!qIY5*l|}BRq-BjZ+z^3I_yH~P+!$4j5ckjtzbAm6CU(~NCf' );
define( 'LOGGED_IN_SALT',   'V8?)htY[Mr#auc~=!qIY5*l|}BRq-BjZ+z^3I_yH~P+!$4j5ckjtzbAm6CU(~NCf' );
define( 'NONCE_SALT',       'atfsd80-g>@7X.G6Pq=o^DTgLFW7irEN-z<DfOLhVaI-IEUW]`2 :w*-.y5T,ylS' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
