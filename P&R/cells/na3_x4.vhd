--
-- Generated by VASY
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY na3_x4 IS
PORT(
  i0	: IN STD_LOGIC;
  i1	: IN STD_LOGIC;
  i2	: IN STD_LOGIC;
  nq	: OUT STD_LOGIC;
  vdd	: IN STD_LOGIC;
  vss	: IN STD_LOGIC
);
END na3_x4;

ARCHITECTURE RTL OF na3_x4 IS
BEGIN
  nq <= NOT(((i0 AND i1) AND i2));
END RTL;