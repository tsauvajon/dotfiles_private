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
        apiUrl = "https://go.svj.email";
        # Create an Authentik application password for user thomas
        # (Authentik UI), store it here with mode 0600, then uncomment.
        # Until set, resolving links works but creating/replacing asks
        # Authentik at the edge.
        # apiKeyFile = /home/thomas/.secrets/goto-api-key;
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
