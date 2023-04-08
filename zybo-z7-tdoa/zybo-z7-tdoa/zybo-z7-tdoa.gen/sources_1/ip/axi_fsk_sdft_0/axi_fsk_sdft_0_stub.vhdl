-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Tue Apr  4 15:59:16 2023
-- Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/psf/TAUV-Playground/zybo-z7-tdoa/zybo-z7-tdoa/zybo-z7-tdoa.gen/sources_1/ip/axi_fsk_sdft_0/axi_fsk_sdft_0_stub.vhdl
-- Design      : axi_fsk_sdft_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axi_fsk_sdft_0 is
  Port ( 
    i_axis_clk : in STD_LOGIC;
    i_axis_rst : in STD_LOGIC;
    i_axis_in_tuser : in STD_LOGIC;
    i_axis_in_tvalid : in STD_LOGIC;
    o_axis_in_tready : out STD_LOGIC;
    i_axis_in_tlast : in STD_LOGIC;
    i_axis_in_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o_axis_out_tuser : out STD_LOGIC;
    o_axis_out_tvalid : out STD_LOGIC;
    i_axis_out_tready : in STD_LOGIC;
    o_axis_out_tlast : out STD_LOGIC;
    o_axis_out_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end axi_fsk_sdft_0;

architecture stub of axi_fsk_sdft_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_axis_clk,i_axis_rst,i_axis_in_tuser,i_axis_in_tvalid,o_axis_in_tready,i_axis_in_tlast,i_axis_in_tdata[31:0],o_axis_out_tuser,o_axis_out_tvalid,i_axis_out_tready,o_axis_out_tlast,o_axis_out_tdata[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_fsk_sdft_v1_0,Vivado 2022.2";
begin
end;
