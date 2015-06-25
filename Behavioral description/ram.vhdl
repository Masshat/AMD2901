library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
  Port (
    i	: in std_logic_vector(8 downto 0);
    a	: in std_logic_vector(3 downto 0);
    b	: in std_logic_vector(3 downto 0);
    alu_out : in std_logic_vector (3 downto 0); 

	Ra : out std_logic_vector(3 downto 0);
	Rb : out std_logic_vector(3 downto 0);
 	clk: in  std_logic;

    r0	: inout  std_logic;
    r3	: inout  std_logic
    );
end ram;

Architecture behaviour of ram is


SIGNAL sh_ram     : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal ram_en : std_logic;
	
type ram_type is array (0 to 15) of std_logic_vector (3 downto 0);
signal ram : ram_type;

begin

 ------------------------------------------------------ 
-------------------- la RAM --------------------------
------------------------------------------------------ 

-------------- SHIFTER - RAM 

with i(8 downto 6) select 
      sh_ram<=  alu_out when o"2"| o"3" ,
                r3 & alu_out(3 downto 1) when o"4" | o"5" ,--shift right
                alu_out(2 downto 0)& r0 when o"6" | o"7" ,--shift left
                sh_ram when others ;
                


 with i(8 downto 6) select
        ram_en<='0' when o"0"|o"1",
                '1' when others;


reg: process(clk)
  begin
    if rising_edge(clk) then
      if (ram_en='1') then
        ram(to_integer(unsigned(b)))<= sh_ram ;

      end if;

    end if;

  end process;

  ra<= ram(to_integer(unsigned(a)));
  rb<= ram(to_integer(unsigned(b)));

  r3<=alu_out(3) when (i(8 downto 6)= o"6" or i(8 downto 6)= o"7") else 'Z';
  r0<=alu_out(0) when (i(8 downto 6)= o"4" or i(8 downto 6)= o"5") else 'Z';

End;

