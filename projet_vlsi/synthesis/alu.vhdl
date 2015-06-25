library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  Port (
    i	: in std_logic_vector(8 downto 0);
    r	: in std_logic_vector(3 downto 0);
    s	: in std_logic_vector(3 downto 0); 
  cin	: in std_logic;

    alu_out: out std_logic_vector (3 downto 0);

    ng	: out  std_logic;
    np	: out  std_logic;
    cout	: out  std_logic;
    ovr	: out  std_logic;
    zero	: out std_logic;
    sign	: out std_logic;
vdd	: in  std_logic;
    vss	: in  std_logic
    );
end alu;


architecture behaviour of alu is

SIGNAL y_tmp      : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL alu_tmp    : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL P          : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL G          : STD_LOGIC_VECTOR (3 downto 0);
signal en         : std_logic_vector (15 DOWNTO 0);
SIGNAL C1         : STD_LOGIC;
SIGNAL C2         : STD_LOGIC;
SIGNAL C3         : STD_LOGIC;
SIGNAL C4         : STD_LOGIC;

SIGNAL cinv       : unsigned(3 DOWNTO 0);

begin

------------------------------------------------------ 
----------- Arithmetic AND Logic Unit ----------------
------------------------------------------------------ 

cinv <= not cin;
--cinv <= (0 => cin, others => '0');

--------------- ALU Control Function-------------------

with i(5 downto 3) select 
      alu_tmp <= STD_LOGIC_VECTOR((unsigned(r) + unsigned(s) + cinv)) when o"0",
                 STD_LOGIC_VECTOR ((unsigned(not r)+ unsigned(s) + cinv)) when  o"1",
                 STD_LOGIC_VECTOR ((unsigned(r) + unsigned(not s) + cinv)) when o"2",
                (r) or  (s) when o"3",
                (r) and  (s) when o"4",
                (not  (r))and  (s) when o"5",
                (r) xor  (s) when o"6",
                not( (r) xor  (s)) when others ;    

-------------CONTROL SIGNALS -----------------
-- P & G FLAGS

with i(5 DOWNTO 3) select
P <=   r or s     when "000"|"011"|"100"|"111",
       (not(r)) or s   when "001"|"101"|"110",
       r or (not (s))   when "010",
       X"0"    when others;
with i(5 DOWNTO 3) select
G <= r and s when "000"|"011"|"100"|"111",
     (not(r)) and s when "001"|"101"|"110",
     r and (not(s)) when "010",
     X"0" when others;

C4 <= G(3) or (p(3) and G(2))or(p(3) and p(2) and G(1)) or (p(3) and p(2) and p(1) and G(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
C3 <= G(2) or (p(2) and G(1)) or  (p(2) and p(1) and G(0)) or (p(2) and p(1) and p(0) and cin);
C2 <= G(1) or (G(0) and p(1)) or (p(1) and p(0) and cin); 
C1 <= G(0) or (cin and p(0));

with i(5 DOWNTO 3) select
  np <=   not(p(0) and p(1) and p(2) and p(3) ) when "000"|"001"|"010",
          G(0) or G(1) or G(2) or G(3) when "111"|"110",
          '0' when others;
with i(5 DOWNTO 3) select  
  ng <=   not(G(3) or(p(3) and G(2)) or (p(3) and p(2) and G(1)) or (p(0) and p(1) and p(2) and p(3) and G(0))) when "000"|"001"|"010",
          p(0) and p(1) and p(2) and p(3)  when "011",
          not(G(0) or G(1) or G(2) or G(3))  when "100"|"101",
    (p(3) and G(3)) or (p(3) and p(2) and G(2)) or (p(3) and p(2) and p(1) and G(1)) or (p(3) and p(2) and p(1) and p(0))  when "111"|"110",
          '0' when others;
         
-------------- CONTROL SIGNALS //flags ------------------------
          
with i(5 DOWNTO 3) select  
  cout <= C4 when "000"|"001"|"010",
          not(p(0) and p(1) and p(2) and p(3)) or cin when "011",
          G(0) or G(1) or G(2) or G(3) or cin when "100"|"101",
          (p(3) and G(3)) or (p(3) and p(2) and G(2)) or (p(3) and p(2) and p(1) and G(1)) or (p(3) and p(2) and p(1) and p(0) and G(0)) or (not     (cin)) when "111"|"110",
          '0' when others;
      
with i(5 DOWNTO 3) select  

  ovr <= C3 xor C4 when "000"|"001"|"010",
         not(p(0) and p(1) and p(2) and p(3)) or cin when "011",
         not(G(0) or G(1) or G(2) or G(3)) or not cin when "100"|"101",
         '0' when others;  

-------------------------------
sign<= alu_tmp(3);
-------------------------------
zero<='1' when alu_tmp="0000" else '0';
-------------------------------
alu_out <= alu_tmp;

end;



