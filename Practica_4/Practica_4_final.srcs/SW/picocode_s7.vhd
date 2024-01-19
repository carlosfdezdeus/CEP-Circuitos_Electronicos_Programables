--
-------------------------------------------------------------------------------------------
-- Copyright � 2010-2013, Xilinx, Inc.
-- This file contains confidential and proprietary information of Xilinx, Inc. and is
-- protected under U.S. and international copyright and other intellectual property laws.
-------------------------------------------------------------------------------------------
--
-- Disclaimer:
-- This disclaimer is not a license and does not grant any rights to the materials
-- distributed herewith. Except as otherwise provided in a valid license issued to
-- you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
-- MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
-- DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
-- INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
-- OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
-- (whether in contract or tort, including negligence, or under any other theory
-- of liability) for any loss or damage of any kind or nature related to, arising
-- under or in connection with these materials, including for any direct, or any
-- indirect, special, incidental, or consequential loss or damage (including loss
-- of data, profits, goodwill, or any type of loss or damage suffered as a result
-- of any action brought by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-safe, or for use in any
-- application requiring fail-safe performance, such as life-support or safety
-- devices or systems, Class III medical devices, nuclear facilities, applications
-- related to the deployment of airbags, or any other applications that could lead
-- to death, personal injury, or severe property or environmental damage
-- (individually and collectively, "Critical Applications"). Customer assumes the
-- sole risk and liability of any use of Xilinx products in Critical Applications,
-- subject only to applicable laws and regulations governing limitations on product
-- liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------------------
--
--
-- Production definition of a 1K program for KCPSM6 in a 7-Series device using a 
-- RAMB18E1 primitive.
--
-- Note: The complete 12-bit address bus is connected to KCPSM6 to facilitate future code 
--       expansion with minimum changes being required to the hardware description. 
--       Only the lower 10-bits of the address are actually used for the 1K address range
--       000 to 3FF hex.  
--
-- Program defined by '{psmname}.psm'.
--
-- Generated by KCPSM6 Assembler: {timestamp}. 
--
-- Assembler used ROM_form template: ROM_form_7S_1K_14March13.vhd
--
--
-- Standard IEEE libraries
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
--  
library unisim;
use unisim.vcomponents.all;
--
--
entity picocode_s7 is
    Port (      address : in std_logic_vector(9 downto 0);
            instruction : out std_logic_vector(17 downto 0);
--                 enable : in std_logic;
                    clk : in std_logic);
    end picocode_s7;
--
architecture low_level_definition of picocode_s7 is
--
signal  address_a : std_logic_vector(13 downto 0);
signal  data_in_a : std_logic_vector(17 downto 0);
signal data_out_a : std_logic_vector(17 downto 0);
signal  address_b : std_logic_vector(13 downto 0);
signal  data_in_b : std_logic_vector(17 downto 0);
signal data_out_b : std_logic_vector(17 downto 0);
signal   enable_b : std_logic;
signal      clk_b : std_logic;
signal       we_b : std_logic_vector(3 downto 0);
signal     enable : std_logic;
--
begin
--
  enable <= '1';
  address_a <= address & "1111";
  instruction <= data_out_a(17 downto 0);
  data_in_a <= "000000000000000000";
  --
  address_b <= "11111111111111";
  data_in_b <= data_out_b(17 downto 0);
  enable_b <= '0';
  we_b <= "0000";
  clk_b <= '0';
  --
  --
  -- 
  kcpsm6_rom: RAMB18E1
  generic map ( READ_WIDTH_A => 18,
                WRITE_WIDTH_A => 18,
                DOA_REG => 0,
                INIT_A => "000000000000000000",
                RSTREG_PRIORITY_A => "REGCE",
                SRVAL_A => X"000000000000000000",
                WRITE_MODE_A => "WRITE_FIRST",
                READ_WIDTH_B => 18,
                WRITE_WIDTH_B => 18,
                DOB_REG => 0,
                INIT_B => X"000000000000000000",
                RSTREG_PRIORITY_B => "REGCE",
                SRVAL_B => X"000000000000000000",
                WRITE_MODE_B => "WRITE_FIRST",
                INIT_FILE => "NONE",
                SIM_COLLISION_CHECK => "ALL",
                RAM_MODE => "TDP",
                RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
                SIM_DEVICE => "7SERIES",
                INIT_00 => X"50DC4F000054C001CF09CF08CF07CF06CF05CF04CF03CF02CF01CF000F000700",
                INIT_01 => X"0F04CE0E0E96541A2F024F07CF0D0F00CF0D0F01400D10D0460110C54600405F",
                INIT_02 => X"0F01542C2F024F07CF0D0F00CF0D0F04CE0E0E0054232F024F07CF0D0F00CF0D",
                INIT_03 => X"0F00543C2F024F07CF0D0F00CF0D0F04CE0E0E9754332F024F07CF0D0F00CF0D",
                INIT_04 => X"4F07CF0D0F00CF0D0F08CF100F01440654452F024F07CF0D0F00CF0D0F08CF10",
                INIT_05 => X"0078A000405E0F00405E0F01405A505C4400405A50574500A0004506544F2F02",
                INIT_06 => X"009C1FB01AF0009C1FA000EC12F0009C1F2013F0009C1F3011F0009C1F10008D",
                INIT_07 => X"408054844F00BF701F400780B5F00FF840111DF0009C1FD01CF0009C1FC01BF0",
                INIT_08 => X"010002000300A000A4008501F4F0F5F00FFF040005060601408C040005060600",
                INIT_09 => X"50B34F0150B14F00A0001140840A409582015899C40A8464409083015894C464",
                INIT_0A => X"50C34F0950C14F0850BF4F0750BD4F0650BB4F0550B94F0450B74F0350B54F02",
                INIT_0B => X"0FE040B00FBE40B00FB640B00F6640B00FF740B00FDA40B00F6040B00FFCA000",
                INIT_0C => X"4015CD02CC03CB04CA05C1068101C207C308CF090F0040B00FE640B00FFE40B0",
                INIT_0D => X"CF07CF08CF090F004015CD02CC03CB04CA05C1068101C207CF080F00CF090F02",
                INIT_0E => X"0D010C010B010A014015CF020F00CF030F00CF040F00CF050FFCCF068F010FFC",
                INIT_0F => X"51174C01510D4B0151034A0154F64700C70195F01F50050E050E050E050E0709",
                INIT_10 => X"0B0E0B0E1B5040F61F500709B5F00F0F0A0E0A0E0A0E0A0E1A50A00051214D01",
                INIT_11 => X"1F500709B5F00F0F0C0E0C0E0C0E0C0E1C5040F61F500709B5F00F0F0B0E0B0E",
                INIT_12 => X"412E8001552F4900490041021F50070AB5F00F0F0D0E0D0E0D0E0D0E1D5040F6",
                INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
                INIT_3F => X"412B000000000000000000000000000000000000000000000000000000000000",
               INITP_00 => X"F400CC30C3330C33ECCF7D8D2220D22234888D2234888D2223488F77DFAAAAA0",
               INITP_01 => X"DDDD52A800E22224A8EAA688EAA6A33333333332DDDDDDDDDD8775DD025028E8",
               INITP_02 => X"0000000000000000000000000000000000000000FD300AA300AA300AA300AA2D",
               INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
               INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
               INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
               INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
               INITP_07 => X"C000000000000000000000000000000000000000000000000000000000000000")
  port map(   ADDRARDADDR => address_a,
                  ENARDEN => enable,
                CLKARDCLK => clk,
                    DOADO => data_out_a(15 downto 0),
                  DOPADOP => data_out_a(17 downto 16), 
                    DIADI => data_in_a(15 downto 0),
                  DIPADIP => data_in_a(17 downto 16), 
                      WEA => "00",
              REGCEAREGCE => '0',
            RSTRAMARSTRAM => '0',
            RSTREGARSTREG => '0',
              ADDRBWRADDR => address_b,
                  ENBWREN => enable_b,
                CLKBWRCLK => clk_b,
                    DOBDO => data_out_b(15 downto 0),
                  DOPBDOP => data_out_b(17 downto 16), 
                    DIBDI => data_in_b(15 downto 0),
                  DIPBDIP => data_in_b(17 downto 16), 
                    WEBWE => we_b,
                   REGCEB => '0',
                  RSTRAMB => '0',
                  RSTREGB => '0');
--
--
end low_level_definition;
--
------------------------------------------------------------------------------------
--
-- END OF FILE picocode_s7.vhd
--
------------------------------------------------------------------------------------
