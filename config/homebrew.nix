{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "docker"
      "ghostty"
      "1password"
      "keybase"
      "microsoft-teams"
      "firefox@developer-edition"
      "aerospace"
      "microsoft-edge"
    ];
    brews = [
      "nss"
    ];
    onActivation.cleanup = "zap";

    masApps = {
      # "Okta Verify" = 490179405;
      "Xcode" = 497799835;
    };
    taps = [ "nikitabobko/tap" ];
  };
}
