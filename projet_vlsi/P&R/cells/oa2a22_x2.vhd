--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY oa2a22_x2 IS
PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  i3	: IN STD_LOGIC;
  q	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END oa2a22_x2;

ARCHITECTURE RTL OF oa2a22_x2 IS
BEGIN
  q <= ((i0 AND i1) OR (i2 AND i3));
END RTL;
