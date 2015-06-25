library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity muxs is
  Port (
    i	: in std_logic_vector(8 downto 0);
    alu_out	: in std_logic_vector(3 downto 0);
    Ra	: in std_logic_vector(3 downto 0);
    noe	: in std_logic;

    y	: out std_logic_vector (3 downto 0);
vdd	: in  std_logic;
    vss	: in  std_logic
    
    );
end muxs;

architecture behaviour of muxs is
SIGNAL y_tmp      : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin

 y_tmp<=ra when i(8 downto 6)= o"2" else alu_out;
  y<=y_tmp when noe='0' else "ZZZZ";
end;

 

