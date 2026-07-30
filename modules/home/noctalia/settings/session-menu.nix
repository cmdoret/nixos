{ }:
{
  grid = false;
  show_shortcuts = true;
  actions = [
    {
      action = "lock";
      enabled = true;
      shortcut = "L";
    }
    {
      action = "suspend";
      enabled = true;
      shortcut = "U";
    }
    {
      action = "command";
      enabled = true;
      shortcut = "H";
      label = "Hibernate";
      command = "systemctl hibernate";
    }
    {
      action = "reboot";
      enabled = true;
      shortcut = "R";
    }
    {
      action = "logout";
      enabled = true;
      shortcut = "O";
    }
    {
      action = "shutdown";
      enabled = true;
      shortcut = "S";
    }
  ];
}
