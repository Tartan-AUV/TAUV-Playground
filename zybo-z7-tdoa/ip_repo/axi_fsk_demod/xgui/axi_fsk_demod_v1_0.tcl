# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "N"
  ipgui::add_param $IPINST -name "COEFF_A"
  ipgui::add_param $IPINST -name "COEFF_B_LO_RE"
  ipgui::add_param $IPINST -name "COEFF_B_LO_IM"
  ipgui::add_param $IPINST -name "COEFF_B_HI_RE"
  ipgui::add_param $IPINST -name "COEFF_B_HI_IM"

}

proc update_PARAM_VALUE.COEFF_A { PARAM_VALUE.COEFF_A } {
	# Procedure called to update COEFF_A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_A { PARAM_VALUE.COEFF_A } {
	# Procedure called to validate COEFF_A
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_IM { PARAM_VALUE.COEFF_B_HI_IM } {
	# Procedure called to update COEFF_B_HI_IM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_IM { PARAM_VALUE.COEFF_B_HI_IM } {
	# Procedure called to validate COEFF_B_HI_IM
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_RE { PARAM_VALUE.COEFF_B_HI_RE } {
	# Procedure called to update COEFF_B_HI_RE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_RE { PARAM_VALUE.COEFF_B_HI_RE } {
	# Procedure called to validate COEFF_B_HI_RE
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_IM { PARAM_VALUE.COEFF_B_LO_IM } {
	# Procedure called to update COEFF_B_LO_IM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_IM { PARAM_VALUE.COEFF_B_LO_IM } {
	# Procedure called to validate COEFF_B_LO_IM
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_RE { PARAM_VALUE.COEFF_B_LO_RE } {
	# Procedure called to update COEFF_B_LO_RE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_RE { PARAM_VALUE.COEFF_B_LO_RE } {
	# Procedure called to validate COEFF_B_LO_RE
	return true
}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}


proc update_MODELPARAM_VALUE.COEFF_A { MODELPARAM_VALUE.COEFF_A PARAM_VALUE.COEFF_A } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_A}] ${MODELPARAM_VALUE.COEFF_A}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_RE { MODELPARAM_VALUE.COEFF_B_LO_RE PARAM_VALUE.COEFF_B_LO_RE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_RE}] ${MODELPARAM_VALUE.COEFF_B_LO_RE}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_IM { MODELPARAM_VALUE.COEFF_B_LO_IM PARAM_VALUE.COEFF_B_LO_IM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_IM}] ${MODELPARAM_VALUE.COEFF_B_LO_IM}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_RE { MODELPARAM_VALUE.COEFF_B_HI_RE PARAM_VALUE.COEFF_B_HI_RE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_RE}] ${MODELPARAM_VALUE.COEFF_B_HI_RE}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_IM { MODELPARAM_VALUE.COEFF_B_HI_IM PARAM_VALUE.COEFF_B_HI_IM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_IM}] ${MODELPARAM_VALUE.COEFF_B_HI_IM}
}

proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

