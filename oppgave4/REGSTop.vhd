----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity REGsTop is
    Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           INP : in  STD_LOGIC_VECTOR (3 downto 0);
           SWT : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN0 : in  STD_LOGIC;
           abcdefgdec_n : out  STD_LOGIC_VECTOR (6 downto 0);
           a_n : out  STD_LOGIC_VECTOR (3 downto 0));
end REGsTop;

architecture Behavioral of REGsTop is

	
	COMPONENT regctrl is
	Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           INP : in  STD_LOGIC_VECTOR (3 downto 0);
           SWT : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN0 : in  STD_LOGIC;
           DP0 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP1 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP2 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP3 : out  STD_LOGIC_VECTOR (3 downto 0)
		   );
	end component;
  
  COMPONENT seg7ctrl is
	port
	(
	mclk : in std_logic;
	reset : in std_logic;
	d0 : in std_logic_vector(3 downto 0);
	d1 : in std_logic_vector(3 downto 0);
	d2 : in std_logic_vector(3 downto 0);
	d3 : in std_logic_vector(3 downto 0);
	abcdefgdec_n: out std_logic_vector(6 downto 0);
	a_n : out std_logic_vector(3 downto 0)
	);
	end component;
	
	 signal DP0 :   STD_LOGIC_VECTOR (3 downto 0);
    signal DP1 :   STD_LOGIC_VECTOR (3 downto 0);
    signal DP2 :  STD_LOGIC_VECTOR (3 downto 0);
    signal DP3 :  STD_LOGIC_VECTOR (3 downto 0);
	
	begin
	uut2: regctrl PORT MAP(
	mclk => mclk, 
	reset => reset,
	INP => INP,
	SWT => SWT, 
	BTN0 => BTN0,
	DP0 => DP0,
	DP1=> DP1,
	DP2 => DP2,
	DP3 => DP3 
	);	
	
	uut3: seg7ctrl PORT MAP(
	mclk => mclk, 
	reset => reset,
	d0 => DP0,
	d1 => DP1,
	d2 => DP2,
	d3 => DP3,
	abcdefgdec_n => abcdefgdec_n,
	a_n => a_n 
	);
	
end Behavioral;

