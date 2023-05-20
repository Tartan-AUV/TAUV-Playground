# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "N"
  ipgui::add_param $IPINST -name "COEFF_A"
  ipgui::add_param $IPINST -name "COEFF_B_LO_RE_0"
  ipgui::add_param $IPINST -name "COEFF_B_LO_IM_0"
  ipgui::add_param $IPINST -name "COEFF_B_LO_RE_1"
  ipgui::add_param $IPINST -name "COEFF_B_LO_IM_1"
  ipgui::add_param $IPINST -name "COEFF_B_LO_RE_2"
  ipgui::add_param $IPINST -name "COEFF_B_LO_IM_2"
  ipgui::add_param $IPINST -name "COEFF_B_HI_RE_0"
  ipgui::add_param $IPINST -name "COEFF_B_HI_IM_0"
  ipgui::add_param $IPINST -name "COEFF_B_HI_RE_1"
  ipgui::add_param $IPINST -name "COEFF_B_HI_IM_1"
  ipgui::add_param $IPINST -name "COEFF_B_HI_RE_2"
  ipgui::add_param $IPINST -name "COEFF_B_HI_IM_2"

}

proc update_PARAM_VALUE.COEFF_A { PARAM_VALUE.COEFF_A } {
	# Procedure called to update COEFF_A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_A { PARAM_VALUE.COEFF_A } {
	# Procedure called to validate COEFF_A
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_IM_0 { PARAM_VALUE.COEFF_B_HI_IM_0 } {
	# Procedure called to update COEFF_B_HI_IM_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_IM_0 { PARAM_VALUE.COEFF_B_HI_IM_0 } {
	# Procedure called to validate COEFF_B_HI_IM_0
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_IM_1 { PARAM_VALUE.COEFF_B_HI_IM_1 } {
	# Procedure called to update COEFF_B_HI_IM_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_IM_1 { PARAM_VALUE.COEFF_B_HI_IM_1 } {
	# Procedure called to validate COEFF_B_HI_IM_1
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_IM_2 { PARAM_VALUE.COEFF_B_HI_IM_2 } {
	# Procedure called to update COEFF_B_HI_IM_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_IM_2 { PARAM_VALUE.COEFF_B_HI_IM_2 } {
	# Procedure called to validate COEFF_B_HI_IM_2
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_RE_0 { PARAM_VALUE.COEFF_B_HI_RE_0 } {
	# Procedure called to update COEFF_B_HI_RE_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_RE_0 { PARAM_VALUE.COEFF_B_HI_RE_0 } {
	# Procedure called to validate COEFF_B_HI_RE_0
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_RE_1 { PARAM_VALUE.COEFF_B_HI_RE_1 } {
	# Procedure called to update COEFF_B_HI_RE_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_RE_1 { PARAM_VALUE.COEFF_B_HI_RE_1 } {
	# Procedure called to validate COEFF_B_HI_RE_1
	return true
}

proc update_PARAM_VALUE.COEFF_B_HI_RE_2 { PARAM_VALUE.COEFF_B_HI_RE_2 } {
	# Procedure called to update COEFF_B_HI_RE_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_HI_RE_2 { PARAM_VALUE.COEFF_B_HI_RE_2 } {
	# Procedure called to validate COEFF_B_HI_RE_2
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_IM_0 { PARAM_VALUE.COEFF_B_LO_IM_0 } {
	# Procedure called to update COEFF_B_LO_IM_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_IM_0 { PARAM_VALUE.COEFF_B_LO_IM_0 } {
	# Procedure called to validate COEFF_B_LO_IM_0
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_IM_1 { PARAM_VALUE.COEFF_B_LO_IM_1 } {
	# Procedure called to update COEFF_B_LO_IM_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_IM_1 { PARAM_VALUE.COEFF_B_LO_IM_1 } {
	# Procedure called to validate COEFF_B_LO_IM_1
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_IM_2 { PARAM_VALUE.COEFF_B_LO_IM_2 } {
	# Procedure called to update COEFF_B_LO_IM_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_IM_2 { PARAM_VALUE.COEFF_B_LO_IM_2 } {
	# Procedure called to validate COEFF_B_LO_IM_2
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_RE_0 { PARAM_VALUE.COEFF_B_LO_RE_0 } {
	# Procedure called to update COEFF_B_LO_RE_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_RE_0 { PARAM_VALUE.COEFF_B_LO_RE_0 } {
	# Procedure called to validate COEFF_B_LO_RE_0
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_RE_1 { PARAM_VALUE.COEFF_B_LO_RE_1 } {
	# Procedure called to update COEFF_B_LO_RE_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_RE_1 { PARAM_VALUE.COEFF_B_LO_RE_1 } {
	# Procedure called to validate COEFF_B_LO_RE_1
	return true
}

proc update_PARAM_VALUE.COEFF_B_LO_RE_2 { PARAM_VALUE.COEFF_B_LO_RE_2 } {
	# Procedure called to update COEFF_B_LO_RE_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFF_B_LO_RE_2 { PARAM_VALUE.COEFF_B_LO_RE_2 } {
	# Procedure called to validate COEFF_B_LO_RE_2
	return true
}

proc update_PARAM_VALUE.DECIMAL_BITS { PARAM_VALUE.DECIMAL_BITS } {
	# Procedure called to update DECIMAL_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DECIMAL_BITS { PARAM_VALUE.DECIMAL_BITS } {
	# Procedure called to validate DECIMAL_BITS
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

proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_RE_0 { MODELPARAM_VALUE.COEFF_B_LO_RE_0 PARAM_VALUE.COEFF_B_LO_RE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_RE_0}] ${MODELPARAM_VALUE.COEFF_B_LO_RE_0}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_IM_0 { MODELPARAM_VALUE.COEFF_B_LO_IM_0 PARAM_VALUE.COEFF_B_LO_IM_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_IM_0}] ${MODELPARAM_VALUE.COEFF_B_LO_IM_0}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_RE_1 { MODELPARAM_VALUE.COEFF_B_LO_RE_1 PARAM_VALUE.COEFF_B_LO_RE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_RE_1}] ${MODELPARAM_VALUE.COEFF_B_LO_RE_1}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_IM_1 { MODELPARAM_VALUE.COEFF_B_LO_IM_1 PARAM_VALUE.COEFF_B_LO_IM_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_IM_1}] ${MODELPARAM_VALUE.COEFF_B_LO_IM_1}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_RE_2 { MODELPARAM_VALUE.COEFF_B_LO_RE_2 PARAM_VALUE.COEFF_B_LO_RE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_RE_2}] ${MODELPARAM_VALUE.COEFF_B_LO_RE_2}
}

proc update_MODELPARAM_VALUE.COEFF_B_LO_IM_2 { MODELPARAM_VALUE.COEFF_B_LO_IM_2 PARAM_VALUE.COEFF_B_LO_IM_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_LO_IM_2}] ${MODELPARAM_VALUE.COEFF_B_LO_IM_2}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_RE_0 { MODELPARAM_VALUE.COEFF_B_HI_RE_0 PARAM_VALUE.COEFF_B_HI_RE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_RE_0}] ${MODELPARAM_VALUE.COEFF_B_HI_RE_0}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_IM_0 { MODELPARAM_VALUE.COEFF_B_HI_IM_0 PARAM_VALUE.COEFF_B_HI_IM_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_IM_0}] ${MODELPARAM_VALUE.COEFF_B_HI_IM_0}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_RE_1 { MODELPARAM_VALUE.COEFF_B_HI_RE_1 PARAM_VALUE.COEFF_B_HI_RE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_RE_1}] ${MODELPARAM_VALUE.COEFF_B_HI_RE_1}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_IM_1 { MODELPARAM_VALUE.COEFF_B_HI_IM_1 PARAM_VALUE.COEFF_B_HI_IM_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_IM_1}] ${MODELPARAM_VALUE.COEFF_B_HI_IM_1}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_RE_2 { MODELPARAM_VALUE.COEFF_B_HI_RE_2 PARAM_VALUE.COEFF_B_HI_RE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_RE_2}] ${MODELPARAM_VALUE.COEFF_B_HI_RE_2}
}

proc update_MODELPARAM_VALUE.COEFF_B_HI_IM_2 { MODELPARAM_VALUE.COEFF_B_HI_IM_2 PARAM_VALUE.COEFF_B_HI_IM_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFF_B_HI_IM_2}] ${MODELPARAM_VALUE.COEFF_B_HI_IM_2}
}

proc update_MODELPARAM_VALUE.DECIMAL_BITS { MODELPARAM_VALUE.DECIMAL_BITS PARAM_VALUE.DECIMAL_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECIMAL_BITS}] ${MODELPARAM_VALUE.DECIMAL_BITS}
}

