<?php
/**
 * @file plugins/themes/univalle/UnivalleThemePlugin.inc.php
 *
* Author: Juan Pablo Castro
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class UnivalleThemePlugin
 * @ingroup plugins_themes_default
 *
 * @brief Univalle theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class UnivalleThemePlugin extends ThemePlugin {

    public function __construct()
	{
		parent::__construct();

    }
    
	/**
	 * @copydoc ThemePlugin::isActive()
	 */
	public function isActive() {
		if (defined('SESSION_DISABLE_INIT')) return true;
		return parent::isActive();
    }
    
	/**
	 * Initialize the theme's styles, scripts and hooks. This is run on the
	 * currently active theme and it's parent themes.
	 *
	 * @return null
	 */
	public function init() {
		// Register theme options
	
		// Load primary stylesheet
        $base_url = Config::getVar('general', 'base_url');
		$lessVariables = ["@theme_name: 'univalle';", "@base_url: '$base_url';"];
		$this->setParent('defaultthemeplugin');
		$this->addStyle(
			'child-stylesheet',
			'styles/index.less',
            array('addLessVariables' => join($lessVariables)));	
        
        // Load Bootsrap's dropdown

        $this->addStyle('child-stylesheet-boot', 'bootstrap/css/bootstrap.min.css');

		
        // Load Bootsrap's dropdown
        //$this->addScript('popper', 'js/lib/popper/popper.js');
        //$this->addScript('bsUtil', 'js/lib/bootstrap/util.js');
        //$this->addScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');
        $this->addScript('bsJs', 'bootstrap/js/bootstrap.min.js');
    
        // Load custom JavaScript for this theme
        //$this->addScript('default', 'js/main.js');

    }
    
	/**
	 * Get the name of the settings file to be installed on new journal
	 * creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
    }
    
	/**
	 * Get the name of the settings file to be installed site-wide when
	 * OJS is installed.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
    }
    
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.default.name');
    }
    
	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.default.description');
	}
}