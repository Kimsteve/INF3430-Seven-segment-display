
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regctrl is
    Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;  --BTN1
           INP : in  STD_LOGIC_VECTOR (3 downto 0);
			  SWT : in  STD_LOGIC_VECTOR (1 downto 0);
           BTN0 : in  STD_LOGIC;
           DP0 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP1 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP2 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP3 : out  STD_LOGIC_VECTOR (3 downto 0));
end regctrl;

architecture Behavioral of regctrl is

begin
 process ( BTN0, SWT)
 begin
 if rising_edge(mclk) then
	if BTN0 = '1' THEN
 	case SWT IS
		
		WHEN "00" =>  DP0 <=  INP;
		WHEN "01" =>  DP1 <=  INP;
		WHEN "10" =>  DP2 <=  INP;
		WHEN others => DP3 <= INP;
	
	end case;
	END IF;
  end if;
  end process;


end Behavioral;

