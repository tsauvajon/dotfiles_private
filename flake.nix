{
  description = "Private dotfiles overlay";

  outputs =
    { self, ... }:
    let
      root = ./.;
      existingPath = path: if builtins.pathExists path then path else null;
    in
    {
      git = {
        name = "Thomas Sauvajon";
        email = "thomas.sauvajon@proton.me";
        signingKey = "3729D47D63C773E3";
        extraConfigInclude = existingPath (root + "/extra.gitconfig");
      };

      goto = {
        apiUrl = "http://dietpi.local:50002";
        bookmarksFile = existingPath (root + "/goto/database.yml");
      };

      opencode = {
        commandsDir = existingPath (root + "/opencode/commands");
        skillsDir = existingPath (root + "/opencode/skills");
        agentsDir = existingPath (root + "/opencode/agents");
        pluginsDir = existingPath (root + "/opencode/plugins");
        rulesDir = existingPath (root + "/opencode/rules");
        configFile = existingPath (root + "/opencode/opencode.json");
        packageFile = existingPath (root + "/opencode/package.json");
        imports = [ ];
      };

      homeModules = [ ];
    };
}
