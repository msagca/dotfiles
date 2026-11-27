$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.keybindings ++= [
  { name: vi_insert_altgr, modifier: control_alt, keycode: char_i, mode: vi_normal, event: { send: SwitchMode, mode: vi_insert } }
  { name: vi_line_end_altgr, modifier: control_alt, keycode: 'char_$', mode: vi_normal, event: { edit: MoveToLineEnd } }
  { name: vi_switch_case_altgr, modifier: control_alt, keycode: 'char_~', mode: vi_normal, event: { edit: SwitchcaseChar } }
]
alias cat = open --raw
