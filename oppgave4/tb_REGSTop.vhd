LIBRARY ieee;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

 
ENTITY tb_REGSTop IS

END tb_REGSTop;
 
ARCHITECTURE behavior OF tb_REGSTop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REGSTop is

	Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           INP : in  STD_LOGIC_VECTOR (3 downto 0);
           SWT : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN0 : in  STD_LOGIC;
           abcdefgdec_n : out  STD_LOGIC_VECTOR (6 downto 0);
           a_n : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

COMPONENT seg7model  is
  port
  (
    a_n           : in  std_logic_vector(3 downto 0);
    abcdefgdec_n  : in  std_logic_vector(6 downto 0);
    disp3         : out std_logic_vector(3 downto 0);
    disp2         : out std_logic_vector(3 downto 0);
    disp1         : out std_logic_vector(3 downto 0);
    disp0         : out std_logic_vector(3 downto 0)
  );
end COMPONENT;
    
	signal mclk : std_logic:= '0'; 
	signal reset : std_logic:= '0';
	signal INP : std_logic_vector(3 downto 0);
	signal SWT : std_logic_vector(1 downto 0);
	signal BTN0 : std_logic;
	signal abcdefgdec_n:  std_logic_vector(6 downto 0);
	signal a_n :  std_logic_vector(3 downto 0);
	signal disp3 :  std_logic_vector(3 downto 0);
	signal disp2 :  std_logic_vector(3 downto 0); 
	signal disp1 :  std_logic_vector(3 downto 0);
	signal disp0 :  std_logic_vector(3 downto 0);
	
	constant Half_Period : time := 10 ns;  --50Mhz klokkefrekvens
	--constant clk_period : time := 1 ns;
	
 	
BEGIN
	
		-- Instantiate the Unit Under Test (UUT)
	uut: REGSTop PORT MAP(
		mclk => mclk,
		reset => reset, 
		INP => INP, 
		SWT => SWT, 
		BTN0 => BTN0, 
		abcdefgdec_n =>abcdefgdec_n,
		a_n =>a_n
		);
		
		
			uut1: seg7model PORT MAP(
	 a_n => a_n,        
   abcdefgdec_n  =>abcdefgdec_n,
   disp3 => disp3,
   disp2 => disp2,
   disp1 =>disp1, 
   disp0 =>disp0 
		);

mclk <= not mclk after Half_Period;	

 stim_proc: process
  begin                
    
   reset <= '1', '0' after 10 ns;
   BTN0 <= '1', '0' after 150 ns; 
   SWT <= "00" after 50 ns;  
   INP <= "0000", "0001" after 300 ns;
   
   wait for  600 ns;
   SWT <= "01" after 50 ns;
   BTN0 <= '1', '0' after 150 ns;  
   INP <= "0010", "0011" after 300 ns;
   
   WAIT FOR 1 us;
 	
    wait;  
   end process;    
		 
end behavior;
