--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nao22_x1 IS
PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END nao22_x1;

ARCHITECTURE RTL OF nao22_x1 IS
BEGIN
  nq <= NOT(((i0 OR i1) AND i2));
END RTL;
