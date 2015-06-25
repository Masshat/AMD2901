--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY inv_x1 IS
PORT(
  i	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END inv_x1;

ARCHITECTURE RTL OF inv_x1 IS
BEGIN
  nq <= NOT(i);
END RTL;
