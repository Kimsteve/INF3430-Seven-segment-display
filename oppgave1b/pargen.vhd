
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pargen is 
  port (
    rst_n        : in  std_logic;
    mclk         : in  std_logic;
    indata1      : in  std_logic_vector(15 downto 0);
    indata2      : in  unsigned(15 downto 0);
    par          : out std_logic);  
end pargen;

architecture rtl1 of pargen is 
	--variable parity1, parity2 : std_logic; 
	function parity (signal indata1 : in std_logic_vector (15 downto 0)   ) return std_logic is
	 variable p1, p2, p3 : std_logic;
	   begin
		p1 := '0';
		for i in indata1'range loop
                    if indata1(i) = '1' then
                       p1 := not p1;
                    end if;        
              end loop;
		return p1;
	end function parity;

    	function parity ( signal indata2 : in  unsigned(15 downto 0)   ) return std_logic is
	 variable p1, p2, p3 : std_logic;
	  begin
		 p2 := '0';
      	    for j in indata2'range loop
                 p2 := p2 xor indata2(j); 
            end loop;
		-- p3 := p1 xor p2;
	    return p2;
	 end function parity;
   
	 
begin  
  process (rst_n, mclk) is  
	
  begin
    if (rst_n = '0') then       
     -- parity1 := '0';
     -- parity2 := '0';
      par <= '0';
    elsif rising_edge(mclk) then
    
		par <= parity(indata1)xor parity(indata2);
    end if;
  end process;
end rtl1;
