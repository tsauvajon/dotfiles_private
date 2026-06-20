{
  description = "Private dotfiles overlay";

  outputs =
    { ... }:
    {
      git = {
        name = "Thomas Sauvajon";
        email = "thomas.sauvajon@proton.me";
        signingKey = "3729D47D63C773E3";
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
        imports = [ ];
      };
    };
}
