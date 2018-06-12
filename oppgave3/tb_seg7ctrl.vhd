LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

 
ENTITY tb_seg7ctrl IS

END tb_seg7ctrl;
 
ARCHITECTURE behavior OF tb_seg7ctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg7ctrl is
		port
	(
	
	mclk : in std_logic;
	reset : in std_logic;
	d0 : in std_logic_vector(3 downto 0);
	d1 : in std_logic_vector(3 downto 0);
	d2 : in std_logic_vector(3 downto 0);
	d3 : in std_logic_vector(3 downto 0);
	--dec : out std_logic;
	abcdefgdec_n : out std_logic_vector(6 downto 0);
	a_n : out std_logic_vector(3 downto 0)

	);
end component;
 component seg7model is 
port
  (
    a_n           : in  std_logic_vector(3 downto 0);
    abcdefgdec_n  : in  std_logic_vector(6 downto 0);
    disp3         : out std_logic_vector(3 downto 0);
    disp2         : out std_logic_vector(3 downto 0);
    disp1         : out std_logic_vector(3 downto 0);
    disp0         : out std_logic_vector(3 downto 0)
  );
end component;
    
	signal mclk : std_logic;
	signal reset : std_logic;
	signal d0 : std_logic_vector(3 downto 0);
	signal d1 : std_logic_vector(3 downto 0);
	signal d2 : std_logic_vector(3 downto 0);
	signal d3 : std_logic_vector(3 downto 0);
	--dec : in std_logic_vector(3 downto 0);
	--dec : in std_logic;
	signal abcdefgdec_n:  std_logic_vector(6 downto 0);
	signal a_n :  std_logic_vector(3 downto 0);
	constant Half_Period : time := 10 ns;  --50Mhz klokkefrekvens
	
 	
BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
	uut: seg7ctrl PORT MAP(
	mclk => mclk, reset => reset, d0 => d0,d1 => d1,d2 => d2,d3 => d3, 
	abcdefgdec_n =>abcdefgdec_n,
	a_n =>a_n
	--dp => dp
	);	
	uut1: seg7model PORT MAP (
	abcdefgdec_n =>abcdefgdec_n,
	a_n =>a_n,
	 disp0 => d0,
	 disp1 => d1,
	 disp2 => d2,
         disp3 => d3
	);
	
    
 stim_proc: process
   begin		

          d0 <= "0010";
	  d1 <= "0010";
	  d2 <= "0010";
	  d3 <= "0010";
      wait for 150 ns;	
	
          d0 <= "0000" ;
	  d1 <= "0000" ;
	  d2 <= "0000" ;
          d3 <= "0000" ;
      wait for 300 ns;	
    
          d0 <= "0001" ;
	  d1 <= "0001" ;
	  d2 <= "0001" ;
	  d3 <= "0001" ;	 
    wait;
   end process;       


end behavior;
