library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accu is
  Port (
    i	: in std_logic_vector(8 downto 0);
    alu_out: in std_logic_vector(3 downto 0);

    clk	: in  std_logic;
   q   : out std_logic_vector(3 downto 0);

    q0	: inout  std_logic;
    q3	: inout  std_logic   
    );
end accu;

architecture behavior of accu is


SIGNAL q_temp    : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL sh_accu    : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL waccu      : STD_LOGIC;

Begin

  with i(8 downto 6) select
          waccu<='1' when o"0"|o"4"|o"6",
                 '0' when others;
          
          
------------definir data input to q register

  with i(8 downto 6) select
    sh_accu<= (q(2),q(1),q(0),q0) when o"6",--shift left
             (q3,q(3),q(2),q(1)) when o"4",--shift right
             sh_accu when others;
             
------------definir q0 and q3 :
		
  q3<=q_temp(3)when(i(8 downto 6)=o"7" or i(8 downto 6)=o"6")else 'Z';
  q0<=q_temp(0)when(i(8 downto 6)=o"5" or i(8 downto 6)=o"4")else 'Z';

  q <= q_temp;	
  process(clk)
  begin
    if rising_edge(clk) then
      if waccu ='1' then
        if i(8 downto 6)= o"0" then
          q_temp<=alu_out;
        else
          q_temp<=sh_accu;
        end if;
      end if;      
    end if;
  end process;

End;
