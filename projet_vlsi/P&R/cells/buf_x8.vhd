--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY buf_x8 IS
PORT(
  i	: IN STD_LOGIC;
  q	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END buf_x8;

ARCHITECTURE RTL OF buf_x8 IS
BEGIN
  q <= i;
END RTL;
