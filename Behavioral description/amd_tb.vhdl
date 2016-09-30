library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


--library work;
--use work.amd_iss.all;

--  A testbench has no ports.
entity amd_tb is
end amd_tb;

architecture behav of amd_tb is
	--  Declaration of the component that will be instantiated.
	component amd2901
	Port (
		i		:	in std_logic_vector(8 downto 0);
		d		:	in std_logic_vector(3 downto 0);
		a		:	in std_logic_vector(3 downto 0);
		b		:	in std_logic_vector(3 downto 0);

		y		:	out std_logic_vector (3 downto 0);
		noe 	:	in std_logic;

		clk	:	in  std_logic;

		cin	:	in  std_logic;
		ng		:	out  std_logic;
		np		:	out  std_logic;
		cout	:	out  std_logic;
		ovr	:	out  std_logic;
		zero	:	out std_logic;
		sign	:	out std_logic;

		q0		:	inout  std_logic;
		q3		:	inout  std_logic;
		r0		:	inout  std_logic;
		r3		:	inout  std_logic);
	end component;

	signal i		: std_logic_vector(8 downto 0);
	signal d		: std_logic_vector(3 downto 0);
	signal a		: std_logic_vector(3 downto 0);
	signal b		: std_logic_vector(3 downto 0);

	signal y		: std_logic_vector (3 downto 0);
	signal noe 	: std_logic;

	signal clk	: std_logic;

	signal cin	: std_logic;
	signal ng	: std_logic;
	signal np	: std_logic;
	signal cout	: std_logic;
	signal ovr	: std_logic;
	signal zero	: std_logic;
	signal sign	: std_logic;

	signal q0	: std_logic;
	signal q3	: std_logic;
	signal r0	: std_logic;
	signal r3	: std_logic;
--temp

	type std_logic_v4 is array(3 downto 0) of std_logic;
	type std_logic_v9 is array(8 downto 0) of std_logic;

type AMD_PORT is record
                a : std_logic_v4;
                b : std_logic_v4;
                d : std_logic_v4;
                i : std_logic_v9;
                cin : std_logic;
                r0 : std_logic;
                r3 : std_logic;
                q0 : std_logic;
                q3 : std_logic;
                noe : std_logic;
                y : std_logic_v4;
                cout : std_logic;
                np : std_logic;
                ng : std_logic;
                sign : std_logic;
                zero : std_logic;
                ovr : std_logic;
        end record;

	procedure amd_run (i : AMD_PORT) is
	--function amd_run (i : AMD_IN) return AMD_OUT is
	begin
--		assert false severity failure;
	end amd_run;

	function gen_alea_input return AMD_PORT is
		variable alea_std : std_logic_vector (31 downto 0);
		variable val_in : AMD_PORT;
		variable raand: real; -- random real-number in range 0 to 1.0
		variable rand_num: integer :=0;
		variable range_of_rand: real :=1000.0;
		variable seed1, seed2: positive;

	begin
		--alea_std := std_logic_vector(TO_UNSIGNED (rand, 32));

		uniform(seed1, seed2, raand); --generate random number.
		rand_num := integer(raand*range_of_rand); --rescale to 0..1000, convert integer part.
		alea_std := std_logic_vector(TO_UNSIGNED (rand_num, 32));

		val_in.a := std_logic_v4(alea_std(3 downto 0));
		val_in.b := std_logic_v4(alea_std(7 downto 4));
		val_in.d := std_logic_v4(alea_std(11 downto 8));
		val_in.i := std_logic_v9(alea_std(20 downto 12));
		val_in.cin := alea_std(21);

		if ( (val_in.i(8 downto 6) = O"4") or (val_in.i(8 downto 6) = O"5")) then
			val_in.q3 := alea_std(22);
			val_in.r3 := alea_std(23);
		else
			val_in.q3 := 'Z';
			val_in.r3 := 'Z';
		end if;

		if ( (val_in.i(8 downto 6) = O"6") or (val_in.i(8 downto 6) = O"7")) then
			val_in.q0 := alea_std(24);
			val_in.r0 := alea_std(25);
		else
			val_in.q0 := 'Z';
			val_in.r0 := 'Z';
		end if;

		val_in.noe := alea_std(26);

		return val_in;
	end gen_alea_input;
--end temp
	--  Specifies which entity is bound with the component.

	begin
	--  Component instantiation.
	amd2901_vhdl : amd2901 
	port map (	i		=> i,
					d		=> d,
					a		=> a,
					b		=> b,
					       
					y		=> y,
					noe 	=> noe ,
					       
					clk	=> clk,
					       
					cin	=> cin,
					ng		=> ng,
					np		=> np,
					cout	=> cout,
					ovr	=> ovr,
					zero	=> zero,
					sign	=> sign,
					       
					q0		=> q0,
					q3		=> q3,
					r0		=> r0,
					r3		=> r3);

process

variable val_port : AMD_port;

begin
	--  Initialisation RAM et ACCU
	a <= X"0";
	i <= O"337";
	noe <= '0';
	cin <= '0';
	for bi in 0 to 15 loop
		d <= std_logic_vector(to_unsigned(bi, 4));
		b <= std_logic_vector(to_unsigned(bi, 4));
		clk <= '0';
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;
	end loop;

	i <= O"007";
	d <= X"F";
	clk <= '0';
	wait for 2 ns;
	clk <= '1';
	wait for 2 ns;

	-- Boucle principale du test
	for indice in 1 to 100 loop
		clk <= '0';
		val_port := gen_alea_input;
		a <= std_logic_vector(val_port.a);
		b <= std_logic_vector(val_port.b);
		d <= std_logic_vector(val_port.d);
		i <= std_logic_vector(val_port.i);
		cin <= val_port.cin;
		r0 <= val_port.r0;
		r3 <= val_port.r3;
		q0 <= val_port.q0;
		q3 <= val_port.q3;
		noe <= val_port.noe;
		amd_run(val_port);
		wait for 1 ns;
		-- Comparaison des deux modeles
		assert y = std_logic_vector(val_port.y) report "Difference pour Y" severity note;

		wait for 1 ns;
		clk <= '1';
		wait for 2 ns;
	end loop;

assert false report "end of test" severity note;
wait;
end process;
end behav;
