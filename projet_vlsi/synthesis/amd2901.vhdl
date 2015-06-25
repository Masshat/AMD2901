library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity amd2901 is
  Port (
    i	: in std_logic_vector(8 downto 0);
    d	: in std_logic_vector(3 downto 0);
    a	: in std_logic_vector(3 downto 0);
    b	: in std_logic_vector(3 downto 0);

    y	: out std_logic_vector (3 downto 0);
    noe	: in std_logic;

    clk	: in  std_logic;

    cin	: in  std_logic;
    ng	: out  std_logic;
    np	: out  std_logic;
    cout	: out  std_logic;
    ovr	: out  std_logic;
    zero	: out std_logic;
    sign	: out std_logic;

    q0	: inout  std_logic;
    q3	: inout  std_logic;
    r0	: inout  std_logic;
    r3	: inout  std_logic
    
   -- vdd	: in  std_logic;
    --vss	: in  std_logic
    );
end amd2901;

architecture behavior of amd2901 is

Component alu is
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
    sign	: out std_logic
    );
end component;

component muxe is
  Port (
    i	: in std_logic_vector(8 downto 0);
    d	: in std_logic_vector(3 downto 0);
    Ra	: in std_logic_vector(3 downto 0);
    Rb	: in std_logic_vector(3 downto 0);
    q: in std_logic_vector(3 downto 0); 

    r: out std_logic_vector(3 downto 0);
    s: out std_logic_vector(3 downto 0)
    );
end component;

component accu is
  Port (
    i	: in std_logic_vector(8 downto 0);
    alu_out: in std_logic_vector(3 downto 0);
    clk	: in  std_logic;
    q   : out std_logic_vector(3 downto 0);

    q0	: inout  std_logic;
    q3	: inout  std_logic   
    );
end component;

component ram is
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
end component;
component muxs is
  Port (
    i	: in std_logic_vector(8 downto 0);
    alu_out	: in std_logic_vector(3 downto 0);
    Ra	: in std_logic_vector(3 downto 0);
    noe	: in std_logic;

    y	: out std_logic_vector (3 downto 0)
    
    );
end component;

-- signal declaration
   signal alu_out: std_logic_vector(3 downto 0);

  
    signal Ra	:  std_logic_vector(3 downto 0);
    signal Rb	:  std_logic_vector(3 downto 0);
    signal r:  std_logic_vector(3 downto 0);
    signal s:  std_logic_vector(3 downto 0);
    signal q:  std_logic_vector(3 downto 0);
         
    signal qen :  std_logic; 
    signal ram_en :   std_logic;

begin
--explicit declaration just to be sure
ram_1 : ram port  map(
i => i,
a => a, 
b => b,
clk => clk, 
r0 => r0, 
r3 => r3, 
alu_out => alu_out,
Ra => Ra,
Rb => Rb
);

alu_1 : alu port map(
i => i,
r => r, 
s => s,
cin => cin, 
ng => ng,	
np => np, 	
cout => cout, 	
ovr => ovr,	
zero => zero,
sign => sign,	
alu_out => alu_out
);

muxe_1 : muxe port map(
i => i, 
d => d,
Ra => Ra, 
Rb => Rb, 
q => q,
r => r,
s => s 
);

muxs_1 : muxs port map(
i => i,
alu_out => alu_out,
Ra => Ra,
noe => noe, 
y => y
);

accu_1 : accu port map(
i => i, 
alu_out => alu_out,
clk => clk,
q => q,
q0 => q0,
q3 => q3 
);
    

end;
