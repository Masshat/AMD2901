--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mx2_x4 IS
PORT(
  cmd	: IN STD_LOGIC;
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  q	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END mx2_x4;

ARCHITECTURE RTL OF mx2_x4 IS
BEGIN
  q <= ((i1 AND cmd) OR (NOT(cmd) AND i0));
END RTL;