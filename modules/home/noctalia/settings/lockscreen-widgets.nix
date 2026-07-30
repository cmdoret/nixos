{ }:
let
  id = "lockscreen-login-box@eDP-1";
in
{
  enabled = true;
  schema_version = 2;
  widget_order = [ id ];
  widget.${id} = {
    type = "login_box";
    output = "eDP-1";
    cx = 960.0;
    cy = 1018.0;
    box_width = 810.0;
    box_height = 196.0;
    rotation = 0.0;
    settings = {
      background_color = "surface_variant";
      background_opacity = 0.88;
      background_radius = 12.0;
      center_password_text = false;
      input_opacity = 1.0;
      input_radius = 6.0;
      layout = "regular";
      show_caps_lock = true;
      show_keyboard_layout = true;
      show_login_button = true;
      show_media = true; # was general.enableLockScreenMediaControls
      show_session_buttons = true;
      show_unlock_hint = true;
      show_weather = true;
    };
  };
}
