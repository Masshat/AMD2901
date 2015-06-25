library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity muxe is
  Port (
    i	: in std_logic_vector(8 downto 0);
    d	: in std_logic_vector(3 downto 0);
    Ra	: in std_logic_vector(3 downto 0);
    Rb	: in std_logic_vector(3 downto 0);
    q: in std_logic_vector(3 downto 0); 

    r: out std_logic_vector(3 downto 0);
    s: out std_logic_vector(3 downto 0)
    );
end muxe;

architecture behaviour of muxe is



begin


  with i(2 downto 0) select
  r <= ra     when o"0" | o"1" ,
       x"0"    when o"2" | o"3" | o"4" ,
       d       when others ;
  
  with i(2 downto 0) select
  s <= q  when o"0" | o"2" | o"6" ,
       rb       when o"1" | o"3" ,
       ra       when o"4" | o"5" ,
       x"0"     when others ;

end;
