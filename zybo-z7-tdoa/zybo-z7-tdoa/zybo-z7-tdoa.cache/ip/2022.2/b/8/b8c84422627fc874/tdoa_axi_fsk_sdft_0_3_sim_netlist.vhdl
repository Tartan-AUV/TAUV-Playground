-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Tue Apr  4 16:03:39 2023
-- Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ tdoa_axi_fsk_sdft_0_3_sim_netlist.vhdl
-- Design      : tdoa_axi_fsk_sdft_0_3
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0 is
  port (
    o_axis_out_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_axis_out_tvalid : out STD_LOGIC;
    i_axis_in_tvalid : in STD_LOGIC;
    i_axis_in_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_axis_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0 is
  signal \^o_axis_out_tvalid\ : STD_LOGIC;
  signal out_valid_i_1_n_0 : STD_LOGIC;
begin
  o_axis_out_tvalid <= \^o_axis_out_tvalid\;
\out_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(0),
      Q => o_axis_out_tdata(0),
      R => '0'
    );
\out_data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(10),
      Q => o_axis_out_tdata(10),
      R => '0'
    );
\out_data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(11),
      Q => o_axis_out_tdata(11),
      R => '0'
    );
\out_data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(12),
      Q => o_axis_out_tdata(12),
      R => '0'
    );
\out_data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(13),
      Q => o_axis_out_tdata(13),
      R => '0'
    );
\out_data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(14),
      Q => o_axis_out_tdata(14),
      R => '0'
    );
\out_data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(15),
      Q => o_axis_out_tdata(15),
      R => '0'
    );
\out_data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(16),
      Q => o_axis_out_tdata(16),
      R => '0'
    );
\out_data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(17),
      Q => o_axis_out_tdata(17),
      R => '0'
    );
\out_data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(18),
      Q => o_axis_out_tdata(18),
      R => '0'
    );
\out_data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(19),
      Q => o_axis_out_tdata(19),
      R => '0'
    );
\out_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(1),
      Q => o_axis_out_tdata(1),
      R => '0'
    );
\out_data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(20),
      Q => o_axis_out_tdata(20),
      R => '0'
    );
\out_data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(21),
      Q => o_axis_out_tdata(21),
      R => '0'
    );
\out_data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(22),
      Q => o_axis_out_tdata(22),
      R => '0'
    );
\out_data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(23),
      Q => o_axis_out_tdata(23),
      R => '0'
    );
\out_data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(24),
      Q => o_axis_out_tdata(24),
      R => '0'
    );
\out_data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(25),
      Q => o_axis_out_tdata(25),
      R => '0'
    );
\out_data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(26),
      Q => o_axis_out_tdata(26),
      R => '0'
    );
\out_data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(27),
      Q => o_axis_out_tdata(27),
      R => '0'
    );
\out_data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(28),
      Q => o_axis_out_tdata(28),
      R => '0'
    );
\out_data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(29),
      Q => o_axis_out_tdata(29),
      R => '0'
    );
\out_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(2),
      Q => o_axis_out_tdata(2),
      R => '0'
    );
\out_data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(30),
      Q => o_axis_out_tdata(30),
      R => '0'
    );
\out_data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(31),
      Q => o_axis_out_tdata(31),
      R => '0'
    );
\out_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(3),
      Q => o_axis_out_tdata(3),
      R => '0'
    );
\out_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(4),
      Q => o_axis_out_tdata(4),
      R => '0'
    );
\out_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(5),
      Q => o_axis_out_tdata(5),
      R => '0'
    );
\out_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(6),
      Q => o_axis_out_tdata(6),
      R => '0'
    );
\out_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(7),
      Q => o_axis_out_tdata(7),
      R => '0'
    );
\out_data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(8),
      Q => o_axis_out_tdata(8),
      R => '0'
    );
\out_data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => i_axis_in_tvalid,
      D => i_axis_in_tdata(9),
      Q => o_axis_out_tdata(9),
      R => '0'
    );
out_valid_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^o_axis_out_tvalid\,
      I1 => i_axis_in_tvalid,
      O => out_valid_i_1_n_0
    );
out_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_axis_clk,
      CE => '1',
      D => out_valid_i_1_n_0,
      Q => \^o_axis_out_tvalid\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "tdoa_axi_fsk_sdft_0_3,axi_fsk_sdft_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_fsk_sdft_v1_0,Vivado 2022.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of i_axis_clk : signal is "xilinx.com:signal:clock:1.0 i_axis_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of i_axis_clk : signal is "XIL_INTERFACENAME i_axis_clk, ASSOCIATED_RESET i_axis_rst, ASSOCIATED_BUSIF AXIS_IN:AXIS_OUT, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_axis_in_tlast : signal is "xilinx.com:interface:axis:1.0 AXIS_IN TLAST";
  attribute X_INTERFACE_INFO of i_axis_in_tuser : signal is "xilinx.com:interface:axis:1.0 AXIS_IN TUSER";
  attribute X_INTERFACE_INFO of i_axis_in_tvalid : signal is "xilinx.com:interface:axis:1.0 AXIS_IN TVALID";
  attribute X_INTERFACE_INFO of i_axis_out_tready : signal is "xilinx.com:interface:axis:1.0 AXIS_OUT TREADY";
  attribute X_INTERFACE_INFO of i_axis_rst : signal is "xilinx.com:signal:reset:1.0 i_axis_rst RST";
  attribute X_INTERFACE_PARAMETER of i_axis_rst : signal is "XIL_INTERFACENAME i_axis_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of o_axis_in_tready : signal is "xilinx.com:interface:axis:1.0 AXIS_IN TREADY";
  attribute X_INTERFACE_INFO of o_axis_out_tlast : signal is "xilinx.com:interface:axis:1.0 AXIS_OUT TLAST";
  attribute X_INTERFACE_INFO of o_axis_out_tuser : signal is "xilinx.com:interface:axis:1.0 AXIS_OUT TUSER";
  attribute X_INTERFACE_INFO of o_axis_out_tvalid : signal is "xilinx.com:interface:axis:1.0 AXIS_OUT TVALID";
  attribute X_INTERFACE_INFO of i_axis_in_tdata : signal is "xilinx.com:interface:axis:1.0 AXIS_IN TDATA";
  attribute X_INTERFACE_PARAMETER of i_axis_in_tdata : signal is "XIL_INTERFACENAME AXIS_IN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of o_axis_out_tdata : signal is "xilinx.com:interface:axis:1.0 AXIS_OUT TDATA";
  attribute X_INTERFACE_PARAMETER of o_axis_out_tdata : signal is "XIL_INTERFACENAME AXIS_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_1_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  o_axis_in_tready <= \<const0>\;
  o_axis_out_tlast <= \<const0>\;
  o_axis_out_tuser <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0
     port map (
      i_axis_clk => i_axis_clk,
      i_axis_in_tdata(31 downto 0) => i_axis_in_tdata(31 downto 0),
      i_axis_in_tvalid => i_axis_in_tvalid,
      o_axis_out_tdata(31 downto 0) => o_axis_out_tdata(31 downto 0),
      o_axis_out_tvalid => o_axis_out_tvalid
    );
end STRUCTURE;
