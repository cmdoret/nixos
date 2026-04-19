{username, terminal}:
{
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        usb-drive-manager = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
      pluginSettings = {
        tailscale = {
          compactMode = true;
          hideDisconnected = true;
          sshUsername = username;
          terminalCommand = terminal;
        };
        usb-drive-manager = {
          hideWhenEmpty = true;
          autoMount = false;
        };
      };
    }
