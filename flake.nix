{
  description = "Private dotfiles overlay";

  outputs =
    { ... }:
    {
      git = {
        name = "Thomas Sauvajon";
        email = "thomas.sauvajon@proton.me";
        signingKey = "~/.ssh/id_ed25519.pub";
        extraConfigInclude = ./extra.gitconfig;
      };

      goto = {
        apiUrl = "http://dietpi.local:50002";
        bookmarksFile = null;
      };

      personal = {
        enable = true;
      };

      opencode = {
        configFile = ./opencode/opencode.json;
        imports = [ ];
      };
    };
}
