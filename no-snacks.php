<?php
/**
 * Plugin Name: No Snacks
 * Description: Not every feature deserves a treat.
 * Version: 1.0.0
 * License: GPL-2.0-or-later
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

add_filter( 'wp_enable_random_content_redirect', '__return_false' );

register_activation_hook( __FILE__, 'no_snacks_activate' );
function no_snacks_activate() {
	flush_rewrite_rules();
}

register_deactivation_hook( __FILE__, 'no_snacks_deactivate' );
function no_snacks_deactivate() {
	remove_filter( 'wp_enable_random_content_redirect', '__return_false' );
	flush_rewrite_rules();
}
