{ config, pkgs, ... }:

{
	programs.firefox =
	{
		enable = true;
		policies =
		{
			RestoreOnStartup = 1;
			DisableTelemetry = true;
			SearchEngines =
			{
				Default = "Startpage";
				PreventInstalls = true;
			};

			Homepage =
			{
				StartPage = "https://startpage.com";
				URL = "https://startpage.com";
			};
			SearchBar = "unified"; # or "separate"
			Extensions =
			{
				Install =
				[
					"https://addons.mozilla.org/firefox/downloads/file/4458450/ublock_origin-latest.xpi"
					"https://addons.mozilla.org/firefox/downloads/file/4465727/sponsorblock-latest.xpi"
					"https://addons.mozilla.org/firefox/downloads/file/4451438/styl_us-latest.xpi"
					"https://addons.mozilla.org/firefox/downloads/file/4439735/darkreader-latest.xpi"
					"https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-latest.xpi"
					"https://addons.mozilla.org/firefox/downloads/file/4467426/bitwarden_password_manager-latest.xpi"
				];
			};
		};
	};
}