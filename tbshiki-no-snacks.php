<?php
/**
 * Plugin Name: No Snacks
 * Description: Not every feature deserves a treat.
 * Version: 0.1.0
 * License: GPL-2.0-or-later
 * Update URI: false
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

add_filter( 'wp_enable_random_content_redirect', '__return_false' );

register_activation_hook( __FILE__, 'tbshiki_no_snacks_activate' );
function tbshiki_no_snacks_activate() {
	flush_rewrite_rules();
}

register_deactivation_hook( __FILE__, 'tbshiki_no_snacks_deactivate' );
function tbshiki_no_snacks_deactivate() {
	remove_filter( 'wp_enable_random_content_redirect', '__return_false' );
	flush_rewrite_rules();
}
