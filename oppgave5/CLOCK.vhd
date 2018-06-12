
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity CLOCK is
    Port ( mclk : in  STD_LOGIC;
           reset : in  STD_LOGIC;  --BTN1
           start : in  STD_LOGIC; --BTN0
           stop : in  STD_LOGIC; --BTN2
           DP0 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP1 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP2 : out  STD_LOGIC_VECTOR (3 downto 0);
           DP3 : out  STD_LOGIC_VECTOR (3 downto 0)
	  );
		
end CLOCK;

architecture Behavioral of CLOCK is

signal TDP3, TDP2, TDP1, TDP0 : STD_LOGIC_VECTOR (3 downto 0);
signal CARRY3, CARRY2, CARRY1: STD_LOGIC;
signal count : integer :=0;
signal clk : std_logic :='0';
signal startstop : std_logic:='0';

begin
 process(mclk, reset)
  begin
    if reset = '1' then 
      count <= 0;
    elsif(mclk'event and mclk='1') then
      count <=count+1;
       clk <= '0';
	   if(count = 50000000) then
         count <=1;
         clk  <='1'; 
      end if;
     end if;
 end process; 
     
   
   process( clk, reset, startstop)
     begin
     IF reset = '1' then
            TDP0 <= "0000";		
	  elsif (clk'event  and clk ='1') then
		 if startstop = '1' then
				TDP0 <= TDP0 + 1;
		 end if; 
       if  TDP0 = "1001" then
           TDP0 <= "0000";
           CARRY1 <='1';
       else 
           CARRY1 <='0';
       end if; 
    end if; 
  end process;   
 
   process( CARRY1, reset, startstop)
     begin
     IF reset = '1' then
          TDP1 <= "0000";
	   elsif (CARRY1'event  and CARRY1='1') then
           TDP1 <= TDP1 + 1;
         if  TDP1 = "1001" then
           TDP1 <= "0000";
           CARRY2 <='1'; 
         else 
            CARRY2 <='0';
         end if; 
      end if; 
  end process;     
   
   process(CARRY2, reset, startstop)
     begin
     IF reset = '1' then
          TDP2 <= "0000";     
	  elsif (CARRY2'event  and CARRY2='1') then
         TDP2 <= TDP2 + 1;
         if  TDP2 = "1001" then
           TDP2 <= "0000";
           CARRY3 <='1';
        else 
            CARRY3 <='0';
        end if; 
     end if; 
  end process;     
    
    
  process(CARRY3, reset)
     begin
       IF reset = '1' then
          TDP3 <= "0000";  
		 elsif (CARRY3'event and CARRY3='1') then
         TDP3 <= TDP3 + 1;
         if  TDP3 = "1001" then
           TDP3 <= "0000"; 
        --else 
          --null; 
        end if; 
      end if; 
  end process; 
  
 process(start, stop)
	begin
		if start = '1' and stop = '0' then 
			startstop <= '1';
		elsif stop = '1' and start = '0' then 
			startstop <= '0';
		end if;
end process;	
    
    DP3 <= TDP3;
    DP2 <= TDP2;
    DP1 <= TDP1;
    DP0 <= TDP0;  
    
end Behavioral;

