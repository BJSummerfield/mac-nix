{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "zoom"
      "docker"
      "ghostty"
      "1password"
      "keybase"
      "microsoft-teams"
      "firefox@developer-edition"
      "aerospace"
    ];
    onActivation.cleanup = "zap";

    masApps = {
      "Okta Verify" = 490179405;
      "Xcode" = 497799835;
      "Company Portal" = 719171358;
    };
    taps = [ "nikitabobko/tap" ];
  };
}
