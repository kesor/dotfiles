show_ncspot() {
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_<module_name>_icon"  "#(ncspot-info.sh icon)"              )"
  color="$( get_tmux_option "@catppuccin_<module_name>_color" "$thm_orange"    )"
  text="$(  get_tmux_option "@catppuccin_<module_name>_text"  "#(ncspot-info.sh)" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
