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
        apiKeyFile = /home/thomas/.secrets/goto-api-key;
        bookmarksFile = null;
      };

      personal = {
        enable = true;

        # Brother printer SNMP bridge (arch only: the printer is on this
        # LAN). Scraped by VictoriaMetrics on the homeserver apps host via
        # tag:printer-exporter; module config mirrors the reviewed baseline
        # in homeserver/grafana-dashboards infra/arch-printer-exporter.
        "printer-exporter" = {
          enable = true;
          bindAddress = "100.66.158.32:9116";
          configFile = ./printer-exporter/snmp.yml;
        };

        # CUPS print server (arch only: CUPS listens on localhost:631
        # here). Scraped by VictoriaMetrics on the homeserver apps host via
        # tag:printer-exporter on TCP/9628.
        "cups-exporter" = {
          enable = true;
          bindAddress = "100.66.158.32:9628";
        };
      };

      opencode = {
        configFile = ./opencode/opencode.json;
        imports = [ ];
      };
    };
}
