{
  description = "Private dotfiles overlay";

  outputs =
    { self }:
    let
      root = ./.;
      configFile = root + "/config.toml";
      config =
        if builtins.pathExists configFile then builtins.fromTOML (builtins.readFile configFile) else { };
      gitConfig = config.git or { };
      gotoConfig = config.goto or { };
      existingPath = path: if builtins.pathExists path then path else null;
    in
    {
      git = {
        name = gitConfig.name or "";
        email = gitConfig.email or "";
        signingKey = gitConfig.signing_key or "";
        extraConfigInclude = existingPath (root + "/extra.gitconfig");
      };

      goto = {
        apiUrl = gotoConfig.api_url or null;
        bookmarksFile = existingPath (root + "/goto/database.yml");
      };

      opencode = {
        commandsDir = root + "/opencode/commands";
        skillsDir = root + "/opencode/skills";
        agentsDir = root + "/opencode/agents";
        pluginsDir = root + "/opencode/plugins";
        rulesDir = root + "/opencode/rules";
        configFile = root + "/opencode/opencode.json";
        packageFile = root + "/opencode/package.json";
      };
    };
}
